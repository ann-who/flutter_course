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

AnimalModel _$AnimalModelFromJson(Map<String, dynamic> json) {
  return _AnimalModel.fromJson(json);
}

/// @nodoc
mixin _$AnimalModel {
  @JsonKey(name: 'Species Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Scientific Name')
  String get scientificName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Species Illustration Photo')
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimalModelCopyWith<AnimalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalModelCopyWith<$Res> {
  factory $AnimalModelCopyWith(
          AnimalModel value, $Res Function(AnimalModel) then) =
      _$AnimalModelCopyWithImpl<$Res, AnimalModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Species Name') String name,
      @JsonKey(name: 'Scientific Name') String scientificName,
      @JsonKey(name: 'Species Illustration Photo') String photo});
}

/// @nodoc
class _$AnimalModelCopyWithImpl<$Res, $Val extends AnimalModel>
    implements $AnimalModelCopyWith<$Res> {
  _$AnimalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? scientificName = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnimalModelCopyWith<$Res>
    implements $AnimalModelCopyWith<$Res> {
  factory _$$_AnimalModelCopyWith(
          _$_AnimalModel value, $Res Function(_$_AnimalModel) then) =
      __$$_AnimalModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Species Name') String name,
      @JsonKey(name: 'Scientific Name') String scientificName,
      @JsonKey(name: 'Species Illustration Photo') String photo});
}

/// @nodoc
class __$$_AnimalModelCopyWithImpl<$Res>
    extends _$AnimalModelCopyWithImpl<$Res, _$_AnimalModel>
    implements _$$_AnimalModelCopyWith<$Res> {
  __$$_AnimalModelCopyWithImpl(
      _$_AnimalModel _value, $Res Function(_$_AnimalModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? scientificName = null,
    Object? photo = null,
  }) {
    return _then(_$_AnimalModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnimalModel implements _AnimalModel {
  const _$_AnimalModel(
      {@JsonKey(name: 'Species Name') required this.name,
      @JsonKey(name: 'Scientific Name') required this.scientificName,
      @JsonKey(name: 'Species Illustration Photo') required this.photo});

  factory _$_AnimalModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnimalModelFromJson(json);

  @override
  @JsonKey(name: 'Species Name')
  final String name;
  @override
  @JsonKey(name: 'Scientific Name')
  final String scientificName;
  @override
  @JsonKey(name: 'Species Illustration Photo')
  final String photo;

  @override
  String toString() {
    return 'AnimalModel(name: $name, scientificName: $scientificName, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimalModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.scientificName, scientificName) ||
                other.scientificName == scientificName) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, scientificName, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimalModelCopyWith<_$_AnimalModel> get copyWith =>
      __$$_AnimalModelCopyWithImpl<_$_AnimalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnimalModelToJson(
      this,
    );
  }
}

abstract class _AnimalModel implements AnimalModel {
  const factory _AnimalModel(
      {@JsonKey(name: 'Species Name')
          required final String name,
      @JsonKey(name: 'Scientific Name')
          required final String scientificName,
      @JsonKey(name: 'Species Illustration Photo')
          required final String photo}) = _$_AnimalModel;

  factory _AnimalModel.fromJson(Map<String, dynamic> json) =
      _$_AnimalModel.fromJson;

  @override
  @JsonKey(name: 'Species Name')
  String get name;
  @override
  @JsonKey(name: 'Scientific Name')
  String get scientificName;
  @override
  @JsonKey(name: 'Species Illustration Photo')
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$_AnimalModelCopyWith<_$_AnimalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
