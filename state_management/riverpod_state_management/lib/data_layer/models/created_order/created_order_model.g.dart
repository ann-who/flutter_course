// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatedOrderModelImpl _$$CreatedOrderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatedOrderModelImpl(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationDate: json['creationDate'] as String,
      deliveryDate: json['deliveryDate'] as String,
    );

Map<String, dynamic> _$$CreatedOrderModelImplToJson(
        _$CreatedOrderModelImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
      'creationDate': instance.creationDate,
      'deliveryDate': instance.deliveryDate,
    };
