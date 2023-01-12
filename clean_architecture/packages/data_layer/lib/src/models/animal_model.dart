// ignore_for_file: invalid_annotation_target
import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_model.freezed.dart';
part 'animal_model.g.dart';

@freezed
class AnimalModel with _$AnimalModel {
  const factory AnimalModel({
    @JsonKey(name: 'Species Name') required String name,
    @JsonKey(name: 'Scientific Name') required String scientificName,
    @JsonKey(name: 'Species Illustration Photo') required String photo,
  }) = _AnimalModel;

  factory AnimalModel.fromJson(Map<String, Object?> json) =>
      _$AnimalModelFromJson(json);
}
