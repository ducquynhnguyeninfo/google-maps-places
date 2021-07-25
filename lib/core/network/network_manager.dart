import 'package:dio/dio.dart';
import 'package:places/values/values.dart';

import 'authorization_interceptor.dart';

class NetworkManager {
  bool isConnected = true;

  late final Dio _dio;
  static final NetworkManager _networkManager = new NetworkManager._private();
  String token = "";

  Dio get dio => _dio;

  NetworkManager._private() {
    _dio = new Dio();
    _dio.options.connectTimeout = APP_CONNECTION_TIMEOUT;
    _dio.options.receiveTimeout = APP_RECEIVE_TIMEOUT;

    _dio.interceptors.add(new AuthorizationInterceptor());
    _dio.interceptors.add(new LogInterceptor());
  }

  factory NetworkManager() {
    return _networkManager;
  }

  void close() {
    _dio.close();
  }

  void addInterceptor(Interceptor interceptor) =>
      _dio.interceptors.add(interceptor);

  void setBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }

  void setNetworkConfig(BaseOptions options) {
    _dio.options = options;
  }
}
