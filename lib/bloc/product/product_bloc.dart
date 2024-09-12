import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_application/bloc/product/product_event.dart';
import 'package:flutter_shop_application/bloc/product/product_state.dart';
import 'package:flutter_shop_application/data/repository/product_details_repository.dart';
import 'package:flutter_shop_application/di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailsRepository _productRepository = locator.get();

  ProductBloc() : super(ProductDetailsInitialState()) {
    on<ProductInitalizeEvent>(
      (event, emit) async {
        emit(ProductDetailsLoadingState());
        var productImages = await _productRepository.getProductImagesRepository(event.productId);
        var productVariants = await _productRepository.getProductVariantsRepository();
        emit(ProductDetailsResponseState(productImages, productVariants));
      },
    );
  }
}
