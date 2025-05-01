import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:meta/meta.dart';


part 'on_boadring_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(context) => BlocProvider.of(context);
  TextEditingController loginPhoneController = TextEditingController();
  final List<XFile> imageFiles = [];
  final picker = ImagePicker();

  Future<void> pickImages() async {
    try {
      int remainingImages = 6 - imageFiles.length;
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
}
