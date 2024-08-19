import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/model/banner_model.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerModel>> bannerList;
  HomeRequestSuccessState(this.bannerList);
}
