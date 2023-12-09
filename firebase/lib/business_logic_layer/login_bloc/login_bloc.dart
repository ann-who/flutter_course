import 'package:firebase/data_layer/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase/data_layer/models/login_state_status.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<CredentialsChecked>(_onCredentialsChecked);
    on<UserAuthorized>(_onUserAuthorized);
    on<PasswordShowed>(_onPasswordShowed);
    on<UserSignedOut>(_onUserSignedOut);
  }

  void _onCredentialsChecked(
    CredentialsChecked event,
    Emitter<LoginState> emit,
  ) {
    if (event.email.isNotEmpty &&
        event.email.length >= 2 &&
        event.password.isNotEmpty &&
        event.password.length >= 6) {
      emit(state.copyWith(
        canAuthorize: true,
        status: LoginStateStatus.needCheck,
      ));
    } else {
      emit(state.copyWith(canAuthorize: false));
    }
  }

  void _onUserAuthorized(
    UserAuthorized event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await loginRepository.createOrSignIn(event.email, event.password);
      emit(state.copyWith(
        isAuthorized: true,
        error: 'no error',
        status: LoginStateStatus.authorized,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e,
        status: LoginStateStatus.error,
      ));
    }
  }

  void _onPasswordShowed(
    PasswordShowed event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onUserSignedOut(
    UserSignedOut event,
    Emitter<LoginState> emit,
  ) async {
    await loginRepository.signOut();
    emit(state.copyWith(
      isAuthorized: false,
      error: null,
      status: LoginStateStatus.needCheck,
    ));
  }
}
