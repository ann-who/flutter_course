import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/business_logic_layer/notifiers/order/order_state.dart';
import 'package:riverpod_state_management/data_layer/models/created_order/created_order_model.dart';
import 'package:riverpod_state_management/data_layer/models/product_model/product_model.dart';

final orderNotifierProvider =
    StateNotifierProvider<OrderNotifier, OrderState>((ref) {
  return OrderNotifier();
});

class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier()
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
        );

  placeNewOrder(List<ProductModel> products) {
    String creationDate =
        '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
    String deliveryDate() {
      var calculatedDate = '';
      var currentMonth = state.daysInMonth.entries
          .where((element) => element.key == DateTime.now().month)
          .first;

      var day = DateTime.now().day;
      var month = DateTime.now().month;
      var year = DateTime.now().year;

      if (day + 10 <= currentMonth.value) {
        calculatedDate = '${day + 10}.$month.$year';
      } else if (day + 10 > currentMonth.value && currentMonth.key != 12) {
        calculatedDate = '${day - currentMonth.value + 10}.${month + 1}.$year';
      } else {
        calculatedDate = '${day - currentMonth.value + 10}.01.${year + 1}';
      }

      return calculatedDate;
    }

    List<CreatedOrderModel> updatedOrders = List.from(state.orders);
    updatedOrders.add(
      CreatedOrderModel(
        products: products,
        creationDate: creationDate,
        deliveryDate: deliveryDate(),
      ),
    );

    state = state.copyWith(orders: updatedOrders);
  }

  // List<String> orderImages(List<ProductModel> products) {
  //   for (var element in products) {
  //     imagesUrl.add(element.imageUrl);
  //   }

  //   return imagesUrl;
  // }
}
