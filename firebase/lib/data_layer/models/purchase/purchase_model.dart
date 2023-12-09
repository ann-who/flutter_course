// ignore_for_file: invalid_annotation_target

import 'dart:core';
import 'package:firebase/data_layer/models/purchase_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_model.freezed.dart';
part 'purchase_model.g.dart';

@freezed
class PurchaseModel with _$PurchaseModel {
  const factory PurchaseModel({
    @Default('') String id,
    @Default('') String userId,
    required String name,
    @Default(PurchaseStatus.notBought)
    @JsonKey(fromJson: PurchaseStatus.fromJson, toJson: PurchaseStatus.toJson)
    PurchaseStatus status,
  }) = _PurchaseModel;

  factory PurchaseModel.fromJson(Map<String, Object?> json) =>
      _$PurchaseModelFromJson(json);
}
