// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreatedOrderModel _$CreatedOrderModelFromJson(Map<String, dynamic> json) {
  return _CreatedOrderModel.fromJson(json);
}

/// @nodoc
mixin _$CreatedOrderModel {
  List<ProductModel> get products => throw _privateConstructorUsedError;
  String get creationDate => throw _privateConstructorUsedError;
  String get deliveryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedOrderModelCopyWith<CreatedOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedOrderModelCopyWith<$Res> {
  factory $CreatedOrderModelCopyWith(
          CreatedOrderModel value, $Res Function(CreatedOrderModel) then) =
      _$CreatedOrderModelCopyWithImpl<$Res, CreatedOrderModel>;
  @useResult
  $Res call(
      {List<ProductModel> products, String creationDate, String deliveryDate});
}

/// @nodoc
class _$CreatedOrderModelCopyWithImpl<$Res, $Val extends CreatedOrderModel>
    implements $CreatedOrderModelCopyWith<$Res> {
  _$CreatedOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? creationDate = null,
    Object? deliveryDate = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatedOrderModelImplCopyWith<$Res>
    implements $CreatedOrderModelCopyWith<$Res> {
  factory _$$CreatedOrderModelImplCopyWith(_$CreatedOrderModelImpl value,
          $Res Function(_$CreatedOrderModelImpl) then) =
      __$$CreatedOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductModel> products, String creationDate, String deliveryDate});
}

/// @nodoc
class __$$CreatedOrderModelImplCopyWithImpl<$Res>
    extends _$CreatedOrderModelCopyWithImpl<$Res, _$CreatedOrderModelImpl>
    implements _$$CreatedOrderModelImplCopyWith<$Res> {
  __$$CreatedOrderModelImplCopyWithImpl(_$CreatedOrderModelImpl _value,
      $Res Function(_$CreatedOrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? creationDate = null,
    Object? deliveryDate = null,
  }) {
    return _then(_$CreatedOrderModelImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatedOrderModelImpl implements _CreatedOrderModel {
  const _$CreatedOrderModelImpl(
      {required final List<ProductModel> products,
      required this.creationDate,
      required this.deliveryDate})
      : _products = products;

  factory _$CreatedOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedOrderModelImplFromJson(json);

  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final String creationDate;
  @override
  final String deliveryDate;

  @override
  String toString() {
    return 'CreatedOrderModel(products: $products, creationDate: $creationDate, deliveryDate: $deliveryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedOrderModelImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      creationDate,
      deliveryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedOrderModelImplCopyWith<_$CreatedOrderModelImpl> get copyWith =>
      __$$CreatedOrderModelImplCopyWithImpl<_$CreatedOrderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedOrderModelImplToJson(
      this,
    );
  }
}

abstract class _CreatedOrderModel implements CreatedOrderModel {
  const factory _CreatedOrderModel(
      {required final List<ProductModel> products,
      required final String creationDate,
      required final String deliveryDate}) = _$CreatedOrderModelImpl;

  factory _CreatedOrderModel.fromJson(Map<String, dynamic> json) =
      _$CreatedOrderModelImpl.fromJson;

  @override
  List<ProductModel> get products;
  @override
  String get creationDate;
  @override
  String get deliveryDate;
  @override
  @JsonKey(ignore: true)
  _$$CreatedOrderModelImplCopyWith<_$CreatedOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
