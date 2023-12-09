// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  bool get obscurePassword => throw _privateConstructorUsedError;
  bool get canAuthorize => throw _privateConstructorUsedError;
  bool get isAuthorized => throw _privateConstructorUsedError;
  LoginStateStatus get status => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool obscurePassword,
      bool canAuthorize,
      bool isAuthorized,
      LoginStateStatus status,
      Object? error});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obscurePassword = null,
    Object? canAuthorize = null,
    Object? isAuthorized = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      canAuthorize: null == canAuthorize
          ? _value.canAuthorize
          : canAuthorize // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthorized: null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginStateStatus,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool obscurePassword,
      bool canAuthorize,
      bool isAuthorized,
      LoginStateStatus status,
      Object? error});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obscurePassword = null,
    Object? canAuthorize = null,
    Object? isAuthorized = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$LoginStateImpl(
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      canAuthorize: null == canAuthorize
          ? _value.canAuthorize
          : canAuthorize // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthorized: null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginStateStatus,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl extends _LoginState {
  const _$LoginStateImpl(
      {this.obscurePassword = true,
      this.canAuthorize = false,
      this.isAuthorized = false,
      this.status = LoginStateStatus.needCheck,
      this.error})
      : super._();

  @override
  @JsonKey()
  final bool obscurePassword;
  @override
  @JsonKey()
  final bool canAuthorize;
  @override
  @JsonKey()
  final bool isAuthorized;
  @override
  @JsonKey()
  final LoginStateStatus status;
  @override
  final Object? error;

  @override
  String toString() {
    return 'LoginState(obscurePassword: $obscurePassword, canAuthorize: $canAuthorize, isAuthorized: $isAuthorized, status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.canAuthorize, canAuthorize) ||
                other.canAuthorize == canAuthorize) &&
            (identical(other.isAuthorized, isAuthorized) ||
                other.isAuthorized == isAuthorized) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, obscurePassword, canAuthorize,
      isAuthorized, status, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  const factory _LoginState(
      {final bool obscurePassword,
      final bool canAuthorize,
      final bool isAuthorized,
      final LoginStateStatus status,
      final Object? error}) = _$LoginStateImpl;
  const _LoginState._() : super._();

  @override
  bool get obscurePassword;
  @override
  bool get canAuthorize;
  @override
  bool get isAuthorized;
  @override
  LoginStateStatus get status;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
