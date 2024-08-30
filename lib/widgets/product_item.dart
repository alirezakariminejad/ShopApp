import 'package:flutter/material.dart';

import 'package:flutter_shop_application/constants/constants.dart';
import 'package:flutter_shop_application/model/product.dart';
import 'package:flutter_shop_application/screens/product_details_screen.dart';
import 'package:flutter_shop_application/widgets/cached_image.dart';

class ProductItem extends StatelessWidget {
  final double? leftPadding;
  Product product;
  ProductItem(this.product, {super.key, this.leftPadding = 20.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: leftPadding!),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 165.0,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              'assets/images/heart-like.png',
                              height: 20.0,
                            ),
                          ),
                          Positioned(
                            child: CachedImage(
                              imageUrl: product.thumbnail,
                              imageHeight: 100.0,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: shopRed, borderRadius: BorderRadius.circular(100.0)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                                child: Text(
                                  '%${product.percent!.round().toString()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '${product.name}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60.0,
              width: 160,
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 7.0,
              ),
              decoration: BoxDecoration(
                color: shopBlue,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(59, 94, 223, 0.75),
                    blurRadius: 15.0,
                    spreadRadius: -15.0,
                    offset: Offset(0, 15.0),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/arrow_right.png',
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${product.price}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            '${product.priceWithDiscount}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'تومان',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
