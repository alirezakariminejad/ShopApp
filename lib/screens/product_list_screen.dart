import 'package:flutter/material.dart';
import 'package:flutter_shop_application/constants/constants.dart';
import 'package:flutter_shop_application/widgets/banner_slider.dart';
import 'package:flutter_shop_application/widgets/horizontal_category_list.dart';
import 'package:flutter_shop_application/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
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
                        Text(
                          'پر فروش ترین‌ها',
                          style: TextStyle(
                            color: shopGray,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Image.asset('assets/images/filter_icon.png'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 44.0,
              ),
              sliver: SliverGrid.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 8 / 11),
                itemBuilder: (context, index) {
                  return ProductItem(leftPadding: 0);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
