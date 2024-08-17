import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_application/model/banner_model.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class IBannerDataSource {
  Future<List<BannerModel>> getBanners();
}

class BannerRemoteDataSource extends IBannerDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerModel>> getBanners() async {
    var response = await _dio.get('collections/banner/records');

    try {
      return response.data["items"]
          .map<BannerModel>((jsonObject) => BannerModel.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
