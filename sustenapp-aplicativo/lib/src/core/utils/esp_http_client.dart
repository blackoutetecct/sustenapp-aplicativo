import 'package:dio/dio.dart';

final BaseOptions options = BaseOptions(
  baseUrl: 'http://192.168.134.68',
);

final MyEspHttpClient = Dio(options);
