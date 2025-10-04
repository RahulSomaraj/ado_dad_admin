// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'showroom_ads_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShowroomAdsEvent {
  String get userId => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userId, int? page, int? limit, String? searchQuery)
        fetchUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userId, int? page, int? limit, String? searchQuery)?
        fetchUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, int? page, int? limit, String? searchQuery)?
        fetchUserAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUserAds value) fetchUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUserAds value)? fetchUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUserAds value)? fetchUserAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ShowroomAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShowroomAdsEventCopyWith<ShowroomAdsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowroomAdsEventCopyWith<$Res> {
  factory $ShowroomAdsEventCopyWith(
          ShowroomAdsEvent value, $Res Function(ShowroomAdsEvent) then) =
      _$ShowroomAdsEventCopyWithImpl<$Res, ShowroomAdsEvent>;
  @useResult
  $Res call({String userId, int? page, int? limit, String? searchQuery});
}

/// @nodoc
class _$ShowroomAdsEventCopyWithImpl<$Res, $Val extends ShowroomAdsEvent>
    implements $ShowroomAdsEventCopyWith<$Res> {
  _$ShowroomAdsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShowroomAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? page = freezed,
    Object? limit = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchUserAdsImplCopyWith<$Res>
    implements $ShowroomAdsEventCopyWith<$Res> {
  factory _$$FetchUserAdsImplCopyWith(
          _$FetchUserAdsImpl value, $Res Function(_$FetchUserAdsImpl) then) =
      __$$FetchUserAdsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int? page, int? limit, String? searchQuery});
}

/// @nodoc
class __$$FetchUserAdsImplCopyWithImpl<$Res>
    extends _$ShowroomAdsEventCopyWithImpl<$Res, _$FetchUserAdsImpl>
    implements _$$FetchUserAdsImplCopyWith<$Res> {
  __$$FetchUserAdsImplCopyWithImpl(
      _$FetchUserAdsImpl _value, $Res Function(_$FetchUserAdsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? page = freezed,
    Object? limit = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_$FetchUserAdsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchUserAdsImpl implements FetchUserAds {
  const _$FetchUserAdsImpl(
      {required this.userId,
      this.page = 1,
      this.limit = 10,
      this.searchQuery = ''});

  @override
  final String userId;
  @override
  @JsonKey()
  final int? page;
  @override
  @JsonKey()
  final int? limit;
  @override
  @JsonKey()
  final String? searchQuery;

  @override
  String toString() {
    return 'ShowroomAdsEvent.fetchUserAds(userId: $userId, page: $page, limit: $limit, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUserAdsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, page, limit, searchQuery);

  /// Create a copy of ShowroomAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchUserAdsImplCopyWith<_$FetchUserAdsImpl> get copyWith =>
      __$$FetchUserAdsImplCopyWithImpl<_$FetchUserAdsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userId, int? page, int? limit, String? searchQuery)
        fetchUserAds,
  }) {
    return fetchUserAds(userId, page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userId, int? page, int? limit, String? searchQuery)?
        fetchUserAds,
  }) {
    return fetchUserAds?.call(userId, page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, int? page, int? limit, String? searchQuery)?
        fetchUserAds,
    required TResult orElse(),
  }) {
    if (fetchUserAds != null) {
      return fetchUserAds(userId, page, limit, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUserAds value) fetchUserAds,
  }) {
    return fetchUserAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUserAds value)? fetchUserAds,
  }) {
    return fetchUserAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUserAds value)? fetchUserAds,
    required TResult orElse(),
  }) {
    if (fetchUserAds != null) {
      return fetchUserAds(this);
    }
    return orElse();
  }
}

abstract class FetchUserAds implements ShowroomAdsEvent {
  const factory FetchUserAds(
      {required final String userId,
      final int? page,
      final int? limit,
      final String? searchQuery}) = _$FetchUserAdsImpl;

  @override
  String get userId;
  @override
  int? get page;
  @override
  int? get limit;
  @override
  String? get searchQuery;

  /// Create a copy of ShowroomAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchUserAdsImplCopyWith<_$FetchUserAdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShowroomAdsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowroomAdsInitial value) initial,
    required TResult Function(ShowroomAdsLoading value) loading,
    required TResult Function(ShowroomAdsLoaded value) loaded,
    required TResult Function(ShowroomAdsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomAdsInitial value)? initial,
    TResult? Function(ShowroomAdsLoading value)? loading,
    TResult? Function(ShowroomAdsLoaded value)? loaded,
    TResult? Function(ShowroomAdsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomAdsInitial value)? initial,
    TResult Function(ShowroomAdsLoading value)? loading,
    TResult Function(ShowroomAdsLoaded value)? loaded,
    TResult Function(ShowroomAdsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowroomAdsStateCopyWith<$Res> {
  factory $ShowroomAdsStateCopyWith(
          ShowroomAdsState value, $Res Function(ShowroomAdsState) then) =
      _$ShowroomAdsStateCopyWithImpl<$Res, ShowroomAdsState>;
}

/// @nodoc
class _$ShowroomAdsStateCopyWithImpl<$Res, $Val extends ShowroomAdsState>
    implements $ShowroomAdsStateCopyWith<$Res> {
  _$ShowroomAdsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShowroomAdsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ShowroomAdsInitialImplCopyWith<$Res> {
  factory _$$ShowroomAdsInitialImplCopyWith(_$ShowroomAdsInitialImpl value,
          $Res Function(_$ShowroomAdsInitialImpl) then) =
      __$$ShowroomAdsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowroomAdsInitialImplCopyWithImpl<$Res>
    extends _$ShowroomAdsStateCopyWithImpl<$Res, _$ShowroomAdsInitialImpl>
    implements _$$ShowroomAdsInitialImplCopyWith<$Res> {
  __$$ShowroomAdsInitialImplCopyWithImpl(_$ShowroomAdsInitialImpl _value,
      $Res Function(_$ShowroomAdsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomAdsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ShowroomAdsInitialImpl implements ShowroomAdsInitial {
  const _$ShowroomAdsInitialImpl();

  @override
  String toString() {
    return 'ShowroomAdsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowroomAdsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(ShowroomAdsInitial value) initial,
    required TResult Function(ShowroomAdsLoading value) loading,
    required TResult Function(ShowroomAdsLoaded value) loaded,
    required TResult Function(ShowroomAdsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomAdsInitial value)? initial,
    TResult? Function(ShowroomAdsLoading value)? loading,
    TResult? Function(ShowroomAdsLoaded value)? loaded,
    TResult? Function(ShowroomAdsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomAdsInitial value)? initial,
    TResult Function(ShowroomAdsLoading value)? loading,
    TResult Function(ShowroomAdsLoaded value)? loaded,
    TResult Function(ShowroomAdsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ShowroomAdsInitial implements ShowroomAdsState {
  const factory ShowroomAdsInitial() = _$ShowroomAdsInitialImpl;
}

/// @nodoc
abstract class _$$ShowroomAdsLoadingImplCopyWith<$Res> {
  factory _$$ShowroomAdsLoadingImplCopyWith(_$ShowroomAdsLoadingImpl value,
          $Res Function(_$ShowroomAdsLoadingImpl) then) =
      __$$ShowroomAdsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowroomAdsLoadingImplCopyWithImpl<$Res>
    extends _$ShowroomAdsStateCopyWithImpl<$Res, _$ShowroomAdsLoadingImpl>
    implements _$$ShowroomAdsLoadingImplCopyWith<$Res> {
  __$$ShowroomAdsLoadingImplCopyWithImpl(_$ShowroomAdsLoadingImpl _value,
      $Res Function(_$ShowroomAdsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomAdsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ShowroomAdsLoadingImpl implements ShowroomAdsLoading {
  const _$ShowroomAdsLoadingImpl();

  @override
  String toString() {
    return 'ShowroomAdsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowroomAdsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(ShowroomAdsInitial value) initial,
    required TResult Function(ShowroomAdsLoading value) loading,
    required TResult Function(ShowroomAdsLoaded value) loaded,
    required TResult Function(ShowroomAdsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomAdsInitial value)? initial,
    TResult? Function(ShowroomAdsLoading value)? loading,
    TResult? Function(ShowroomAdsLoaded value)? loaded,
    TResult? Function(ShowroomAdsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomAdsInitial value)? initial,
    TResult Function(ShowroomAdsLoading value)? loading,
    TResult Function(ShowroomAdsLoaded value)? loaded,
    TResult Function(ShowroomAdsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShowroomAdsLoading implements ShowroomAdsState {
  const factory ShowroomAdsLoading() = _$ShowroomAdsLoadingImpl;
}

/// @nodoc
abstract class _$$ShowroomAdsLoadedImplCopyWith<$Res> {
  factory _$$ShowroomAdsLoadedImplCopyWith(_$ShowroomAdsLoadedImpl value,
          $Res Function(_$ShowroomAdsLoadedImpl) then) =
      __$$ShowroomAdsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AdModel> ads, int currentPage, int totalPages, int totalAds});
}

/// @nodoc
class __$$ShowroomAdsLoadedImplCopyWithImpl<$Res>
    extends _$ShowroomAdsStateCopyWithImpl<$Res, _$ShowroomAdsLoadedImpl>
    implements _$$ShowroomAdsLoadedImplCopyWith<$Res> {
  __$$ShowroomAdsLoadedImplCopyWithImpl(_$ShowroomAdsLoadedImpl _value,
      $Res Function(_$ShowroomAdsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomAdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ads = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalAds = null,
  }) {
    return _then(_$ShowroomAdsLoadedImpl(
      ads: null == ads
          ? _value._ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalAds: null == totalAds
          ? _value.totalAds
          : totalAds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ShowroomAdsLoadedImpl implements ShowroomAdsLoaded {
  const _$ShowroomAdsLoadedImpl(
      {required final List<AdModel> ads,
      required this.currentPage,
      required this.totalPages,
      required this.totalAds})
      : _ads = ads;

  final List<AdModel> _ads;
  @override
  List<AdModel> get ads {
    if (_ads is EqualUnmodifiableListView) return _ads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ads);
  }

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int totalAds;

  @override
  String toString() {
    return 'ShowroomAdsState.loaded(ads: $ads, currentPage: $currentPage, totalPages: $totalPages, totalAds: $totalAds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowroomAdsLoadedImpl &&
            const DeepCollectionEquality().equals(other._ads, _ads) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalAds, totalAds) ||
                other.totalAds == totalAds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ads),
      currentPage,
      totalPages,
      totalAds);

  /// Create a copy of ShowroomAdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowroomAdsLoadedImplCopyWith<_$ShowroomAdsLoadedImpl> get copyWith =>
      __$$ShowroomAdsLoadedImplCopyWithImpl<_$ShowroomAdsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(ads, currentPage, totalPages, totalAds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(ads, currentPage, totalPages, totalAds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(ads, currentPage, totalPages, totalAds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowroomAdsInitial value) initial,
    required TResult Function(ShowroomAdsLoading value) loading,
    required TResult Function(ShowroomAdsLoaded value) loaded,
    required TResult Function(ShowroomAdsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomAdsInitial value)? initial,
    TResult? Function(ShowroomAdsLoading value)? loading,
    TResult? Function(ShowroomAdsLoaded value)? loaded,
    TResult? Function(ShowroomAdsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomAdsInitial value)? initial,
    TResult Function(ShowroomAdsLoading value)? loading,
    TResult Function(ShowroomAdsLoaded value)? loaded,
    TResult Function(ShowroomAdsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ShowroomAdsLoaded implements ShowroomAdsState {
  const factory ShowroomAdsLoaded(
      {required final List<AdModel> ads,
      required final int currentPage,
      required final int totalPages,
      required final int totalAds}) = _$ShowroomAdsLoadedImpl;

  List<AdModel> get ads;
  int get currentPage;
  int get totalPages;
  int get totalAds;

  /// Create a copy of ShowroomAdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowroomAdsLoadedImplCopyWith<_$ShowroomAdsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowroomAdsErrorImplCopyWith<$Res> {
  factory _$$ShowroomAdsErrorImplCopyWith(_$ShowroomAdsErrorImpl value,
          $Res Function(_$ShowroomAdsErrorImpl) then) =
      __$$ShowroomAdsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ShowroomAdsErrorImplCopyWithImpl<$Res>
    extends _$ShowroomAdsStateCopyWithImpl<$Res, _$ShowroomAdsErrorImpl>
    implements _$$ShowroomAdsErrorImplCopyWith<$Res> {
  __$$ShowroomAdsErrorImplCopyWithImpl(_$ShowroomAdsErrorImpl _value,
      $Res Function(_$ShowroomAdsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomAdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ShowroomAdsErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowroomAdsErrorImpl implements ShowroomAdsError {
  const _$ShowroomAdsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ShowroomAdsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowroomAdsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ShowroomAdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowroomAdsErrorImplCopyWith<_$ShowroomAdsErrorImpl> get copyWith =>
      __$$ShowroomAdsErrorImplCopyWithImpl<_$ShowroomAdsErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<AdModel> ads, int currentPage, int totalPages, int totalAds)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(ShowroomAdsInitial value) initial,
    required TResult Function(ShowroomAdsLoading value) loading,
    required TResult Function(ShowroomAdsLoaded value) loaded,
    required TResult Function(ShowroomAdsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomAdsInitial value)? initial,
    TResult? Function(ShowroomAdsLoading value)? loading,
    TResult? Function(ShowroomAdsLoaded value)? loaded,
    TResult? Function(ShowroomAdsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomAdsInitial value)? initial,
    TResult Function(ShowroomAdsLoading value)? loading,
    TResult Function(ShowroomAdsLoaded value)? loaded,
    TResult Function(ShowroomAdsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShowroomAdsError implements ShowroomAdsState {
  const factory ShowroomAdsError(final String message) = _$ShowroomAdsErrorImpl;

  String get message;

  /// Create a copy of ShowroomAdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowroomAdsErrorImplCopyWith<_$ShowroomAdsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
