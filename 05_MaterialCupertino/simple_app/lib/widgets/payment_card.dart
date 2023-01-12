import 'package:flutter/material.dart';
import 'package:simple_app/resources/app_constants.dart';
import 'package:simple_app/widgets/buttons.dart';

class PaymentCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(WidgetsSettings.padding),
      child: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.payment),
                  SizedBox(width: 10),
                  Text('Сумма'),
                  Spacer(),
                  Text('200 руб'),
                ],
              ),
              SizedBox(height: 50),
              AppTextButton(title: 'Оплатить'),
            ],
          ),
        ],
      ),
    );
  }
}
