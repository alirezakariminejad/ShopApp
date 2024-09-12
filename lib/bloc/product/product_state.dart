import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/model/category.dart';
import 'package:flutter_shop_application/model/product_images.dart';
import 'package:flutter_shop_application/model/product_variant.dart';
import 'package:flutter_shop_application/model/variant_type.dart';

abstract class ProductState {}

class ProductDetailsLoadingState extends ProductState {}

class ProductDetailsInitialState extends ProductState {}

class ProductDetailsResponseState extends ProductState {
  Either<String, List<ProductImages>> productImages;
  Either<String, List<ProductVariant>> productVariants;
  Either<String, Category> productCategory;
  ProductDetailsResponseState(this.productImages, this.productVariants, this.productCategory);
}
 