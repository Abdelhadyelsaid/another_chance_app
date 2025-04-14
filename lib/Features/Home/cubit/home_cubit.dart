import 'dart:developer';

import 'package:another_chance/Features/Home/View/Screens/home_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Profile/View/Screens/profile_screen.dart';
import '../View/Screens/product_screen.dart';
import '../View/Screens/recycle_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(LayoutChangeState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const ProductScreen(),
    const RecycleScreen(),
    const ProfileScreen()
  ];

  int esimCount = 1;

  void increaseProductCount() {
    esimCount++;
    emit(ChangeEsimCountState());
  }

  void decreaseProductCount() {
    if (esimCount > 1) {
      esimCount--;
      emit(ChangeEsimCountState());
    }
  }

  List<Map<String, dynamic>> bestSellerProducts = [];
  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> newArrivalsProducts = [];

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
    } catch (e) {
      log(e.toString());
      emit(GetProductsError());
      throw Exception("failed to get store products");
    }
  }

  Future<void> getNewArrivalsProducts() async {
    try {
      emit(GetNewArrivalsProductsLoading());
      final querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .orderBy('created_at',
              descending: true) // Sort by created_at in descending order
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
    } catch (e) {
      log(e.toString());
      emit(GetNewArrivalsProductsError());
      throw Exception("Failed to get store products");
    }
  }
}
