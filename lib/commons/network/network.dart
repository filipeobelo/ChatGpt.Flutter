import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.openai.com',
    headers: {
      'Authorization': 'Bearer myToken'
    }
  ),
);