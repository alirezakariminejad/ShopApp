import 'package:flutter_shop_application/constants/constants.dart';

class Product {
  String? id;
  String? name;
  String? category;
  String? collectionId;
  String? thumbnail;
  String? description;
  int? price;
  int? discountPrice;
  String? popularity;
  int? quantity;

  Product(
    this.id,
    this.name,
    this.category,
    this.collectionId,
    this.thumbnail,
    this.description,
    this.price,
    this.discountPrice,
    this.popularity,
    this.quantity,
  );

  factory Product.fromMapJson(Map<String, dynamic> jsonObject) {
    return Product(
      jsonObject["id"],
      jsonObject["name"],
      jsonObject["category"],
      jsonObject["collectionId"],
      '${baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      jsonObject["description"],
      jsonObject["price"],
      jsonObject["discountPrice"],
      jsonObject["popularity"],
      jsonObject["quantity"],
    );
  }
}
