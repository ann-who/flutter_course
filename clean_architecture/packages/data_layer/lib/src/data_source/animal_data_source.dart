import 'dart:io';
import 'dart:math';
import 'package:data_layer/src/models/animal_model.dart';
import 'package:dio/dio.dart';

class AnimalDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.fishwatch.gov/api',
      connectTimeout: 3000,
      receiveTimeout: 5000,
    ),
  );

  Future<AnimalModel> getAnimal() async {
    Response response;
    response = await _dio.get('/species');
    try {
      response = await _dio.get('/species');
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
    final random = Random();
    var animal = result[random.nextInt(result.length)];

    return AnimalModel(
      name: animal['Species Name'],
      scientificName: animal['Scientific Name'],
      photo: animal['Species Illustration Photo']['src'],
    );
  }
}
