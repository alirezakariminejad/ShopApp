import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_shop_application/data/data_source/authentication_data_source.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';
import 'package:flutter_shop_application/utils/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthenticationRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);

  Future<Either<String, String>> login(String username, String password);
}

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationDatasource _dataSource = locator.get();
  final SharedPreferences _sharedPreferences = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await _dataSource.register(username, password, passwordConfirm);
      return right('ثبت نام انجام شد :)');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _dataSource.login(username, password);
      if (token.isNotEmpty) {
        // _sharedPreferences.setString('access_token', token);
        AuthManager.saveToken(token);
        
        return right('شما با موفقیت وارد شدید :)');
      } else {
        return left('خطایی در ورود پیش آمده است :(');
      }
    } on ApiException catch (ex) {
      return left('${ex.message}');
    }
  }
}




// abstract class IAuthenticationRepository {
//   Future<Either<String, String>> register(
//       String username, String password, String passwordConfirm);

//   Future<Either<String, String>> login(String username, String password);
// }

// class AuthenticationRepository implements IAuthenticationRepository {
//   final IAuthenticationDatasource _dataSource = locator.get();
//   final SharedPreferences _sharedPref  = locator.get();

//   @override
//   Future<Either<String, String>> register(
//       String username, String password, String passwordConfirm) async {
//     try {
//       await _dataSource.register('alirezakdl11', 'alireza1403', 'alireza1403');
//       return right('ثبت نام انجام شد :)');
//     } on ApiException catch (ex) {
//       return left(ex.message ?? 'خطا محتوای متنی ندارد');
//     }
//   }

//   @override
//   Future<Either<String, String>> login(String username, String password) async {
//     try {
//       String token = await _dataSource.login(username, password);
//       if (token.isNotEmpty) {
//         _sharedPref.setString('access_token', token);
//         return right('شما با موفقیت وارد شدید :)');
//       } else {
//         return left('خطایی در ورود پیش آمده است :(');
//       }
//     } on ApiException catch (ex) {
//       return left('${ex.message}');
//     }
//   }
// }
