import 'package:dio/dio.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/category.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class ICategoryDataSource {
  Future<List<Category>> getCategories();
}

class CategoryRemoteDataSource extends ICategoryDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<Category>> getCategories() async {
    var response = await _dio.get('collections/category/records');

    try {
      return response.data['items']
          .map<Category>((jsonObject) => Category.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
