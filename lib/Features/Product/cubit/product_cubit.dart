import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of<ProductCubit>(context);
  DocumentSnapshot? storeSnapshot;
  int productCount = 1;

  Future<void> getProductDetails({required String productId}) async {
    try {
      emit(GetProductByIdLoading());
      storeSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .get();

      log("This is products:${[storeSnapshot]}");
      emit(GetProductByIdSuccess());
    } on FirebaseException catch (e) {
      log(e.toString());
      emit(GetProductByIdError());
      throw Exception("failed to get product details");
    }
  }

  void increaseProductCount() {
    if (productCount < 8) {
      productCount++;
      emit(ChangeProductCountState());
    }
  }

  void decreaseProductCount() {
    if (productCount > 1) {
      productCount--;
      emit(ChangeProductCountState());
    }
  }
}
