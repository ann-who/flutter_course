import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool successMessage = false;
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      setState(() {
        successMessage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: Key('loginEmailField'),
            validator: (value) {
              if (value == '') return 'Введите email';
              if (!validateEmail(value!))
                return 'Поле email заполнено не корректно';
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            key: Key('loginPhoneField'),
            validator: (value) {
              if (value == '') return 'Введите телефон';
              return null;
            },
            decoration: InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          ElevatedButton(
            key: Key('loginSubmitButton'),
            child: Text('Отправить'),
            onPressed: _submit,
          ),
          if (successMessage) Text('Добро пожаловать'),
        ],
      ),
    );
  }
}
