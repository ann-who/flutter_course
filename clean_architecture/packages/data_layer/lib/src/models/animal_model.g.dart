// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ZooAnimal _$$_ZooAnimalFromJson(Map<String, dynamic> json) => _$_ZooAnimal(
      name: json['name'] as String,
      animalType: json['animal_type'] as String,
      imageUrl: json['image_link'] as String,
    );

Map<String, dynamic> _$$_ZooAnimalToJson(_$_ZooAnimal instance) =>
    <String, dynamic>{
      'name': instance.name,
      'animal_type': instance.animalType,
      'image_link': instance.imageUrl,
    };
