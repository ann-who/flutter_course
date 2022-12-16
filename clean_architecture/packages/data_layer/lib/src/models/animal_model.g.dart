// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnimalModel _$$_AnimalModelFromJson(Map<String, dynamic> json) =>
    _$_AnimalModel(
      name: json['Species Name'] as String,
      scientificName: json['Scientific Name'] as String,
      photo: json['Species Illustration Photo'] as String,
    );

Map<String, dynamic> _$$_AnimalModelToJson(_$_AnimalModel instance) =>
    <String, dynamic>{
      'Species Name': instance.name,
      'Scientific Name': instance.scientificName,
      'Species Illustration Photo': instance.photo,
    };
