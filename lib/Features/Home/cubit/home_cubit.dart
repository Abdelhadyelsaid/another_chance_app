import 'dart:developer';

import 'package:another_chance/Core/Const/app_urls.dart';
import 'package:another_chance/Core/Helper/dio_helper.dart';
import 'package:another_chance/Features/Home/View/Screens/home_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Product/View/Screens/cart_screen.dart' show CartScreen;
import '../../Profile/View/Screens/profile_screen.dart';
import '../View/Screens/recycle_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  int selectedIndex = 3;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(LayoutChangeState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const RecycleScreen(),
    const ProfileScreen()
  ];

  List<Map<String, dynamic>> bestSellerProducts = [];
  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> newArrivalsProducts = [];
  List<Map<String, dynamic>> recommendedProducts = [];

  Future<void> getProducts() async {
    try {
      emit(GetProductsLoading());
      final querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .orderBy('price', descending: false)
          .get();
      bestSellerProducts = querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();
      log("This is products:${[bestSellerProducts]}");
      emit(GetProductsSuccess());
    } on FirebaseException catch (e) {
      log(e.toString());
      emit(GetProductsError());
      throw Exception("failed to get store products");
    }
  }


  Future<void> getRecommendedProducts({required String productId}) async {
    try {
      emit(GetRecommendedLoading());

      final response = await DioHelper.getData(url: AppUrls.recommendation + productId);

      if (response.statusCode == 200) {
        if (response.data is List) {
          recommendedProducts = List<Map<String, dynamic>>.from(response.data);
          log('Recommended products: $recommendedProducts');
          emit(GetRecommendedSuccess());
        } else {
          log('Unexpected data format: ${response.data}');
          emit(GetRecommendedError());
        }
      } else {
        log('Failed response: ${response.data}');
        emit(GetRecommendedError());
      }
    } catch (e) {
      log('Error: $e');
      emit(GetRecommendedError());
      throw Exception("Failed to get recommended products");
    }
  }


  Future<void> getNewArrivalsProducts() async {
    try {
      emit(GetNewArrivalsProductsLoading());
      final querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .orderBy('created_at', descending: true)
          .get();

      final querySnapshotAllProducts =
          await FirebaseFirestore.instance.collection('products').get();

      newArrivalsProducts = querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();

      products = querySnapshotAllProducts.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();
      log("This is products: $newArrivalsProducts");
      emit(GetNewArrivalsProductsSuccess());
    } on FirebaseException catch (e) {
      log(e.toString());
      emit(GetNewArrivalsProductsError());
      throw Exception("Failed to get store products");
    }
  }
}
