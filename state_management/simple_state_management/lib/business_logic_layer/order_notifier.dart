import 'package:flutter/material.dart';
import 'package:simple_state_management/data_layer/models/created_order/created_order_model.dart';
import 'package:simple_state_management/data_layer/models/product_model/product_model.dart';

class OrderNotifier extends ChangeNotifier {
  List<CreatedOrderModel> orders = [];
  List<String> imagesUrl = [];
  bool isLoading = false;

  Map<int, int> daysInMonth = {
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
  };

  String creationDate =
      '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
  String deliveryDate() {
    var calculatedDate = '';
    var currentMonth = daysInMonth.entries
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

  placeNewOrder(List<ProductModel> products) {
    orders.add(
      CreatedOrderModel(
        products: products,
        creationDate: creationDate,
        deliveryDate: deliveryDate(),
      ),
    );
    notifyListeners();
  }

  List<String> orderImages(List<ProductModel> products) {
    for (var element in products) {
      imagesUrl.add(element.imageUrl);
    }

    return imagesUrl;
  }
}
