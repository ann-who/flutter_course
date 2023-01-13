import 'dart:io';

import 'package:dio/dio.dart';

import 'package:simple_state_management/data_layer/models/product_model/product_model.dart';

class ProductsDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/products/categories',
      connectTimeout: 3000,
      receiveTimeout: 5000,
    ),
  );

  Future<List<ProductModel>> getSkincare() async {
    Response response;
    response = await _dio.get('/skincare');
    try {
      response = await _dio.get('/skincare');
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

    return [
      ProductModel(
        id: result['id'],
        title: result['title'],
        description: result['description'],
        price: result['price'],
        brand: result['brand'],
        category: result['category'],
        images: result['images'],
      ),
    ];
  }

  Future<List<ProductModel>> getFragrances() async {
    Response response;
    response = await _dio.get('/fragrances');
    try {
      response = await _dio.get('/fragrances');
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

    return [
      ProductModel(
        id: result['id'],
        title: result['title'],
        description: result['description'],
        price: result['price'],
        brand: result['brand'],
        category: result['category'],
        images: result['images'],
      ),
    ];
  }
}
