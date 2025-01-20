import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HeaderTextWidget extends StatelessWidget {
  final String title;

  const HeaderTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final arrowIcon = 'assets/icons/left_arrow_profile.svg';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left icon

        SizedBox(width: .05 * height),
        // Center text
        Text(
          "$title",
          style: TextStyle(
            color: Color(0xff575050),
            fontSize: 18,
            fontFamily: "Readex Pro",
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: .02 * height,
            left: width * .05,
            bottom: .02 * height,
          ),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: .05 * height,
              height: .05 * height,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(arrowIcon),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
