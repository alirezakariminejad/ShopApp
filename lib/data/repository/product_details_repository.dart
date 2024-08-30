import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/data/data_source/product_details_datasource.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/product_images.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class IProductDetailsRepository {
  Future<Either<String, List<ProductImages>>> getProductImagesRepository();
}

class ProductDetailsRepository extends IProductDetailsRepository {
  final IProductDetailsDataSource _productDetailsDataSource = locator.get();
  @override
  Future<Either<String, List<ProductImages>>> getProductImagesRepository() async {
    try {
      var response = await _productDetailsDataSource.getGallery();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
