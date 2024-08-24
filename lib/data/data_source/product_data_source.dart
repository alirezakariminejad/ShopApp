import 'package:dio/dio.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/product.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class IProductDataSource {
  Future<List<Product>>  getProducts();
  Future<List<Product>> getBestSellerProducts();
  Future<List<Product>> getHottestProducts();
}

class ProductRemoteDataSource extends IProductDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<Product>> getProducts() async {
    var response = await _dio.get('collections/products/records');
    try {
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<Product>> getBestSellerProducts() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="Best Seller"'};
      var response = await _dio.get(
        'collections/products/records',
        queryParameters: qParams,
      );
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<Product>> getHottestProducts() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="Hotest"'};
      var response = await _dio.get(
        'collections/products/records',
        queryParameters: qParams,
      );
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
