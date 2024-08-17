import 'package:flutter_shop_application/constants/constants.dart';

class BannerModel {
  String? categoryId;
  String? collectionId;
  String? id;
  String? thumbnail;

  BannerModel(this.categoryId, this.collectionId, this.id, this.thumbnail);

  factory BannerModel.fromMapJson(Map<String, dynamic> jsonObject) {
    return BannerModel(
      jsonObject["categoryId"],
      jsonObject["collectionId"],
      jsonObject["id"],
      '${baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
