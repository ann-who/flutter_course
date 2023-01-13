// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      brand: json['brand'] as String,
      category: $enumDecode(_$ProductCategoryEnumMap, json['category']),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'brand': instance.brand,
      'category': _$ProductCategoryEnumMap[instance.category]!,
      'images': instance.images,
    };

const _$ProductCategoryEnumMap = {
  ProductCategory.fragrances: 'fragrances',
  ProductCategory.skincare: 'skincare',
};
