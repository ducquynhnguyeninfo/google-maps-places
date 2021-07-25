import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/core/network/network_manager.dart';

abstract class NetworkProvider {
  final NetworkManager networkManager;

  NetworkProvider({required this.networkManager});

  Dio get http => networkManager.dio;

  @protected
  Future<dynamic> get(String path,
      {Options? options,
      Map<String, dynamic>? queryParameters,
      String? query,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    print("get: ${path.toString()}");

    var response = await http.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);

    return response.data;
  }
}
