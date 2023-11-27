import 'package:dio/dio.dart';

final BaseOptions options = BaseOptions(
  baseUrl: 'http://192.168.18.226',
);

final MyEspHttpClient = Dio(options);