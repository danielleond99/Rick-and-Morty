import 'package:dio/dio.dart';

final _optionsApi = BaseOptions(baseUrl: 'https://rickandmortyapi.com/api');
final apiDio = Dio(_optionsApi);
