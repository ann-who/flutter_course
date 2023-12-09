import 'package:firebase/ui_layer/purchases_page/purchases_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase/business_logic_layer/login_bloc/login.dart';
import 'package:firebase/data_layer/models/login_state_status.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.canAuthorize &&
                state.status == LoginStateStatus.authorized) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PurchasesPage(),
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'E-mail',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: emailController,
                      onChanged: (value) => loginBloc.add(
                        CredentialsChecked(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: state.obscurePassword,
                      decoration: InputDecoration(
                        hintText: ('Password (6 characters min)'),
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(40.0),
                          onTap: () => loginBloc.add(PasswordShowed()),
                          child: state.obscurePassword
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                      controller: passwordController,
                      onChanged: (value) => loginBloc.add(
                        CredentialsChecked(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      ),
                    ),
                    if (state.status == LoginStateStatus.error)
                      const SizedBox(height: 16.0),
                    if (state.status == LoginStateStatus.error)
                      const Text(
                        'Check your email or/and password',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (previous, current) =>
                previous.canAuthorize != current.canAuthorize,
            builder: (context, state) {
              return ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: !state.canAuthorize
                      ? MaterialStatePropertyAll<Color>(
                          Colors.grey.withOpacity(0.4),
                        )
                      : null,
                ),
                onPressed: state.canAuthorize
                    ? () => loginBloc.add(UserAuthorized(
                          email: emailController.text,
                          password: passwordController.text,
                        ))
                    : null,
                child: const Text('Continue'),
              );
            },
          ),
        ),
      ),
    );
  }
}
