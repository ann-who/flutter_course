// ignore_for_file: invalid_annotation_target
import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_model.freezed.dart';
part 'animal_model.g.dart';

@freezed
class ZooAnimal with _$ZooAnimal {
  const factory ZooAnimal({
    required String name,
    @JsonKey(name: 'animal_type') required String animalType,
    @JsonKey(name: 'image_link') required String imageUrl,
  }) = _ZooAnimal;

  factory ZooAnimal.fromJson(Map<String, Object?> json) =>
      _$ZooAnimalFromJson(json);
}
