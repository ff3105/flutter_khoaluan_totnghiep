import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import '../../configs/constants/app_endpoint.dart';

class DioService extends DioForNative {
  DioService({BaseOptions options}) : super(options) {
    interceptors.add(
      InterceptorsWrapper(
        onRequest: _request,
        onResponse: _response,
        onError: _error,
      ),
    );
  }

  RequestOptions _request(RequestOptions options) {
    options
      ..connectTimeout = 10000
      ..receiveTimeout = 10000
      ..baseUrl = AppEndpoint.base
      ..headers = {'Accept': 'application/json'};
    return options;
  }

  Response _response(Response response) {
    return response;
  }

  DioError _error(DioError error) {
    return error;
  }
}