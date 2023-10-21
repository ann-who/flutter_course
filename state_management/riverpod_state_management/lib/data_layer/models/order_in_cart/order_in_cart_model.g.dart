// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_in_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderInCartModelImpl _$$OrderInCartModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderInCartModelImpl(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 1,
    );

Map<String, dynamic> _$$OrderInCartModelImplToJson(
        _$OrderInCartModelImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'count': instance.count,
    };
