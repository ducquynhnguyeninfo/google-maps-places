import 'package:dio/dio.dart';
import 'package:places/config/secret.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    options.queryParameters['key'] = Secret.apiKey;

    return super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}
