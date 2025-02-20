import 'dart:developer';

import 'package:another_chance/Core/Helper/cache_helper.dart';
import 'package:another_chance/Features/Home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/Const/colors.dart';
import '../../../../routing/routes.dart';
import '../../../Authentication/View/Screens/login_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: cSecondaryColor,
            selectedLabelStyle: TextStyle(
                fontFamily: "Readex Pro", fontSize: 12, color: cSecondaryColor),
            unselectedLabelStyle: TextStyle(
              fontFamily: "Readex Pro",
              fontSize: 10,
              color: cPrimaryColor,
            ),
            onTap: (index) {
              cubit.changeIndex(index);
            },
            currentIndex: cubit.selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: cubit.selectedIndex == 0
                    ? SvgPicture.asset(
                        'assets/icons/filled_home.svg',
                        width: 50.w,
                        height: 50.w,
                      )
                    : SvgPicture.asset(
                        'assets/icons/home.svg',
                      ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: cubit.selectedIndex == 1
                    ? Image.asset('assets/icons/box_filled.png',
                        width: 50.w, height: 50.w)
                    : Image.asset('assets/icons/box.png',
                        width: 25, height: 25),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: cubit.selectedIndex == 2
                    ? Image.asset(
                        'assets/icons/recycle_filled.png',
                        width: 50.w,
                        height: 50.w,
                      )
                    : Image.asset(
                        'assets/icons/recycle.png',
                        width: 25,
                        height: 25,
                      ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: cubit.selectedIndex == 3
                    ? SvgPicture.asset(
                        'assets/icons/filled_profile.svg',
                        width: 50.w,
                        height: 50.w,
                      )
                    : SvgPicture.asset(
                        'assets/icons/profile.svg',
                        width: 25,
                        height: 25,
                      ),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }
}
