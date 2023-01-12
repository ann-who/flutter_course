// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skincare_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkincareModel _$$_SkincareModelFromJson(Map<String, dynamic> json) =>
    _$_SkincareModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      brand: json['brand'] as String,
      category: json['category'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_SkincareModelToJson(_$_SkincareModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'brand': instance.brand,
      'category': instance.category,
      'images': instance.images,
    };
