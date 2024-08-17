import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/data/data_source/banner_data_source.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/model/banner_model.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerModel>>> getBanners();
}

class BannerRepository extends IBannerRepository {
  final IBannerDataSource _bannerDataSource = locator.get();
  @override
  Future<Either<String, List<BannerModel>>> getBanners() async {
    try {
      var response = await _bannerDataSource.getBanners();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
