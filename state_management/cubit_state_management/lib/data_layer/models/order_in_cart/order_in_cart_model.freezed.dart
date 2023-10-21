// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_in_cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderInCartModel _$OrderInCartModelFromJson(Map<String, dynamic> json) {
  return _OrderInCartModel.fromJson(json);
}

/// @nodoc
mixin _$OrderInCartModel {
  ProductModel get product => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderInCartModelCopyWith<OrderInCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderInCartModelCopyWith<$Res> {
  factory $OrderInCartModelCopyWith(
          OrderInCartModel value, $Res Function(OrderInCartModel) then) =
      _$OrderInCartModelCopyWithImpl<$Res, OrderInCartModel>;
  @useResult
  $Res call({ProductModel product, int count});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderInCartModelCopyWithImpl<$Res, $Val extends OrderInCartModel>
    implements $OrderInCartModelCopyWith<$Res> {
  _$OrderInCartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderInCartModelImplCopyWith<$Res>
    implements $OrderInCartModelCopyWith<$Res> {
  factory _$$OrderInCartModelImplCopyWith(_$OrderInCartModelImpl value,
          $Res Function(_$OrderInCartModelImpl) then) =
      __$$OrderInCartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductModel product, int count});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$OrderInCartModelImplCopyWithImpl<$Res>
    extends _$OrderInCartModelCopyWithImpl<$Res, _$OrderInCartModelImpl>
    implements _$$OrderInCartModelImplCopyWith<$Res> {
  __$$OrderInCartModelImplCopyWithImpl(_$OrderInCartModelImpl _value,
      $Res Function(_$OrderInCartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? count = null,
  }) {
    return _then(_$OrderInCartModelImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderInCartModelImpl implements _OrderInCartModel {
  const _$OrderInCartModelImpl({required this.product, this.count = 1});

  factory _$OrderInCartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderInCartModelImplFromJson(json);

  @override
  final ProductModel product;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'OrderInCartModel(product: $product, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderInCartModelImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, product, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderInCartModelImplCopyWith<_$OrderInCartModelImpl> get copyWith =>
      __$$OrderInCartModelImplCopyWithImpl<_$OrderInCartModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderInCartModelImplToJson(
      this,
    );
  }
}

abstract class _OrderInCartModel implements OrderInCartModel {
  const factory _OrderInCartModel(
      {required final ProductModel product,
      final int count}) = _$OrderInCartModelImpl;

  factory _OrderInCartModel.fromJson(Map<String, dynamic> json) =
      _$OrderInCartModelImpl.fromJson;

  @override
  ProductModel get product;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$OrderInCartModelImplCopyWith<_$OrderInCartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
