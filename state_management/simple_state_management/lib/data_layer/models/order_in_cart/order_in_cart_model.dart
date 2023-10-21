import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_state_management/data_layer/models/product_model/product_model.dart';

part 'order_in_cart_model.freezed.dart';
part 'order_in_cart_model.g.dart';

@freezed
class OrderInCartModel with _$OrderInCartModel {
  const factory OrderInCartModel({
    required ProductModel product,
    @Default(1) int count,
  }) = _OrderInCartModel;

  factory OrderInCartModel.fromJson(Map<String, Object?> json) =>
      _$OrderInCartModelFromJson(json);
}
