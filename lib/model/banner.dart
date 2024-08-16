import 'package:flutter/material.dart';
import 'package:flutter_shop_application/constants/constants.dart';

class Banner {
  String? categoryId;
  String? collectionId;
  String? id;
  String? thumbnail;

  Banner(this.categoryId, this.collectionId, this.id, this.thumbnail);

  factory Banner.fromMapJson(Map<String, dynamic> jsonObject) {
    return Banner(jsonObject["categoryId"], jsonObject["collectionId"], jsonObject["id"],
        '${baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}');
  }
}
