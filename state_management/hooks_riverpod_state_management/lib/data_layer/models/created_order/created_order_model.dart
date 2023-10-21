import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hooks_riverpod_state_management/data_layer/models/product_model/product_model.dart';

part 'created_order_model.freezed.dart';
part 'created_order_model.g.dart';

@freezed
class CreatedOrderModel with _$CreatedOrderModel {
  const factory CreatedOrderModel({
    required List<ProductModel> products,
    required String creationDate,
    required String deliveryDate,
  }) = _CreatedOrderModel;

  factory CreatedOrderModel.fromJson(Map<String, Object?> json) =>
      _$CreatedOrderModelFromJson(json);
}
