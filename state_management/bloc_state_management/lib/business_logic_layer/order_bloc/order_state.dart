part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const OrderState._();

  const factory OrderState({
    @Default([]) List<CreatedOrderModel> orders,
    required Map<int, int> daysInMonth,
  }) = _OrderState;
}
