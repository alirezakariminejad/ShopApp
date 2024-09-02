import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/model/product_images.dart';

abstract class ProductState {}

class ProductDetailsLoadingState extends ProductState {}

class ProductDetailsInitialState extends ProductState {}

class ProductDetailsResponseState extends ProductState {
  Either<String, List<ProductImages>> getProductImages;
  ProductDetailsResponseState(this.getProductImages);
}
