import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_application/bloc/home/home_bloc.dart';
import 'package:flutter_shop_application/bloc/home/home_event.dart';
import 'package:flutter_shop_application/bloc/home/home_state.dart';
import 'package:flutter_shop_application/constants/constants.dart';
import 'package:flutter_shop_application/data/repository/banner_repository.dart';
import 'package:flutter_shop_application/widgets/banner_slider.dart';
import 'package:flutter_shop_application/widgets/horizontal_category_list.dart';
import 'package:flutter_shop_application/widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitalizedDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldGray,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: <Widget>[
                _searchWidget(),
                _bannerSliderWidget(),
                _categoriesWidget(),
                _bestSellersWidget(),
                _mostVisitedWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _bannerSliderWidget extends StatelessWidget {
  const _bannerSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(),
    );
  }
}

class _mostVisitedWidget extends StatelessWidget {
  const _mostVisitedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 7.0, right: 44.0, left: 44.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'پر بازدیدترین‌ها',
                  style: TextStyle(
                    color: shopGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مشاهده همه',
                      style: TextStyle(
                        color: shopBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Image(
                      image: AssetImage('assets/images/arrow_left_blue.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 245.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              padding: const EdgeInsetsDirectional.only(
                start: 44.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _bestSellersWidget extends StatelessWidget {
  const _bestSellersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32.0, right: 44.0, left: 44.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'پر فروش ترین‌ها',
                  style: TextStyle(
                    color: shopGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مشاهده همه',
                      style: TextStyle(
                        color: shopBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Image(
                      image: AssetImage('assets/images/arrow_left_blue.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 245.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              padding: const EdgeInsetsDirectional.only(
                start: 44.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _categoriesWidget extends StatelessWidget {
  const _categoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 32.0,
              right: 44.0,
            ),
            child: Text(
              'دسته‌بندی',
              style: TextStyle(
                color: shopGray,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 85.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              padding: const EdgeInsetsDirectional.only(start: 44.0),
              itemBuilder: (BuildContext context, int index) {
                return HorizontalCategoryList();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _searchWidget extends StatelessWidget {
  const _searchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/search_icon.png'),
                    const SizedBox(width: 10.0),
                    Text(
                      'جستجوی محصولات',
                      style: TextStyle(
                        color: shopGray,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
                Image.asset('assets/images/apple_blue.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
