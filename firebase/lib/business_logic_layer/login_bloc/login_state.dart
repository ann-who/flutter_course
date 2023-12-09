part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState({
    @Default(true) bool obscurePassword,
    @Default(false) bool canAuthorize,
    @Default(false) bool isAuthorized,
    @Default(LoginStateStatus.needCheck) LoginStateStatus status,
    Object? error,
  }) = _LoginState;
}
