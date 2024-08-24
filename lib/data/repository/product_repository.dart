import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/data/data_source/product_data_source.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/product.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class IProducRepository {
  Future<Either<String, List<Product>>> getProductsRepositories();
  Future<Either<String, List<Product>>> getBestSellerProductsRepositories();
  Future<Either<String, List<Product>>> getHottestProductsRepositories();
}

class ProductRepository extends IProducRepository {
  final IProductDataSource _productDataSource = locator.get();
  @override
  Future<Either<String, List<Product>>> getProductsRepositories() async {
    try {
      var response = await _productDataSource.getProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Product>>> getBestSellerProductsRepositories() async {
    try {
      var response = await _productDataSource.getBestSellerProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Product>>> getHottestProductsRepositories() async {
    try {
      var response = await _productDataSource.getHottestProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
