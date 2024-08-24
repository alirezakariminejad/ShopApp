import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/model/banner_model.dart';
import 'package:flutter_shop_application/model/category.dart';
import 'package:flutter_shop_application/model/product.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerModel>> bannerList;
  Either<String, List<Category>> categoryList;
  Either<String, List<Product>> productList;
  HomeRequestSuccessState(this.bannerList, this.categoryList, this.productList);
}

class HomeRquestBestSellerProductState extends HomeState {
  Either<String, List<Product>> bestSellerProductList;
  HomeRquestBestSellerProductState(this.bestSellerProductList);
}

class HomeRquestHottestProductState extends HomeState {
    Either<String, List<Product>> hottestProductList;
  HomeRquestHottestProductState(this.hottestProductList);
}
