import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop_application/data/data_source/category_data_source.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/category.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class ICateogoryRepository {
  Future<Either<String, List<Category>>> getRepositories();
}

class CategoryRepository extends ICateogoryRepository {
  final ICategoryDataSource _categoryDataSource = locator.get();
  @override
  Future<Either<String, List<Category>>> getRepositories() async {
    try {
      var response = await _categoryDataSource.getCategories();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
