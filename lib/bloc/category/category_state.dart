import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/model/category.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  Either<String, List<Category>> response;
  CategoryResponseState(this.response);
}

class CategoryLodingState extends CategoryState {}
