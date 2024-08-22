import 'package:flutter/material.dart';
import 'package:flutter_shop_application/model/category.dart';
import 'package:flutter_shop_application/widgets/cached_image.dart';

class HorizontalCategoryList extends StatelessWidget {
  final double? leftPadding;
  final Category category;
  HorizontalCategoryList(this.category, {super.key, this.leftPadding = 20.0});

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'FF${category.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    int redColor = Color(hexColor).red;
    int greenColor = Color(hexColor).green;
    int blueColor = Color(hexColor).blue;

    return Padding(
      padding: EdgeInsets.only(left: leftPadding!),
      child: Column(
        children: [
          Container(
            width: 56.0,
            height: 56.0,
            decoration: ShapeDecoration(
              color: Color(hexColor),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(45.0),
              ),
              shadows: [
                BoxShadow(
                  color: Color.fromRGBO(redColor, greenColor, blueColor, 0.75),
                  blurRadius: 30.0,
                  spreadRadius: -5.0,
                  offset: Offset(0, 10.0),
                ),
              ],
            ),
            child: CachedImage(
              imageUrl: category.icon,
              fit: BoxFit.none,
              imageHeight: 24.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            '${category.title}',
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
