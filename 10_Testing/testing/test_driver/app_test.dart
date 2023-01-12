import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final finderLoginEmailField = find.byValueKey('loginEmailField');
    final finderLoginPhoneField = find.byValueKey('loginPhoneField');
    final finderLoginSubmitButton = find.byValueKey('loginSubmitButton');

    test('Test login email field', () async {
      await driver!.tap(finderLoginEmailField);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('ann@test.com');
      await driver!.waitFor(find.text('ann@test.com'));
    });

    test('Test login phone field', () async {
      await driver!.tap(finderLoginPhoneField);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('89908807766');
      await driver!.waitFor(find.text('89908807766'));
    });

    test('Test login submit button', () async {
      await driver!.tap(finderLoginSubmitButton);
    });

    test('Test login message', () async {
      final successMessage = find.text('Добро пожаловать');
      expect(await driver!.getText(successMessage), 'Добро пожаловать');
    });
  });

  group('Rigister form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final finderSignUpFirstNameField = find.byValueKey('signUpFirstNameField');
    final finderSignUpLastNameField = find.byValueKey('signUpLastNameField');
    final finderSignUpPhoneField = find.byValueKey('signUpPhoneField');
    final finderSignUpEmailField = find.byValueKey('signUpFmailField');
    final finderSignUpSubmitButton = find.byValueKey('signUpSubmitButton');

    test('Test sign up first name field', () async {
      await driver!.tap(finderSignUpFirstNameField);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Ann');
      await driver!.waitFor(find.text('Ann'));
    });

    test('Test sign up last name field', () async {
      await driver!.tap(finderSignUpLastNameField);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Smith');
      await driver!.waitFor(find.text('Smith'));
    });

    test('Test sign up phone field', () async {
      await driver!.tap(finderSignUpPhoneField);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('89908807766');
      await driver!.waitFor(find.text('89908807766'));
    });

    test('Test sign up email field', () async {
      await driver!.tap(finderSignUpEmailField);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('ann@test.com');
      await driver!.waitFor(find.text('ann@test.com'));
    });

    test('Test sign up submit button', () async {
      await driver!.tap(finderSignUpSubmitButton);
    });

    test('Test sign up message', () async {
      final successMessage = find.text('Вы успешно зарегистрировались');
      expect(await driver!.getText(successMessage),
          'Вы успешно зарегистрировались');
    });
  });
}
