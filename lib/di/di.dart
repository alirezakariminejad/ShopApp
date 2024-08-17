import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_shop_application/data/data_source/authentication_data_source.dart';
import 'package:flutter_shop_application/data/data_source/banner_data_source.dart';
import 'package:flutter_shop_application/data/data_source/category_data_source.dart';
import 'package:flutter_shop_application/data/repository/authentication_repository.dart';
import 'package:flutter_shop_application/data/repository/banner_repository.dart';
import 'package:flutter_shop_application/data/repository/category_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  // components
  locator.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: 'https://startflutter.ir/api/')));

  locator.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

//datasources
  locator.registerFactory<IAuthenticationDatasource>(() => RemoteAuthentication());
  locator.registerFactory<ICategoryDataSource>(() => CategoryRemoteDataSource());
  locator.registerFactory<IBannerDataSource>(() => BannerRemoteDataSource());

  //repositories
  locator.registerFactory<IAuthenticationRepository>(() => AuthenticationRepository());

  locator.registerFactory<ICateogoryRepository>(() => CategoryRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
}

// var locator = GetIt.instance;
// Future<void> getItInit() async {
//   // component
//   locator.registerSingleton<Dio>(
//       Dio(BaseOptions(baseUrl: 'https://startflutter.ir/api/')));

//   locator.registerSingleton<SharedPreferences>(
//       await SharedPreferences.getInstance());

//   //datasources
//   locator
//       .registerFactory<IAuthenticationDatasource>(() => RemoteAuthentication());

//   //repositories
//   locator.registerFactory<IAuthenticationRepository>(
//       () => AuthenticationRepository());
// }
