// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'animal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZooAnimal _$ZooAnimalFromJson(Map<String, dynamic> json) {
  return _ZooAnimal.fromJson(json);
}

/// @nodoc
mixin _$ZooAnimal {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'animal_type')
  String get animalType => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_link')
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZooAnimalCopyWith<ZooAnimal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZooAnimalCopyWith<$Res> {
  factory $ZooAnimalCopyWith(ZooAnimal value, $Res Function(ZooAnimal) then) =
      _$ZooAnimalCopyWithImpl<$Res, ZooAnimal>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'animal_type') String animalType,
      @JsonKey(name: 'image_link') String imageUrl});
}

/// @nodoc
class _$ZooAnimalCopyWithImpl<$Res, $Val extends ZooAnimal>
    implements $ZooAnimalCopyWith<$Res> {
  _$ZooAnimalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? animalType = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      animalType: null == animalType
          ? _value.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ZooAnimalCopyWith<$Res> implements $ZooAnimalCopyWith<$Res> {
  factory _$$_ZooAnimalCopyWith(
          _$_ZooAnimal value, $Res Function(_$_ZooAnimal) then) =
      __$$_ZooAnimalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'animal_type') String animalType,
      @JsonKey(name: 'image_link') String imageUrl});
}

/// @nodoc
class __$$_ZooAnimalCopyWithImpl<$Res>
    extends _$ZooAnimalCopyWithImpl<$Res, _$_ZooAnimal>
    implements _$$_ZooAnimalCopyWith<$Res> {
  __$$_ZooAnimalCopyWithImpl(
      _$_ZooAnimal _value, $Res Function(_$_ZooAnimal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? animalType = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_ZooAnimal(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      animalType: null == animalType
          ? _value.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ZooAnimal implements _ZooAnimal {
  const _$_ZooAnimal(
      {required this.name,
      @JsonKey(name: 'animal_type') required this.animalType,
      @JsonKey(name: 'image_link') required this.imageUrl});

  factory _$_ZooAnimal.fromJson(Map<String, dynamic> json) =>
      _$$_ZooAnimalFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'animal_type')
  final String animalType;
  @override
  @JsonKey(name: 'image_link')
  final String imageUrl;

  @override
  String toString() {
    return 'ZooAnimal(name: $name, animalType: $animalType, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ZooAnimal &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.animalType, animalType) ||
                other.animalType == animalType) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, animalType, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ZooAnimalCopyWith<_$_ZooAnimal> get copyWith =>
      __$$_ZooAnimalCopyWithImpl<_$_ZooAnimal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ZooAnimalToJson(
      this,
    );
  }
}

abstract class _ZooAnimal implements ZooAnimal {
  const factory _ZooAnimal(
          {required final String name,
          @JsonKey(name: 'animal_type') required final String animalType,
          @JsonKey(name: 'image_link') required final String imageUrl}) =
      _$_ZooAnimal;

  factory _ZooAnimal.fromJson(Map<String, dynamic> json) =
      _$_ZooAnimal.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'animal_type')
  String get animalType;
  @override
  @JsonKey(name: 'image_link')
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ZooAnimalCopyWith<_$_ZooAnimal> get copyWith =>
      throw _privateConstructorUsedError;
}
