import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_application/bloc/product/product_bloc.dart';
import 'package:flutter_shop_application/bloc/product/product_event.dart';
import 'package:flutter_shop_application/bloc/product/product_state.dart';
import 'package:flutter_shop_application/model/product_images.dart';
import 'package:flutter_shop_application/constants/constants.dart';
import 'package:flutter_shop_application/data/repository/product_details_repository.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/variant_type.dart';
import 'package:flutter_shop_application/widgets/cached_image.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductInitalizeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: scaffoldGray,
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  if (state is ProductDetailsLoadingState) ...{
                    const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  } else ...{
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
                    if (state is ProductDetailsResponseState) ...{
                      state.productImages.fold(
                        (l) {
                          return SliverToBoxAdapter(child: Text(l));
                        },
                        (r) {
                          return GalleryWidget(r);
                        },
                      )
                    },
                    if (state is ProductDetailsResponseState) ...{
                      state.productVariantTypes.fold(
                        (l) {
                          return SliverToBoxAdapter(child: Text(l));
                        },
                        (r) {
                          return ProductColorVariant(r);
                        },
                      )
                    },
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 64.0, right: 64.0, bottom: 16.0),
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
                                        children: [],
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
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 16.0),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 60,
                                    width: 140,
                                    decoration: const BoxDecoration(
                                        color: shopBlue,
                                        borderRadius: BorderRadius.all(Radius.circular(15))),
                                  ),
                                ),
                                Positioned(
                                  child: GestureDetector(
                                    onTap: () async {
                                      IProductDetailsRepository repository = locator.get();
                                      var response = await repository.getProductImagesRepository();
                                      response.fold((l) {}, (r) {
                                        r.forEach((element) {
                                          print(element.image);
                                        });
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          height: 53,
                                          width: 160,
                                          child: const Center(
                                            child: Text(
                                              'افزودن سبد خرید',
                                              style: TextStyle(
                                                  fontFamily: 'SM',
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 60,
                                    width: 140,
                                    decoration: const BoxDecoration(
                                        color: shopGreen,
                                        borderRadius: BorderRadius.all(Radius.circular(15))),
                                  ),
                                ),
                                Positioned(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        height: 53,
                                        width: 160,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Text(
                                                'تومان',
                                                style: TextStyle(
                                                  fontFamily: 'SM',
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '۴۹،۸۰۰،۰۰۰',
                                                    style: TextStyle(
                                                        fontFamily: 'SM',
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        decoration: TextDecoration.lineThrough),
                                                  ),
                                                  Text(
                                                    '۴۸،۸۰۰،۰۰۰',
                                                    style: TextStyle(
                                                      fontFamily: 'SM',
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(15),
                                                  ),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2, horizontal: 6),
                                                  child: Text(
                                                    '٪۳',
                                                    style: TextStyle(
                                                        fontFamily: 'SM',
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  }
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductColorVariant extends StatelessWidget {
  VariantType variantType;
  ProductColorVariant(this.variantType,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 64.0, right: 64.0, bottom: 16.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${variantType.title}',
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
    );
  }
}

class GalleryWidget extends StatefulWidget {
  List<ProductImages> images;
  int selectedIndex = 0;
  GalleryWidget(
    this.images, {
    super.key,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 20.0),
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
                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 140.0,
                      child: CachedImage(
                        imageUrl: widget.images[widget.selectedIndex].image,
                        fit: BoxFit.contain,
                        radius: 10.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      height: 70.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              margin: EdgeInsets.only(left: 16.0),
                              padding: EdgeInsets.all(5.0),
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
                              child: CachedImage(
                                imageUrl: widget.images[index].image,
                                fit: BoxFit.contain,
                                radius: 10.0,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
