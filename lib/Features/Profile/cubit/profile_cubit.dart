import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Core/Helper/cache_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);

  /// get account data
  Map<String, dynamic>? userData;
  String lastName = "";
  String firstName = "";
  String email = "";
  String phone = "";
  String userId = "";

  Future<void> getAccountData() async {
    try {
      emit(GetAccountDataLoading());
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          userData = userDoc.data() as Map<String, dynamic>?;
          lastName = userData!['last_name'];
          firstName = userData!['first_name'];
          email = userData!['email'];
          phone = userData!['phone_number'];
          userId = user.uid;
          CacheHelper.saveData(key: "userID", value: user.uid);
          log("User Id: $userId");
        }
        log("This is user Data:$userData}");
        emit(GetAccountDataSuccess());
      }
    } on FirebaseException catch (e) {
      log(e.toString());
      emit(GetAccountDataError());
      throw Exception("failed to get account data");
    }
  }

  // Future<void> updateAccountData({String? phone, String? email}) async {
  //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   User? user = FirebaseAuth.instance.currentUser;
  //   try {
  //     emit(UpdateAccountDataLoading());
  //     await firestore.collection('users').doc(user!.uid).update({
  //       'phone_number': phone,
  //       "email": email,
  //     });
  //
  //     emit(UpdateAccountDataSuccess());
  //   } catch (e) {
  //     log(e.toString());
  //     emit(UpdateAccountDataError());
  //     throw Exception("failed to update account data");
  //   }
  // }
}
