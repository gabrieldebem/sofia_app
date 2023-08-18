import 'package:dio/dio.dart';

abstract class IClient {
  String url = 'https://l0me52wcld.execute-api.us-east-1.amazonaws.com/dev';

  Dio client() => Dio(
        BaseOptions(
          baseUrl: url,
        ),
      );
}
