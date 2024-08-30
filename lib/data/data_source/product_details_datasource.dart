import 'package:dio/dio.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/product_images.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class IProductDetailsDataSource {
  Future<List<ProductImages>> getGallery();
}

class ProductDetailsRemoteDatasource extends IProductDetailsDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductImages>> getGallery() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="78n4wqor3hhnkju"'};
      var response = await _dio.get(
        'collections/gallery/records',
        queryParameters: qParams,
      );
      return response.data['items']
          .map<ProductImages>((jsonObject) => ProductImages.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
