// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String adId) approvalLoading,
    required TResult Function(String message, AdModel updatedAd)
        approvalSuccess,
    required TResult Function(String message, String adId) approvalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String adId)? approvalLoading,
    TResult? Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult? Function(String message, String adId)? approvalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String adId)? approvalLoading,
    TResult Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult Function(String message, String adId)? approvalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ApprovalLoading value) approvalLoading,
    required TResult Function(_ApprovalSuccess value) approvalSuccess,
    required TResult Function(_ApprovalError value) approvalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ApprovalLoading value)? approvalLoading,
    TResult? Function(_ApprovalSuccess value)? approvalSuccess,
    TResult? Function(_ApprovalError value)? approvalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ApprovalLoading value)? approvalLoading,
    TResult Function(_ApprovalSuccess value)? approvalSuccess,
    TResult Function(_ApprovalError value)? approvalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsStateCopyWith<$Res> {
  factory $AdsStateCopyWith(AdsState value, $Res Function(AdsState) then) =
      _$AdsStateCopyWithImpl<$Res, AdsState>;
}

/// @nodoc
class _$AdsStateCopyWithImpl<$Res, $Val extends AdsState>
    implements $AdsStateCopyWith<$Res> {
  _$AdsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AdsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String adId) approvalLoading,
    required TResult Function(String message, AdModel updatedAd)
        approvalSuccess,
    required TResult Function(String message, String adId) approvalError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String adId)? approvalLoading,
    TResult? Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult? Function(String message, String adId)? approvalError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String adId)? approvalLoading,
    TResult Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult Function(String message, String adId)? approvalError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ApprovalLoading value) approvalLoading,
    required TResult Function(_ApprovalSuccess value) approvalSuccess,
    required TResult Function(_ApprovalError value) approvalError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ApprovalLoading value)? approvalLoading,
    TResult? Function(_ApprovalSuccess value)? approvalSuccess,
    TResult? Function(_ApprovalError value)? approvalError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ApprovalLoading value)? approvalLoading,
    TResult Function(_ApprovalSuccess value)? approvalSuccess,
    TResult Function(_ApprovalError value)? approvalError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AdsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AdsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String adId) approvalLoading,
    required TResult Function(String message, AdModel updatedAd)
        approvalSuccess,
    required TResult Function(String message, String adId) approvalError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String adId)? approvalLoading,
    TResult? Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult? Function(String message, String adId)? approvalError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String adId)? approvalLoading,
    TResult Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult Function(String message, String adId)? approvalError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ApprovalLoading value) approvalLoading,
    required TResult Function(_ApprovalSuccess value) approvalSuccess,
    required TResult Function(_ApprovalError value) approvalError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ApprovalLoading value)? approvalLoading,
    TResult? Function(_ApprovalSuccess value)? approvalSuccess,
    TResult? Function(_ApprovalError value)? approvalError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ApprovalLoading value)? approvalLoading,
    TResult Function(_ApprovalSuccess value)? approvalSuccess,
    TResult Function(_ApprovalError value)? approvalError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AdsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AdModel> ads, int total, int currentPage, int itemsPerPage});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ads = null,
    Object? total = null,
    Object? currentPage = null,
    Object? itemsPerPage = null,
  }) {
    return _then(_$LoadedImpl(
      ads: null == ads
          ? _value._ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<AdModel> ads,
      required this.total,
      this.currentPage = 1,
      this.itemsPerPage = 10})
      : _ads = ads;

  final List<AdModel> _ads;
  @override
  List<AdModel> get ads {
    if (_ads is EqualUnmodifiableListView) return _ads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ads);
  }

  @override
  final int total;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int itemsPerPage;

  @override
  String toString() {
    return 'AdsState.loaded(ads: $ads, total: $total, currentPage: $currentPage, itemsPerPage: $itemsPerPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._ads, _ads) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ads),
      total,
      currentPage,
      itemsPerPage);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String adId) approvalLoading,
    required TResult Function(String message, AdModel updatedAd)
        approvalSuccess,
    required TResult Function(String message, String adId) approvalError,
  }) {
    return loaded(ads, total, currentPage, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String adId)? approvalLoading,
    TResult? Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult? Function(String message, String adId)? approvalError,
  }) {
    return loaded?.call(ads, total, currentPage, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String adId)? approvalLoading,
    TResult Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult Function(String message, String adId)? approvalError,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(ads, total, currentPage, itemsPerPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ApprovalLoading value) approvalLoading,
    required TResult Function(_ApprovalSuccess value) approvalSuccess,
    required TResult Function(_ApprovalError value) approvalError,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ApprovalLoading value)? approvalLoading,
    TResult? Function(_ApprovalSuccess value)? approvalSuccess,
    TResult? Function(_ApprovalError value)? approvalError,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ApprovalLoading value)? approvalLoading,
    TResult Function(_ApprovalSuccess value)? approvalSuccess,
    TResult Function(_ApprovalError value)? approvalError,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AdsState {
  const factory _Loaded(
      {required final List<AdModel> ads,
      required final int total,
      final int currentPage,
      final int itemsPerPage}) = _$LoadedImpl;

  List<AdModel> get ads;
  int get total;
  int get currentPage;
  int get itemsPerPage;

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AdsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String adId) approvalLoading,
    required TResult Function(String message, AdModel updatedAd)
        approvalSuccess,
    required TResult Function(String message, String adId) approvalError,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String adId)? approvalLoading,
    TResult? Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult? Function(String message, String adId)? approvalError,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String adId)? approvalLoading,
    TResult Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult Function(String message, String adId)? approvalError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ApprovalLoading value) approvalLoading,
    required TResult Function(_ApprovalSuccess value) approvalSuccess,
    required TResult Function(_ApprovalError value) approvalError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ApprovalLoading value)? approvalLoading,
    TResult? Function(_ApprovalSuccess value)? approvalSuccess,
    TResult? Function(_ApprovalError value)? approvalError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ApprovalLoading value)? approvalLoading,
    TResult Function(_ApprovalSuccess value)? approvalSuccess,
    TResult Function(_ApprovalError value)? approvalError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AdsState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApprovalLoadingImplCopyWith<$Res> {
  factory _$$ApprovalLoadingImplCopyWith(_$ApprovalLoadingImpl value,
          $Res Function(_$ApprovalLoadingImpl) then) =
      __$$ApprovalLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String adId});
}

/// @nodoc
class __$$ApprovalLoadingImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$ApprovalLoadingImpl>
    implements _$$ApprovalLoadingImplCopyWith<$Res> {
  __$$ApprovalLoadingImplCopyWithImpl(
      _$ApprovalLoadingImpl _value, $Res Function(_$ApprovalLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adId = null,
  }) {
    return _then(_$ApprovalLoadingImpl(
      adId: null == adId
          ? _value.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApprovalLoadingImpl implements _ApprovalLoading {
  const _$ApprovalLoadingImpl({required this.adId});

  @override
  final String adId;

  @override
  String toString() {
    return 'AdsState.approvalLoading(adId: $adId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovalLoadingImpl &&
            (identical(other.adId, adId) || other.adId == adId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, adId);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovalLoadingImplCopyWith<_$ApprovalLoadingImpl> get copyWith =>
      __$$ApprovalLoadingImplCopyWithImpl<_$ApprovalLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String adId) approvalLoading,
    required TResult Function(String message, AdModel updatedAd)
        approvalSuccess,
    required TResult Function(String message, String adId) approvalError,
  }) {
    return approvalLoading(adId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String adId)? approvalLoading,
    TResult? Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult? Function(String message, String adId)? approvalError,
  }) {
    return approvalLoading?.call(adId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String adId)? approvalLoading,
    TResult Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult Function(String message, String adId)? approvalError,
    required TResult orElse(),
  }) {
    if (approvalLoading != null) {
      return approvalLoading(adId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ApprovalLoading value) approvalLoading,
    required TResult Function(_ApprovalSuccess value) approvalSuccess,
    required TResult Function(_ApprovalError value) approvalError,
  }) {
    return approvalLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ApprovalLoading value)? approvalLoading,
    TResult? Function(_ApprovalSuccess value)? approvalSuccess,
    TResult? Function(_ApprovalError value)? approvalError,
  }) {
    return approvalLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ApprovalLoading value)? approvalLoading,
    TResult Function(_ApprovalSuccess value)? approvalSuccess,
    TResult Function(_ApprovalError value)? approvalError,
    required TResult orElse(),
  }) {
    if (approvalLoading != null) {
      return approvalLoading(this);
    }
    return orElse();
  }
}

abstract class _ApprovalLoading implements AdsState {
  const factory _ApprovalLoading({required final String adId}) =
      _$ApprovalLoadingImpl;

  String get adId;

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApprovalLoadingImplCopyWith<_$ApprovalLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApprovalSuccessImplCopyWith<$Res> {
  factory _$$ApprovalSuccessImplCopyWith(_$ApprovalSuccessImpl value,
          $Res Function(_$ApprovalSuccessImpl) then) =
      __$$ApprovalSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, AdModel updatedAd});
}

/// @nodoc
class __$$ApprovalSuccessImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$ApprovalSuccessImpl>
    implements _$$ApprovalSuccessImplCopyWith<$Res> {
  __$$ApprovalSuccessImplCopyWithImpl(
      _$ApprovalSuccessImpl _value, $Res Function(_$ApprovalSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? updatedAd = null,
  }) {
    return _then(_$ApprovalSuccessImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAd: null == updatedAd
          ? _value.updatedAd
          : updatedAd // ignore: cast_nullable_to_non_nullable
              as AdModel,
    ));
  }
}

/// @nodoc

class _$ApprovalSuccessImpl implements _ApprovalSuccess {
  const _$ApprovalSuccessImpl({required this.message, required this.updatedAd});

  @override
  final String message;
  @override
  final AdModel updatedAd;

  @override
  String toString() {
    return 'AdsState.approvalSuccess(message: $message, updatedAd: $updatedAd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovalSuccessImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.updatedAd, updatedAd) ||
                other.updatedAd == updatedAd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, updatedAd);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovalSuccessImplCopyWith<_$ApprovalSuccessImpl> get copyWith =>
      __$$ApprovalSuccessImplCopyWithImpl<_$ApprovalSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String adId) approvalLoading,
    required TResult Function(String message, AdModel updatedAd)
        approvalSuccess,
    required TResult Function(String message, String adId) approvalError,
  }) {
    return approvalSuccess(message, updatedAd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String adId)? approvalLoading,
    TResult? Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult? Function(String message, String adId)? approvalError,
  }) {
    return approvalSuccess?.call(message, updatedAd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String adId)? approvalLoading,
    TResult Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult Function(String message, String adId)? approvalError,
    required TResult orElse(),
  }) {
    if (approvalSuccess != null) {
      return approvalSuccess(message, updatedAd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ApprovalLoading value) approvalLoading,
    required TResult Function(_ApprovalSuccess value) approvalSuccess,
    required TResult Function(_ApprovalError value) approvalError,
  }) {
    return approvalSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ApprovalLoading value)? approvalLoading,
    TResult? Function(_ApprovalSuccess value)? approvalSuccess,
    TResult? Function(_ApprovalError value)? approvalError,
  }) {
    return approvalSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ApprovalLoading value)? approvalLoading,
    TResult Function(_ApprovalSuccess value)? approvalSuccess,
    TResult Function(_ApprovalError value)? approvalError,
    required TResult orElse(),
  }) {
    if (approvalSuccess != null) {
      return approvalSuccess(this);
    }
    return orElse();
  }
}

abstract class _ApprovalSuccess implements AdsState {
  const factory _ApprovalSuccess(
      {required final String message,
      required final AdModel updatedAd}) = _$ApprovalSuccessImpl;

  String get message;
  AdModel get updatedAd;

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApprovalSuccessImplCopyWith<_$ApprovalSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApprovalErrorImplCopyWith<$Res> {
  factory _$$ApprovalErrorImplCopyWith(
          _$ApprovalErrorImpl value, $Res Function(_$ApprovalErrorImpl) then) =
      __$$ApprovalErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String adId});
}

/// @nodoc
class __$$ApprovalErrorImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$ApprovalErrorImpl>
    implements _$$ApprovalErrorImplCopyWith<$Res> {
  __$$ApprovalErrorImplCopyWithImpl(
      _$ApprovalErrorImpl _value, $Res Function(_$ApprovalErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? adId = null,
  }) {
    return _then(_$ApprovalErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      adId: null == adId
          ? _value.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApprovalErrorImpl implements _ApprovalError {
  const _$ApprovalErrorImpl({required this.message, required this.adId});

  @override
  final String message;
  @override
  final String adId;

  @override
  String toString() {
    return 'AdsState.approvalError(message: $message, adId: $adId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovalErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.adId, adId) || other.adId == adId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, adId);

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovalErrorImplCopyWith<_$ApprovalErrorImpl> get copyWith =>
      __$$ApprovalErrorImplCopyWithImpl<_$ApprovalErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String adId) approvalLoading,
    required TResult Function(String message, AdModel updatedAd)
        approvalSuccess,
    required TResult Function(String message, String adId) approvalError,
  }) {
    return approvalError(message, adId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String adId)? approvalLoading,
    TResult? Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult? Function(String message, String adId)? approvalError,
  }) {
    return approvalError?.call(message, adId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int total, int currentPage, int itemsPerPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String adId)? approvalLoading,
    TResult Function(String message, AdModel updatedAd)? approvalSuccess,
    TResult Function(String message, String adId)? approvalError,
    required TResult orElse(),
  }) {
    if (approvalError != null) {
      return approvalError(message, adId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ApprovalLoading value) approvalLoading,
    required TResult Function(_ApprovalSuccess value) approvalSuccess,
    required TResult Function(_ApprovalError value) approvalError,
  }) {
    return approvalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ApprovalLoading value)? approvalLoading,
    TResult? Function(_ApprovalSuccess value)? approvalSuccess,
    TResult? Function(_ApprovalError value)? approvalError,
  }) {
    return approvalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ApprovalLoading value)? approvalLoading,
    TResult Function(_ApprovalSuccess value)? approvalSuccess,
    TResult Function(_ApprovalError value)? approvalError,
    required TResult orElse(),
  }) {
    if (approvalError != null) {
      return approvalError(this);
    }
    return orElse();
  }
}

abstract class _ApprovalError implements AdsState {
  const factory _ApprovalError(
      {required final String message,
      required final String adId}) = _$ApprovalErrorImpl;

  String get message;
  String get adId;

  /// Create a copy of AdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApprovalErrorImplCopyWith<_$ApprovalErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
