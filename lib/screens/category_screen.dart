import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_application/bloc/category/category_bloc.dart';
import 'package:flutter_shop_application/bloc/category/category_event.dart';
import 'package:flutter_shop_application/bloc/category/category_state.dart';
import 'package:flutter_shop_application/constants/constants.dart';
import 'package:flutter_shop_application/data/repository/category_repository.dart';
import 'package:flutter_shop_application/model/category.dart';
import 'package:flutter_shop_application/widgets/banner_slider.dart';
import 'package:flutter_shop_application/widgets/cached_image.dart';
import 'package:flutter_shop_application/widgets/horizontal_category_list.dart';
import 'package:flutter_shop_application/widgets/product_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // List<Category>? list;
  @override
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestListEvent());
    super.initState();
  }

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
                          'دسته بندی',
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLodingState) {
                  return SliverPadding(
                    padding: EdgeInsets.only(
                      left: 44.0,
                      right: 44.0,
                      bottom: 12.0,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                if (state is CategoryResponseState) {
                  return state.response.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (r) {
                      return _listOfCategory(
                        list: r,
                      );
                    },
                  );
                }
                return SliverPadding(
                  padding: EdgeInsets.only(
                    left: 44.0,
                    right: 44.0,
                    bottom: 12.0,
                  ),
                  sliver: const SliverToBoxAdapter(
                    child: Center(
                      child: Text('Error'),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _listOfCategory extends StatelessWidget {
  List<Category>? list;
  _listOfCategory({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsets.symmetric(
          horizontal: 44.0,
        ),
        sliver: SliverGrid.builder(
          itemCount: list?.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return CachedImage(imageUrl: list?[index].thumbnail);
            // return ClipRRect(
            //   borderRadius: BorderRadius.circular(15.0),
            //   child: FittedBox(
            //     fit: BoxFit.cover,
            //     child: Image.asset('assets/images/category-img.jpg'),
            //   ),
            // );
          },
        ));
  }
}
