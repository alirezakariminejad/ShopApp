import 'package:dio/dio.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/utils/api_exception.dart';

abstract class IAuthenticationDatasource {
  Future<void> register(
      String username, String password, String passwordConfirm);

  Future<String> login(String username, String password);
}

class RemoteAuthentication implements IAuthenticationDatasource {
  final Dio _dio = locator.get();

  @override
  Future<void> register(
      String username, String password, String passwordConfirm) async {
    try {
      final response = await _dio.post('collections/users/records', data: {
        'username': username,
        'password': password,
        'passwordConfirm': passwordConfirm
      });
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
      // print(ex.response?.statusCode);
      // print(ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      final response =
          await _dio.post('collections/users/auth-with-password', data: {
        'identity': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        return response.data?['token'];
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
    return '';
  }
}


 


// abstract class IAuthenticationDatasource {
//   Future<void> register(
//       String username, String password, String passwordConfirm);

//   Future<String> login(String username, String password);
// }

// class RemoteAuthentication implements IAuthenticationDatasource {
//   final Dio _dio = locator.get();

//   @override
//   Future<void> register(
//       String username, String password, String passwordConfirm) async {
//     try {
//       final response = await _dio.post('collections/users/records', data: {
//         'username': username,
//         'password': password,
//         'passwordConfirm': passwordConfirm
//       });
//     } on DioError catch (excep) {
//       throw ApiException(
//           excep.response?.statusCode, excep.response?.data['message']);
//       // print(excep.response?.statusCode);
//       // print('Dio error: ${excep.response?.data['message']}');
//     } catch (excep) {
//       throw ApiException(0, 'unkown error');
//     }
//   }

//   @override
//   Future<String> login(String username, String password) async {
//     try {
//       final response = await _dio.post('collections/users/auth-with-password',
//           data: {'identity': username, 'password': password});

//       if (response.statusCode == 200) {
//         return response.data?['token'];
//       }
//     } on DioError catch (excep) {
//       throw ApiException(
//           excep.response?.statusCode, excep.response?.data['message']);
//     } catch (excep) {
//       throw ApiException(0, 'unknown error');
//     }
//     return '';
//   }
// }
