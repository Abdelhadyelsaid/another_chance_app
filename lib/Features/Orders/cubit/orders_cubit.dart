import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../Core/Helper/cache_helper.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  static OrdersCubit get(context) => BlocProvider.of<OrdersCubit>(context);

  /// get orders
  List<Map<String, dynamic>> orders = [];

  Future<void> getOrders() async {
    try {
      emit(GetOrdersLoadingState());
      String userId = CacheHelper.getData(key: "userID");
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('orders')
              .where('data.id', isEqualTo: userId)
              .get();
      orders.clear();

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> orderData = doc.data()['data'];

        orders.add({
          'id': orderData['id'],
          'totalPrice': orderData['totalPrice'],
          'createdAt': orderData['createdAt'],
          'orderId': orderData['orderId'],
          'orderStatus': orderData['orderStatus'],
          'products': orderData['products'] ?? [],
        });
      }
      log("Orders fetched: ${orders}");
      emit(GetOrdersSuccessState());
    } catch (e) {
      log(e.toString());
      emit(GetOrdersErrorState());
      throw Exception(e.toString());
    }
  }
}
