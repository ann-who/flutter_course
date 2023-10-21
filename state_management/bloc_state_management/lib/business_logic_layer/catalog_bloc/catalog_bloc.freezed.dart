// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CatalogState {
  List<String> get categories => throw _privateConstructorUsedError;
  List<ProductModel> get categoryProducts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatalogStateCopyWith<CatalogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogStateCopyWith<$Res> {
  factory $CatalogStateCopyWith(
          CatalogState value, $Res Function(CatalogState) then) =
      _$CatalogStateCopyWithImpl<$Res, CatalogState>;
  @useResult
  $Res call(
      {List<String> categories,
      List<ProductModel> categoryProducts,
      bool isLoading});
}

/// @nodoc
class _$CatalogStateCopyWithImpl<$Res, $Val extends CatalogState>
    implements $CatalogStateCopyWith<$Res> {
  _$CatalogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? categoryProducts = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryProducts: null == categoryProducts
          ? _value.categoryProducts
          : categoryProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatalogStateImplCopyWith<$Res>
    implements $CatalogStateCopyWith<$Res> {
  factory _$$CatalogStateImplCopyWith(
          _$CatalogStateImpl value, $Res Function(_$CatalogStateImpl) then) =
      __$$CatalogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> categories,
      List<ProductModel> categoryProducts,
      bool isLoading});
}

/// @nodoc
class __$$CatalogStateImplCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$CatalogStateImpl>
    implements _$$CatalogStateImplCopyWith<$Res> {
  __$$CatalogStateImplCopyWithImpl(
      _$CatalogStateImpl _value, $Res Function(_$CatalogStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? categoryProducts = null,
    Object? isLoading = null,
  }) {
    return _then(_$CatalogStateImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryProducts: null == categoryProducts
          ? _value._categoryProducts
          : categoryProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CatalogStateImpl extends _CatalogState {
  const _$CatalogStateImpl(
      {final List<String> categories = const [],
      final List<ProductModel> categoryProducts = const [],
      this.isLoading = false})
      : _categories = categories,
        _categoryProducts = categoryProducts,
        super._();

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<ProductModel> _categoryProducts;
  @override
  @JsonKey()
  List<ProductModel> get categoryProducts {
    if (_categoryProducts is EqualUnmodifiableListView)
      return _categoryProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryProducts);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CatalogState(categories: $categories, categoryProducts: $categoryProducts, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._categoryProducts, _categoryProducts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_categoryProducts),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogStateImplCopyWith<_$CatalogStateImpl> get copyWith =>
      __$$CatalogStateImplCopyWithImpl<_$CatalogStateImpl>(this, _$identity);
}

abstract class _CatalogState extends CatalogState {
  const factory _CatalogState(
      {final List<String> categories,
      final List<ProductModel> categoryProducts,
      final bool isLoading}) = _$CatalogStateImpl;
  const _CatalogState._() : super._();

  @override
  List<String> get categories;
  @override
  List<ProductModel> get categoryProducts;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CatalogStateImplCopyWith<_$CatalogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
