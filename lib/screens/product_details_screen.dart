import 'package:flutter/material.dart';
import 'package:flutter_shop_application/constants/constants.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldGray,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 44.0,
                  right: 44.0,
                  top: 10.0,
                  bottom: 32.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/arrow_right_black.png'),
                        const Text(
                          'آیفون',
                          style: TextStyle(
                            color: shopGray,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Image.asset('assets/images/apple_blue.png'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 44.0,
                  right: 44.0,
                  bottom: 15.0,
                ),
                child: Text(
                  'آیفون SE 2022',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 20.0),
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 15.0,
                        spreadRadius: -10.0,
                        offset: Offset(0, 15.0),
                      )
                    ],
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Positioned(
                        top: 15,
                        right: 15,
                        child: Image.asset('assets/images/heart-unlike.png'),
                      ),
                      Positioned(
                        top: 15,
                        left: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '۴.۷',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                            Image.asset(
                              'assets/images/stars.png',
                              height: 15,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 32.0, horizontal: 32.0),
                        child: Column(
                          children: [
                            Image.asset('assets/images/iphone_se_09.png'),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 0.02),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Color.fromRGBO(0, 0, 0, 0.3),
                                    ),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.15),
                                        blurRadius: 15.0,
                                        spreadRadius: -5.0,
                                        offset: Offset(0, 15.0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'assets/images/iphone_se_09.png',
                                      height: 10.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Color.fromRGBO(0, 0, 0, 0.15),
                                    ),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        blurRadius: 15.0,
                                        spreadRadius: -5.0,
                                        offset: Offset(0, 15.0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'assets/images/iphone_se_09.png',
                                      height: 10.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Color.fromRGBO(0, 0, 0, 0.15),
                                    ),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        blurRadius: 15.0,
                                        spreadRadius: -5.0,
                                        offset: Offset(0, 15.0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'assets/images/iphone_se_09.png',
                                      height: 10.0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.only(left: 64.0, right: 64.0, bottom: 16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'انتخاب رنگ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.07),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 32.0,
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Text(
                                  'مشکی',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 32.0,
                              height: 32.0,
                              margin: EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                color: shopRed,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 32.0,
                              height: 32.0,
                              margin: EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                color: shopGreen,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.only(left: 64.0, right: 64.0, bottom: 16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'انتخاب حافظه داخلی',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.07),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 24.0,
                            ),
                            child: Text(
                              '۱۲۸',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.07),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 24.0,
                            ),
                            child: Text(
                              '۲۵۶',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.07),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 24.0,
                            ),
                            child: Text(
                              '۵۱۲',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 64.0,
                right: 64.0,
                bottom: 16.0,
                top: 16.0,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 12.0,
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          const BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 15.0,
                            spreadRadius: -10.0,
                            offset: Offset(0, 15.0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'مشخصات فنی: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'مشاهده',
                                style: TextStyle(
                                  color: shopBlue,
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Image.asset(
                                'assets/images/arrow_left_blue.png',
                                height: 20.0,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 12.0,
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          const BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 15.0,
                            spreadRadius: -10.0,
                            offset: Offset(0, 15.0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'توضیحات محصول: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'مشاهده',
                                style: TextStyle(
                                  color: shopBlue,
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Image.asset(
                                'assets/images/arrow_left_blue.png',
                                height: 20.0,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 12.0,
                      ),
                      margin: const EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          const BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 15.0,
                            spreadRadius: -10.0,
                            offset: Offset(0, 15.0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'نظرات کاربران:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                              Wrap(

                                children: [
                                  
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'مشاهده',
                                style: TextStyle(
                                  color: shopBlue,
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Image.asset(
                                'assets/images/arrow_left_blue.png',
                                height: 20.0,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
