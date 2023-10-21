import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod_state_management/data_layer/models/created_order/created_order_model.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const OrderState._();

  const factory OrderState({
    @Default([]) List<CreatedOrderModel> orders,
    required Map<int, int> daysInMonth,
  }) = _OrderState;
}
