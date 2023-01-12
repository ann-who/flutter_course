import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skincare_model.freezed.dart';
part 'skincare_model.g.dart';

@freezed
class SkincareModel with _$SkincareModel {
  const factory SkincareModel({
    required int id,
    required String title,
    required String description,
    required int price,
    required String brand,
    required String category,
    required List<String> images,
  }) = _SkincareModel;

  factory SkincareModel.fromJson(Map<String, Object?> json) =>
      _$SkincareModelFromJson(json);
}
