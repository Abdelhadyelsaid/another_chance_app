import 'package:another_chance/Features/Home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Const/colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Row(
            children: [
              const Column(
                children: [
                  Text(
                    "Summer Jar Set",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "22 In Stock",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey),
                  )
                ],
              ),
              SizedBox(width: .2.sw,),
              InkWell(
                onTap: () {
                  cubit.decreaseEsimCount();
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                  ),
                  child: const Center(
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontFamily: "Readex Pro",
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "${cubit.esimCount}",
                style: const TextStyle(
                    fontFamily: "Readex Pro",
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,fontSize: 16),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  cubit.increaseEsimCount();
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                  ),
                  child: const Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontFamily: "Readex Pro",
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          );
        },
      );
  }
}
