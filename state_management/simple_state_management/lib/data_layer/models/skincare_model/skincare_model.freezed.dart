// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skincare_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SkincareModel _$SkincareModelFromJson(Map<String, dynamic> json) {
  return _SkincareModel.fromJson(json);
}

/// @nodoc
mixin _$SkincareModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkincareModelCopyWith<SkincareModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkincareModelCopyWith<$Res> {
  factory $SkincareModelCopyWith(
          SkincareModel value, $Res Function(SkincareModel) then) =
      _$SkincareModelCopyWithImpl<$Res, SkincareModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      int price,
      String brand,
      String category,
      List<String> images});
}

/// @nodoc
class _$SkincareModelCopyWithImpl<$Res, $Val extends SkincareModel>
    implements $SkincareModelCopyWith<$Res> {
  _$SkincareModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? brand = null,
    Object? category = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SkincareModelCopyWith<$Res>
    implements $SkincareModelCopyWith<$Res> {
  factory _$$_SkincareModelCopyWith(
          _$_SkincareModel value, $Res Function(_$_SkincareModel) then) =
      __$$_SkincareModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      int price,
      String brand,
      String category,
      List<String> images});
}

/// @nodoc
class __$$_SkincareModelCopyWithImpl<$Res>
    extends _$SkincareModelCopyWithImpl<$Res, _$_SkincareModel>
    implements _$$_SkincareModelCopyWith<$Res> {
  __$$_SkincareModelCopyWithImpl(
      _$_SkincareModel _value, $Res Function(_$_SkincareModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? brand = null,
    Object? category = null,
    Object? images = null,
  }) {
    return _then(_$_SkincareModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SkincareModel implements _SkincareModel {
  const _$_SkincareModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.brand,
      required this.category,
      required final List<String> images})
      : _images = images;

  factory _$_SkincareModel.fromJson(Map<String, dynamic> json) =>
      _$$_SkincareModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int price;
  @override
  final String brand;
  @override
  final String category;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'SkincareModel(id: $id, title: $title, description: $description, price: $price, brand: $brand, category: $category, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SkincareModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, price,
      brand, category, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SkincareModelCopyWith<_$_SkincareModel> get copyWith =>
      __$$_SkincareModelCopyWithImpl<_$_SkincareModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SkincareModelToJson(
      this,
    );
  }
}

abstract class _SkincareModel implements SkincareModel {
  const factory _SkincareModel(
      {required final int id,
      required final String title,
      required final String description,
      required final int price,
      required final String brand,
      required final String category,
      required final List<String> images}) = _$_SkincareModel;

  factory _SkincareModel.fromJson(Map<String, dynamic> json) =
      _$_SkincareModel.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  int get price;
  @override
  String get brand;
  @override
  String get category;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$_SkincareModelCopyWith<_$_SkincareModel> get copyWith =>
      throw _privateConstructorUsedError;
}
