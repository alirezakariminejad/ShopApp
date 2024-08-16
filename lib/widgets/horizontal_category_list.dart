import 'package:flutter/material.dart';

class HorizontalCategoryList extends StatelessWidget {
  final double? leftPadding;
  const HorizontalCategoryList({super.key, this.leftPadding = 20.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding!),
      child: Column(
        children: [
          Container(
            width: 56.0,
            height: 56.0,
            decoration: ShapeDecoration(
              color: const Color(0XFFFBAD40),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(45.0),
              ),
              shadows: const [
                BoxShadow(
                  color: Color.fromRGBO(251, 173, 64, 0.75),
                  blurRadius: 30.0,
                  spreadRadius: -5.0,
                  offset: Offset(0, 10.0),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/iphone_icon.png',
              height: 26.0,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'آیفون',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
