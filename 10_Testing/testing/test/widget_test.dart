// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/components/register_form.dart';

import 'package:testing/views/login_view.dart';

void main() {
  group('Login view tests', () {
    testWidgets('Login form widgets', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      // LoginForm tests
      expect(find.byKey(Key('loginEmailField')), findsOneWidget);
      expect(find.byKey(Key('loginPhoneField')), findsOneWidget);
      expect(find.byKey(Key('loginSubmitButton')), findsOneWidget);

      await tester.enterText(
          find.byKey(Key('loginEmailField')), 'ann@test.com');
      expect(find.text('ann@test.com'), findsOneWidget);

      await tester.enterText(find.byKey(Key('loginPhoneField')), '89908807766');
      expect(find.text('89908807766'), findsOneWidget);

      await tester.tap(find.byKey(Key('loginSubmitButton')));
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);
    });

    testWidgets('Register form widgets', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterForm(),
      ));

      // RegisterForm tests
      expect(find.byKey(Key('signUpFirstNameField')), findsOneWidget);
      expect(find.byKey(Key('signUpLastNameField')), findsOneWidget);
      expect(find.byKey(Key('signUpPhoneField')), findsOneWidget);
      expect(find.byKey(Key('signUpFmailField')), findsOneWidget);
      expect(find.byKey(Key('signUpSubmitButton')), findsOneWidget);

      await tester.enterText(find.byKey(Key('signUpFirstNameField')), 'Ann');
      expect(find.text('Ann'), findsOneWidget);

      await tester.enterText(find.byKey(Key('signUpLastNameField')), 'Smith');
      expect(find.text('Smith'), findsOneWidget);

      await tester.enterText(
          find.byKey(Key('signUpPhoneField')), '89908807766');
      expect(find.text('89908807766'), findsOneWidget);

      await tester.enterText(
          find.byKey(Key('signUpFmailField')), 'ann@test.com');
      expect(find.text('ann@test.com'), findsOneWidget);

      await tester.tap(find.byKey(Key('signUpSubmitButton')));
      await tester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
    });
  });
}
