import 'dart:io';
import 'package:another_chance/Features/OnBoarding/Cubit/on_boadring_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Const/colors.dart';

class MoreImagesWidget extends StatelessWidget {
  const MoreImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        var cubit = OnBoardingCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: width * .02,vertical: height*.01),
          decoration: BoxDecoration(
              color: const Color(0xffE6E6E6),
              borderRadius: BorderRadius.circular(12)),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: .8),
            itemCount: cubit.imageFiles.length < 6
                ? cubit.imageFiles.length + 1 // Add 1 for the "Add" button
                : cubit.imageFiles.length,
            itemBuilder: (context, index) {
              if (index == cubit.imageFiles.length) {
                return GestureDetector(
                  onTap: cubit.pickImages,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffE6E6E6),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 40, color: cPrimaryColor),
                          const SizedBox(height: 4),
                          Text("اضافة",
                              style: TextStyle(
                                color: cPrimaryColor,
                                fontFamily: "Readex Pro",
                                fontSize: 16,
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(cubit.imageFiles[index].path),
                      fit: BoxFit.cover,
                      width: width * .23,
                      height: width * .22,
                    ),
                  ),
                  TextButton(
                    onPressed: () => cubit.removeImage(index),
                    child: const Text(
                      'حذف',
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: "Readex Pro",
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
