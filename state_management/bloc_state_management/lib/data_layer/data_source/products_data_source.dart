import 'dart:io';

import 'package:dio/dio.dart';

import 'package:bloc_state_management/data_layer/models/product_model/product_model.dart';

class ProductsDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/products',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ),
  );

  Future<List<String>> getCategories() async {
    Response response;
    try {
      response = await _dio.get('/categories');
      var result = response.data;
      List<String> categories = [];

      for (var element in result) {
        categories.add(element);
      }

      return categories;
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
  }

  Future<List<ProductModel>> getCategory(String categoryName) async {
    Response response;
    try {
      response = await _dio.get('/category/$categoryName');

      Map<String, dynamic> result = response.data;
      var list = result.entries.first.value.toList();
      List<ProductModel> categoryProducts = [];

      for (var element in list) {
        var product = ProductModel(
          id: element['id'],
          title: element['title'],
          description: element['description'],
          price: element['price'],
          brand: element['brand'],
          category: element['category'],
          imageUrl: element['images'].toList().first,
        );
        categoryProducts.add(product);
      }

      return categoryProducts;
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
  }

  Future<List<ProductModel>> searchProduct(String name) async {
    Response response;
    try {
      response = await _dio.get('/search', queryParameters: {'q': name});

      Map<String, dynamic> result = response.data;
      var list = result.entries.first.value.toList();
      List<ProductModel> foundedProducts = [];

      for (var element in list) {
        var product = ProductModel(
          id: element['id'],
          title: element['title'],
          description: element['description'],
          price: element['price'],
          brand: element['brand'],
          category: element['category'],
          imageUrl: element['images'].toList().first,
        );
        foundedProducts.add(product);
      }

      return foundedProducts;
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
  }
}
