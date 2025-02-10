import 'package:another_chance/Features/Profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Const/colors.dart';
import '../../../../Core/Helper/cache_helper.dart';
import '../../../../Core/Shared/default_button_widget.dart';
import '../../../../Core/Shared/default_textform_widget.dart';
import '../Widgets/header_text_widget.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: cBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: .05.sw),
          child: BlocProvider(
            create: (context) => ProfileCubit()..getAccountData(),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                var cubit = ProfileCubit.get(context);
                return Column(
                  children: [
                    const HeaderTextWidget(
                      title: "Account Info",
                    ),

                    ///******** first name ********///
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("FirstName",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Readex Pro",
                                      fontSize: 13)),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          DefaultTextFormField(
                              enabled: false,
                              hintText: cubit.firstName ??
                                  "N/A"),
                          SizedBox(
                            height: height * 0.02,
                          ),

                          ///******** email **********///
                          const Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Email",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Readex Pro",
                                      fontSize: 13)),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          DefaultTextFormField(
                              enabled: false,
                              hintText:
                                  cubit.email ?? "N/A"),
                          SizedBox(
                            height: height * 0.02,
                          ),

                          ///******** phone **********///
                          const Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("PhoneNumber",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Readex Pro",
                                      fontSize: 13)),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: DefaultTextFormField(
                                    enabled: false,
                                    hintText:
                                        cubit.phone ?? "N/A"),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: DefaultButton(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             ResetPasswordScreen(
                                        //               isChangingPhoneNumber: true,
                                        //             )));
                                        // cubit.resetTimer();
                                        // cubit.startTimer();
                                        // cubit.createOtpReset(CacheHelper.getData(key: "phone"), context);
                                      },
                                      borderRadius: BorderRadius.circular(10),
                                      height: height * 0.05,
                                      color: cPrimaryColor,
                                      text: "Change"))
                            ],
                          ),

                          ///******** password **********///
                          CacheHelper.getData(key: 'loginType') == "social"
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    const Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Password",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Readex Pro",
                                                fontSize: 13)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: DefaultTextFormField(
                                              enabled: false,
                                              hintText: "*****"),
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: DefaultButton(
                                                onTap: () {
                                                  // cubit.resetTimer();
                                                  // cubit.startTimer();
                                                  // cubit.createOtpReset(
                                                  //     CacheHelper.getData(
                                                  //         key: "phone"),
                                                  //     context);
                                                },
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                height: height * 0.05,
                                                color: cPrimaryColor,
                                                text: "Change"))
                                      ],
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: height * 0.04,
                          ),

                          ///************* delete ****************///

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Text("DeleteAccount",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "Readex Pro",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.008,
                                ),
                                const Text(
                                    "You can delete your account permanently, but it is worth mentioning that you cannot undo the deletion after deleting the account                                                                                                        .",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Readex Pro",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: DefaultButton(
                              borderRadius: BorderRadius.circular(10),
                              height: height * 0.07,
                              color: const Color(0xffE77994),
                              text: "DeleteAccount",
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text(
                                      "Are you sure you want to delete account ?",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Readex Pro",
                                          fontSize: 13),
                                    ),
                                    content: const Text("",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "Readex Pro",
                                            fontSize: 13)),
                                    actions: [
                                      TextButton(
                                        child: const Text("Yes",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Readex Pro",
                                                fontSize: 13)),
                                        onPressed: () {
                                          // cubit.deleteAccount(context);
                                          // // Navigator.of(context)
                                          // //     .pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text("No",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Readex Pro",
                                                fontSize: 13)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
