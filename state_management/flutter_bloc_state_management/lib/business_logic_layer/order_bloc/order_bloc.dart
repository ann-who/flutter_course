import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/data_layer/models/created_order/created_order_model.dart';
import 'package:flutter_bloc_state_management/data_layer/models/product_model/product_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc()
      : super(
          const OrderState(
            daysInMonth: {
              1: 31,
              2: 28,
              3: 31,
              4: 30,
              5: 31,
              6: 30,
              7: 31,
              8: 31,
              9: 30,
              10: 31,
              11: 30,
              12: 31,
            },
          ),
        ) {
    on<NewOrderPlaced>(_onNewOrderPlaced);
  }

  void _onNewOrderPlaced(
    NewOrderPlaced event,
    Emitter<OrderState> emit,
  ) async {
    var currentOrders = List<CreatedOrderModel>.from(state.orders);
    String creationDate =
        '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
    String deliveryDate() {
      var calculatedDate = '';
      var currentMonth = state.daysInMonth.entries
          .where((element) => element.key == DateTime.now().month)
          .first;

      if (DateTime.now().day + 10 <= currentMonth.value) {
        calculatedDate =
            '${DateTime.now().day + 10}.${DateTime.now().month}.${DateTime.now().year}';
      } else if (DateTime.now().day + 10 > currentMonth.value &&
          currentMonth.key != 12) {
        calculatedDate =
            '${DateTime.now().day - currentMonth.value + 10}.${DateTime.now().month + 1}.${DateTime.now().year}';
      } else {
        calculatedDate =
            '${DateTime.now().day - currentMonth.value + 10}.01.${DateTime.now().year + 1}';
      }

      return calculatedDate;
    }

    var updatedOrders = currentOrders;

    updatedOrders.add(
      CreatedOrderModel(
        products: event.products,
        creationDate: creationDate,
        deliveryDate: deliveryDate(),
      ),
    );

    emit(state.copyWith(orders: updatedOrders));
  }
}
