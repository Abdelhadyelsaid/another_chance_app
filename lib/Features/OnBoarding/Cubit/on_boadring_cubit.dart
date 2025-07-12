import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:meta/meta.dart';

part 'on_boadring_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  final List<XFile> imageFiles = [];
  final picker = ImagePicker();

  Future<void> pickImages() async {
    try {
      int remainingImages = 3 - imageFiles.length;
      final List<XFile>? selectedImages =
          await picker.pickMultiImage(limit: remainingImages);
      if (selectedImages != null) {
        imageFiles.addAll(selectedImages);
        emit(ImageSelectedSuccessState());
      }
    } catch (e) {
      emit(ImageSelectedErrorState());
      log("Image picker error: $e");
    }
  }

  void removeImage(int index) {
    imageFiles.removeAt(index);
    emit(ImageRemovedSuccessState());
  }

  Future<void> requestCollection() async {
    try {
      emit(RequestLoadingState());

      // // Upload images and get URLs
      // List<String> imageUrls = [];
      //
      // for (XFile image in imageFiles) {
      //   final file = File(image.path);
      //   final fileName =
      //       '${DateTime.now().millisecondsSinceEpoch}_${image.name}';
      //   final ref =
      //       FirebaseStorage.instance.ref().child('plastic_requests/$fileName');
      //
      //   await ref.putFile(file);
      //   final downloadUrl = await ref.getDownloadURL();
      //   imageUrls.add(downloadUrl);
      // }

      await FirebaseFirestore.instance
          .collection('plasticCollectionRequests')
          .add({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'address': addressController.text.trim(),
        'notes': notesController.text.trim(),
        'images': ["https://woodly.com/wp-content/uploads/2021/10/shutterstock_1658616850-min-scaled.jpg","https://safety4sea.com/wp-content/uploads/2022/05/recycling-750x500.jpg"],
        'createdAt': Timestamp.now(),
      });

      emit(RequestSuccessState());
    } catch (e) {
      log("Request error: $e");
      emit(RequestErrorState());
      throw Exception("Failed to add request");
    }
  }
}
