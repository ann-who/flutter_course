import 'dart:io';

import 'package:data_layer/src/models/animal_model.dart';
import 'package:dio/dio.dart';

class AnimalDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://zoo-animal-api.herokuapp.com/animals',
      connectTimeout: 3000,
      receiveTimeout: 5000,
    ),
  );

  Future<ZooAnimal> getAnimal() async {
    Response response;
    try {
      response = await _dio.get('/rand');
    } on DioError catch (e) {
      if (e.response == null) {
        rethrow;
      }

      if (e.response!.statusCode == HttpStatus.notFound) {
        throw const HttpException('Not found');
      } else if (e.response!.statusCode != HttpStatus.ok) {
        throw const HttpException('Unknown error');
      }

      rethrow;
    }
    var result = response.data;
    return result.fromJson();
  }
}
