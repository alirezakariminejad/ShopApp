import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/data/data_source/product_details_datasource.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/category.dart';
import 'package:flutter_shop_application/model/product_images.dart';
import 'package:flutter_shop_application/model/product_variant.dart';
import 'package:flutter_shop_application/model/variant_type.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class IProductDetailsRepository {
  Future<Either<String, List<ProductImages>>> getProductImagesRepository(String productId);
  Future<Either<String, List<VariantType>>> getVariantTypeRepository();
  Future<Either<String, List<ProductVariant>>> getProductVariantsRepository();
  Future<Either<String, Category>> getProductCateogoryRepository(String categoryId);
}

class ProductDetailsRepository extends IProductDetailsRepository {
  final IProductDetailsDataSource _productDetailsDataSource = locator.get();

  @override
  Future<Either<String, List<ProductImages>>> getProductImagesRepository(String productId) async {
    try {
      var response = await _productDetailsDataSource.getGallery(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<VariantType>>> getVariantTypeRepository() async {
    try {
      var response = await _productDetailsDataSource.getVariantTypes();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>> getProductVariantsRepository() async {
    try {
      var response = await _productDetailsDataSource.getProductVariants();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, Category>> getProductCateogoryRepository(String categoryId) async {
    try {
      var response = await _productDetailsDataSource.getProductCategory(categoryId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
