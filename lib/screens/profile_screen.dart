import 'package:flutter/material.dart';
import 'package:flutter_shop_application/constants/constants.dart';
import 'package:flutter_shop_application/screens/profile_list_item.dart';
import 'package:flutter_shop_application/widgets/banner_slider.dart';
import 'package:flutter_shop_application/widgets/horizontal_category_list.dart';
import 'package:flutter_shop_application/widgets/product_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                        const SizedBox(width: 0.0),
                        Text(
                          'حساب کاربری',
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
            SliverPadding(
              padding: EdgeInsets.only(left: 44.0, right: 44.0, bottom: 20.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Text(
                      'علیرضا کریمی نژاد',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    const Text(
                      '۰۹۱۲۳۶۵۵۰۵۵',
                      style: TextStyle(
                        color: shopGray,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 44.0,
              ),
              sliver: SliverToBoxAdapter(
                child: ProfileListItem(),
              ),
            ),

            SliverFillRemaining(
               hasScrollBody: false,
               child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 44.0, right: 44.0),
                    child: Column(
                    children: [
                      const Text(
                        'اپل شاپ',
                        style: TextStyle(
                          color: shopGray,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      const Text(
                        'V-1.0.00',
                        style: TextStyle(
                          color: shopGray,
                          fontSize: 14.0,
                        ),
                      ),
                      const Text(
                        'Instagram.com/Mojavad-dev',
                        style: TextStyle(
                          color: shopGray,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                                  ),
                  )
                ],
               ),
            )
          ],
        ),
      ),
    );
  }
}
