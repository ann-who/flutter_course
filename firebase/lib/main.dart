import 'package:firebase/data_layer/data_source/firebase_login_data_source.dart';
import 'package:firebase/data_layer/repository/login_repository_impl.dart';
import 'package:firebase/ui_layer/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

import 'package:firebase/business_logic_layer/login_bloc/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            loginRepository: LoginRepositoryImplementation(
              loginDataSource: FirebaseLoginDataSource(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Colors.lightBlue.withOpacity(0.2);
              } else if (states.contains(MaterialState.error)) {
                return Colors.red.withOpacity(0.1);
              } else {
                return Colors.grey.withOpacity(0.1);
              }
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          suffixIconColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Colors.blue;
              } else {
                return Colors.grey;
              }
            },
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
