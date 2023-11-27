import 'package:dio/dio.dart';

final BaseOptions options = BaseOptions(
  baseUrl: 'https://sustenapp-api-production.up.railway.app',
  // baseUrl: 'http://192.168.18.171:8080',
);

final MyHttpClient = Dio(options);