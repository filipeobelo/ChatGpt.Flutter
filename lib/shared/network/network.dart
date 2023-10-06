import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  
  @singleton
  Dio provideDio() =>
      Dio(BaseOptions(baseUrl: 'https://api.openai.com', headers: {
        'Authorization':
            'Bearer myToken'
      }));
}
