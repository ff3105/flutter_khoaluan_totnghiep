import 'package:dio/dio.dart';
import '../../configs/constants/app_endpoint.dart';
import '../../configs/configs.dart';
import '../resources.dart';

class AuthRepository {
  Future<Response> login(String email, String password) async {
    try {
      final params = FormData.fromMap({
        'email': email,
        'password': password,
      });
      final response = await DioService().post(AppEndpoint.login, data: params);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response> forgotPassword(String email) async {
    try {
      final params = FormData.fromMap({
        'email': email,
      });
      final response =
          await DioService().post(AppEndpoint.forgotPassword, data: params);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response> register(String name, String email, String phone,
      String password, int gender) async {
    try {
      final params = FormData.fromMap({
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'gender': gender,
      });
      final response =
          await DioService().post(AppEndpoint.register, data: params);
      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }
}