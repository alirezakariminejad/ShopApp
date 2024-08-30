import 'package:flutter_shop_application/constants/constants.dart';

class ProductImages {
  String? productId;
  String? image;

  ProductImages(this.productId, this.image);

  factory ProductImages.fromMapJson(Map<String, dynamic> jsonObject) {
    return ProductImages(
      jsonObject["product_id"],
      '${baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
    );
  }
}
