// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartState {
  List<OrderInCartModel> get ordersInCart =>
      throw _privateConstructorUsedError; // unique products to show the pics in orders list
  Set<ProductModel> get currentProducts => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {List<OrderInCartModel> ordersInCart,
      Set<ProductModel> currentProducts,
      int totalPrice,
      bool isLoading});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordersInCart = null,
    Object? currentProducts = null,
    Object? totalPrice = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      ordersInCart: null == ordersInCart
          ? _value.ordersInCart
          : ordersInCart // ignore: cast_nullable_to_non_nullable
              as List<OrderInCartModel>,
      currentProducts: null == currentProducts
          ? _value.currentProducts
          : currentProducts // ignore: cast_nullable_to_non_nullable
              as Set<ProductModel>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrderInCartModel> ordersInCart,
      Set<ProductModel> currentProducts,
      int totalPrice,
      bool isLoading});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordersInCart = null,
    Object? currentProducts = null,
    Object? totalPrice = null,
    Object? isLoading = null,
  }) {
    return _then(_$CartStateImpl(
      ordersInCart: null == ordersInCart
          ? _value._ordersInCart
          : ordersInCart // ignore: cast_nullable_to_non_nullable
              as List<OrderInCartModel>,
      currentProducts: null == currentProducts
          ? _value._currentProducts
          : currentProducts // ignore: cast_nullable_to_non_nullable
              as Set<ProductModel>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CartStateImpl extends _CartState {
  const _$CartStateImpl(
      {final List<OrderInCartModel> ordersInCart = const [],
      final Set<ProductModel> currentProducts = const {},
      this.totalPrice = 0,
      this.isLoading = false})
      : _ordersInCart = ordersInCart,
        _currentProducts = currentProducts,
        super._();

  final List<OrderInCartModel> _ordersInCart;
  @override
  @JsonKey()
  List<OrderInCartModel> get ordersInCart {
    if (_ordersInCart is EqualUnmodifiableListView) return _ordersInCart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ordersInCart);
  }

// unique products to show the pics in orders list
  final Set<ProductModel> _currentProducts;
// unique products to show the pics in orders list
  @override
  @JsonKey()
  Set<ProductModel> get currentProducts {
    if (_currentProducts is EqualUnmodifiableSetView) return _currentProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_currentProducts);
  }

  @override
  @JsonKey()
  final int totalPrice;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CartState(ordersInCart: $ordersInCart, currentProducts: $currentProducts, totalPrice: $totalPrice, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            const DeepCollectionEquality()
                .equals(other._ordersInCart, _ordersInCart) &&
            const DeepCollectionEquality()
                .equals(other._currentProducts, _currentProducts) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ordersInCart),
      const DeepCollectionEquality().hash(_currentProducts),
      totalPrice,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
      {final List<OrderInCartModel> ordersInCart,
      final Set<ProductModel> currentProducts,
      final int totalPrice,
      final bool isLoading}) = _$CartStateImpl;
  const _CartState._() : super._();

  @override
  List<OrderInCartModel> get ordersInCart;
  @override // unique products to show the pics in orders list
  Set<ProductModel> get currentProducts;
  @override
  int get totalPrice;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
