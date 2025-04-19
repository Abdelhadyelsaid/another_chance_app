import 'dart:developer';
import 'package:another_chance/Core/Helper/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../Model/make_order_model.dart';
import '../View/Screens/thanks_screen.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of<ProductCubit>(context);
  DocumentSnapshot? productSnapshot;
  int productCount = 1;

  void increaseProductCount() {
    productCount++;
    emit(ChangeProductCountState());
  }

  void decreaseProductCount() {
    if (productCount > 1) {
      productCount--;
      emit(ChangeProductCountState());
    }
  }

  Future<void> getProductDetails({required String productId}) async {
    try {
      emit(GetProductByIdLoading());
      productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .get();

      log("This is products:${[productSnapshot]}");
      emit(GetProductByIdSuccess());
    } on FirebaseException catch (e) {
      log(e.toString());
      emit(GetProductByIdError());
      throw Exception("failed to get product details");
    }
  }

  /// get Cart products
  List<Map<String, dynamic>> cartProducts = [];

  Future<void> getCartProducts() async {
    try {
      emit(GetCartProductsLoading());
      String userId = CacheHelper.getData(key: "userID");

      // Get the user's cart document
      DocumentSnapshot cartSnapshot = await _cart.doc(userId).get();

      if (!cartSnapshot.exists) {
        cartProducts = [];
        emit(GetCartProductsSuccess());
        return;
      }

      // Extract product IDs from the cart
      Map<String, dynamic>? cartData =
          cartSnapshot.data() as Map<String, dynamic>?;
      List<dynamic> items = cartData?['items'] ?? [];

      List<String> productIds = items
          .map((item) => item['productId'] as String?)
          .where((id) => id != null)
          .cast<String>()
          .toList();

      if (productIds.isEmpty) {
        cartProducts = [];
        emit(GetCartProductsSuccess());
        return;
      }

      // Fetch product details from Firestore
      QuerySnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      cartProducts = productSnapshot.docs
          .map((doc) => {
                'productId': doc.id,
                ...doc.data() as Map<String, dynamic>,
                'quantity': items.firstWhere(
                    (item) => item['productId'] == doc.id)['quantity'],
              })
          .toList();

      log("Fetched ${cartProducts.length} cart products");
      emit(GetCartProductsSuccess());
    } on FirebaseException catch (e) {
      log(e.toString());
      emit(GetCartProductsError());
      throw Exception("Failed to get cart products");
    }
  }

  final CollectionReference _cart =
      FirebaseFirestore.instance.collection('cart');

  Future<void> addProductToCart(String productId, int quantity) async {
    try {
      emit(AddProductToCartLoading());
      String userId = CacheHelper.getData(key: "userID");

      // Reference to the user's cart document using userId as the document ID
      DocumentReference cartRef = _cart.doc(userId);

      // Check if the user's cart exists
      DocumentSnapshot cartSnapshot = await cartRef.get();

      if (cartSnapshot.exists) {
        // If cart exists, get current items
        Map<String, dynamic> cartData =
            cartSnapshot.data() as Map<String, dynamic>;
        List<dynamic> items = List.from(cartData['items'] ?? []);

        // Check if the product already exists in the cart
        int existingIndex =
            items.indexWhere((item) => item['productId'] == productId);

        if (existingIndex != -1) {
          // If product exists, update its quantity
          items[existingIndex]['quantity'] += quantity;
        } else {
          // If product does not exist, add new item
          items.add({
            'productId': productId,
            'quantity': quantity,
            'createdAt': Timestamp.now(),
          });
        }

        // Update cart in Firestore
        await cartRef.update({'items': items});
      } else {
        // If no cart exists, create a new cart document
        await cartRef.set({
          'userId': userId,
          'items': [
            {
              'productId': productId,
              'quantity': quantity,
              'createdAt': Timestamp.now(),
            }
          ],
          'createdAt': Timestamp.now(),
        });
      }

      emit(AddProductToCartSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddProductToCartError());
      throw Exception("Failed to add product to cart");
    }
  }

  /// delete product from cart
  Future<void> deleteProductFromCart(String productId) async {
    try {
      emit(DeleteProductFromCartLoading());
      String userId = CacheHelper.getData(key: "userID");

      // Fetch the user's cart document
      DocumentReference cartRef = _cart.doc(userId);
      DocumentSnapshot cartSnapshot = await cartRef.get();

      if (!cartSnapshot.exists) {
        emit(DeleteProductFromCartSuccess());
        return;
      }

      // Extract current cart data
      Map<String, dynamic>? cartData =
          cartSnapshot.data() as Map<String, dynamic>?;
      List<dynamic> items = cartData?['items'] ?? [];

      // Filter out the product to be deleted
      List<dynamic> updatedItems =
          items.where((item) => item['productId'] != productId).toList();

      // Update Firestore
      await cartRef.update({'items': updatedItems});
      emit(DeleteProductFromCartSuccess());

      getCartProducts();
    } catch (e) {
      log(e.toString());
      emit(DeleteProductFromCartError());
      throw Exception(
          "Failed to delete product from cart ====> ${e.toString()}");
    }
  }

  /// make order

  final CollectionReference _order =
      FirebaseFirestore.instance.collection('orders');

  Future<int> _generateIncrementalOrderId() async {
    try {
      // Get the document with the highest orderId inside the 'data' field
      final orderIdDoc =
          await _order.orderBy('data.orderId', descending: true).limit(1).get();

      if (orderIdDoc.docs.isEmpty) {
        return 2000; // Starting value if no orders exist
      } else {
        // Explicitly cast the data to Map<String, dynamic>
        final Map<String, dynamic> orderData =
            orderIdDoc.docs.first.data() as Map<String, dynamic>;

        // Access the latest orderId from the nested 'data' field
        int latestOrderId = orderData['data']['orderId'] as int;

        log("This is the new orderID: ${latestOrderId + 1}");
        return latestOrderId + 1;
      }
    } catch (e) {
      log("Error generating orderId: $e");
      throw Exception("Failed to generate orderId");
    }
  }

  DocumentSnapshot? storeSnapshot;
  MakeOrderModel? makeOrderModel;

  Future<void> makeOrder(BuildContext context, dynamic dataOfStore) async {
    try {
      emit(MakeOrderLoading());
      String userId = CacheHelper.getData(key: "userID");

      // 1. Fetch Cart Products
      await getCartProducts(); // Ensures cartProducts is populated
      if (cartProducts.isEmpty) {
        log("No products found in cart.");
        emit(MakeOrderError());
        return;
      }

      // 2. Initialize variables
      List<Map<String, dynamic>> orderItems = [];
      num totalPrice = 0.0;
      String storeId = cartProducts[0]["storeId"];

      // Fetch store details
      var storeDoc = await FirebaseFirestore.instance
          .collection('stores')
          .doc(storeId)
          .get();
      if (!storeDoc.exists) throw Exception("Store not found.");
      Map<String, dynamic> storeData = storeDoc.data()!;

      // 3. Loop through cart items to prepare order data
      for (var cartItem in cartProducts) {
        String productId = cartItem['productId'];
        int quantity = cartItem['quantity'];
        log("This is new order1");
        // Fetch product details
        var productDoc = await FirebaseFirestore.instance
            .collection('products')
            .doc(productId)
            .get();
        if (!productDoc.exists) continue;

        var productData = productDoc.data()!;
        num productPrice = productData['price'];

        // Add product details to order list
        orderItems.add({
          'productId': productId,
          'productName': productData['name'],
          'price': productPrice,
          'quantity': quantity,
          'total': productPrice * quantity,
        });
        log("This is new order2");
        // Calculate total order price
        totalPrice += productPrice * quantity;
      }

      // 4. Generate an incremental order ID
      int newOrderId = await _generateIncrementalOrderId();
      log("This is new order:$newOrderId");
      makeOrderModel = MakeOrderModel(
        data: Data(
          id: userId,
          storeId: storeId,
          storeName: storeData['name'],
          logo: storeData['logo'],
          products: orderItems
              .map((item) => OrderProduct(
                  id: item['productId'],
                  name: item['productName'],
                  price: item['price'],
                  count: item['quantity']))
              .toList(),
          totalPrice: totalPrice.toInt(),
          createdAt: Timestamp.now().toDate().toString(),
          orderId: newOrderId,
          phone: storeData["phone"],
          location: storeData["location"],
        ),
      );

      await FirebaseFirestore.instance
          .collection('orders')
          .add(makeOrderModel!.toMap());

      await _clearCart(userId);

      emit(MakeOrderSuccess());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThanksScreen(
                // makeOrderModel: makeOrderModel!,
                // storeData: dataOfStore,
                ),
          ));
    } catch (e) {
      log("Error making order: $e");
      emit(MakeOrderError());
      throw Exception("Failed to make order");
    }
  }

  Future<void> _clearCart(String userId) async {
    var cartCollection = FirebaseFirestore.instance.collection('cart');
    var cartSnapshot =
        await cartCollection.where('userId', isEqualTo: userId).get();

    for (var doc in cartSnapshot.docs) {
      await doc.reference.delete();
    }
  }

  /// delete cart
  Future<void> deleteCart() async {
    try {
      emit(DeleteCartLoading());
      String userId = CacheHelper.getData(key: "userID");

      final cartSnapshot = await _cart.where('userId', isEqualTo: userId).get();

      for (var doc in cartSnapshot.docs) {
        await doc.reference.delete();
      }

      emit(DeleteCartSuccess());
      getCartProducts();
    } catch (e) {
      log(e.toString());
      emit(DeleteCartError());
      throw Exception("failed to delete cart");
    }
  }
}
