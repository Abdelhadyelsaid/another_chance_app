import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileWidget extends StatelessWidget {
  final String title;
  final String svgIcon;
  final VoidCallback onTap;


  const ProfileWidget({
    super.key,
    required this.title,
    required this.svgIcon,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:.05.sw,vertical: .01.sh ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width * .9,
          height: height * .06,
          decoration: BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color:  Colors.black,
                    fontSize: 13,
                    // fontWeight: FontWeight.w500,
                    fontFamily: "Readex Pro",
                  ),
                ),
                Spacer(),
                SvgPicture.asset(
                  svgIcon,
                  width: 15,
                  height: 15,

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


