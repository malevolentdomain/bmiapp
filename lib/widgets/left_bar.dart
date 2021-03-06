import 'package:bmiapperkey/constants/app_constants.dart';
import 'package:bmiapperkey/constants/app_constants.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;

  const LeftBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 31,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(31),
                bottomLeft: Radius.circular(3),
              ),
              color: accentHexColor),
        ),
      ],
    );
  }
}
