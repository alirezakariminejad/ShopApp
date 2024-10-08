import 'package:dio/dio.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/category.dart';
import 'package:flutter_shop_application/model/product_images.dart';
import 'package:flutter_shop_application/model/product_variant.dart';
import 'package:flutter_shop_application/model/variant.dart';
import 'package:flutter_shop_application/model/variant_type.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class IProductDetailsDataSource {
  Future<List<ProductImages>> getGallery(String productId);
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariants();
  Future<List<ProductVariant>> getProductVariants();
  Future<Category> getProductCategory(String categoryId);
}

class ProductDetailsRemoteDatasource extends IProductDetailsDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductImages>> getGallery(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};
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

  @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      var response = await _dio.get('collections/variants_type/records');
      return response.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<Variant>> getVariants() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="5vvww65pv6nviw6"'};
      var response = await _dio.get(
        'collections/variants/records',
        queryParameters: qParams,
      );
      return response.data['items']
          .map<Variant>((jsonObject) => Variant.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<ProductVariant>> getProductVariants() async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariants();

    List<ProductVariant> productVariantList = [];

    try {
      for (var variantType in variantTypeList) {
        var variantListArranged =
            variantList.where((element) => element.typeId == variantType.id).toList();

        productVariantList.add(ProductVariant(variantType, variantListArranged));
      }
      return productVariantList;
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<Category> getProductCategory(String categoryId) async {
    try {
      Map<String, String> qParams = {'filter': 'id="$categoryId"'};
      var response = await _dio.get(
        'collections/category/records',
        queryParameters: qParams,
      );
      return Category.fromMapJson(response.data['items'][0]);
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
