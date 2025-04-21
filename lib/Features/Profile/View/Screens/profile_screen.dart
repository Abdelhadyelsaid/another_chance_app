import 'package:another_chance/Features/Profile/cubit/profile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Helper/cache_helper.dart';
import '../../../../routing/routes.dart';
import '../Widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: .05.sh,
              ),
              Container(
                width: .9.sw,
                height: .08.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5, top: 8.0),
                      child: BlocProvider(
                        create: (context) => ProfileCubit()..getAccountData(),
                        child: BlocConsumer<ProfileCubit, ProfileState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            var cubit = ProfileCubit.get(context);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: .03.sw),
                                  child: Text(cubit.firstName,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Readex Pro",
                                      )),
                                ),
                                SizedBox(
                                  height: .01.sh,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: .03.sw),
                                  child: Text(cubit.email,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Readex Pro",
                                      )),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: .02.sh,
              ),
              ProfileWidget(
                title: "Account Info",
                svgIcon: 'assets/icons/left_arrow_profile.svg',
                onTap: () {
                  context.pushNamed(Routes.accountInfoScreen.name);
                },
              ),
              ProfileWidget(
                title: "Orders",
                svgIcon: 'assets/icons/left_arrow_profile.svg',
                onTap: () {
                  context.pushNamed(Routes.ordersScreen.name);
                },
              ),
              ProfileWidget(
                title: "Contact Us",
                svgIcon: 'assets/icons/left_arrow_profile.svg',
                onTap: () {
                  context.pushNamed(Routes.contactScreen.name);
                },
              ),
              SizedBox(
                height: .1.sh,
              ),
              ProfileWidget(
                title: "Customer Service",
                svgIcon: 'assets/icons/left_arrow_profile.svg',
                onTap: () {
                  context.pushNamed(Routes.customerServiceScreen.name);
                },
              ),
              ProfileWidget(
                title: "Log Out",
                svgIcon: 'assets/icons/left_arrow_profile.svg',
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  CacheHelper.clear();
                  context.goNamed(Routes.loginScreen.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
