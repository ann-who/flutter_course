import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;
  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              key: Key('signUpFirstNameField'),
              decoration: InputDecoration(labelText: 'First name'),
              validator: (value) {
                if (value == '') return 'Введите имя';
                return null;
              },
            ),
            TextFormField(
              key: Key('signUpLastNameField'),
              decoration: InputDecoration(labelText: 'Last name'),
              validator: (value) {
                if (value == '') return 'Введите фамилию';
                return null;
              },
            ),
            TextFormField(
              key: Key('signUpPhoneField'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(labelText: 'Phone'),
              validator: (value) {
                if (value == '') return 'Заполните поле телефон';
                return null;
              },
            ),
            TextFormField(
              key: Key('signUpFmailField'),
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == '') return 'Заполните поле email';
                if (!validateEmail(value!)) return 'Емейл не корректный';
                return null;
              },
            ),
            ElevatedButton(
              key: Key('signUpSubmitButton'),
              child: Text('Отправить'),
              onPressed: _handleSubmit,
            ),
            if (_isSuccess) Text('Вы успешно зарегистрировались')
          ],
        ),
      ),
    );
  }
}
