// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? searchQuery)
        fetchAllAds,
    required TResult Function(String adId, bool isApproved) updateAdApproval,
    required TResult Function(int page, int limit, String? searchQuery)
        refreshAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? searchQuery)? fetchAllAds,
    TResult? Function(String adId, bool isApproved)? updateAdApproval,
    TResult? Function(int page, int limit, String? searchQuery)? refreshAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? searchQuery)? fetchAllAds,
    TResult Function(String adId, bool isApproved)? updateAdApproval,
    TResult Function(int page, int limit, String? searchQuery)? refreshAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllAds value) fetchAllAds,
    required TResult Function(_UpdateAdApproval value) updateAdApproval,
    required TResult Function(_RefreshAds value) refreshAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllAds value)? fetchAllAds,
    TResult? Function(_UpdateAdApproval value)? updateAdApproval,
    TResult? Function(_RefreshAds value)? refreshAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllAds value)? fetchAllAds,
    TResult Function(_UpdateAdApproval value)? updateAdApproval,
    TResult Function(_RefreshAds value)? refreshAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsEventCopyWith<$Res> {
  factory $AdsEventCopyWith(AdsEvent value, $Res Function(AdsEvent) then) =
      _$AdsEventCopyWithImpl<$Res, AdsEvent>;
}

/// @nodoc
class _$AdsEventCopyWithImpl<$Res, $Val extends AdsEvent>
    implements $AdsEventCopyWith<$Res> {
  _$AdsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchAllAdsImplCopyWith<$Res> {
  factory _$$FetchAllAdsImplCopyWith(
          _$FetchAllAdsImpl value, $Res Function(_$FetchAllAdsImpl) then) =
      __$$FetchAllAdsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit, String? searchQuery});
}

/// @nodoc
class __$$FetchAllAdsImplCopyWithImpl<$Res>
    extends _$AdsEventCopyWithImpl<$Res, _$FetchAllAdsImpl>
    implements _$$FetchAllAdsImplCopyWith<$Res> {
  __$$FetchAllAdsImplCopyWithImpl(
      _$FetchAllAdsImpl _value, $Res Function(_$FetchAllAdsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? searchQuery = freezed,
  }) {
    return _then(_$FetchAllAdsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchAllAdsImpl implements _FetchAllAds {
  const _$FetchAllAdsImpl({this.page = 1, this.limit = 10, this.searchQuery});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'AdsEvent.fetchAllAds(page: $page, limit: $limit, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllAdsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, searchQuery);

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllAdsImplCopyWith<_$FetchAllAdsImpl> get copyWith =>
      __$$FetchAllAdsImplCopyWithImpl<_$FetchAllAdsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? searchQuery)
        fetchAllAds,
    required TResult Function(String adId, bool isApproved) updateAdApproval,
    required TResult Function(int page, int limit, String? searchQuery)
        refreshAds,
  }) {
    return fetchAllAds(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? searchQuery)? fetchAllAds,
    TResult? Function(String adId, bool isApproved)? updateAdApproval,
    TResult? Function(int page, int limit, String? searchQuery)? refreshAds,
  }) {
    return fetchAllAds?.call(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? searchQuery)? fetchAllAds,
    TResult Function(String adId, bool isApproved)? updateAdApproval,
    TResult Function(int page, int limit, String? searchQuery)? refreshAds,
    required TResult orElse(),
  }) {
    if (fetchAllAds != null) {
      return fetchAllAds(page, limit, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllAds value) fetchAllAds,
    required TResult Function(_UpdateAdApproval value) updateAdApproval,
    required TResult Function(_RefreshAds value) refreshAds,
  }) {
    return fetchAllAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllAds value)? fetchAllAds,
    TResult? Function(_UpdateAdApproval value)? updateAdApproval,
    TResult? Function(_RefreshAds value)? refreshAds,
  }) {
    return fetchAllAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllAds value)? fetchAllAds,
    TResult Function(_UpdateAdApproval value)? updateAdApproval,
    TResult Function(_RefreshAds value)? refreshAds,
    required TResult orElse(),
  }) {
    if (fetchAllAds != null) {
      return fetchAllAds(this);
    }
    return orElse();
  }
}

abstract class _FetchAllAds implements AdsEvent {
  const factory _FetchAllAds(
      {final int page,
      final int limit,
      final String? searchQuery}) = _$FetchAllAdsImpl;

  int get page;
  int get limit;
  String? get searchQuery;

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllAdsImplCopyWith<_$FetchAllAdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAdApprovalImplCopyWith<$Res> {
  factory _$$UpdateAdApprovalImplCopyWith(_$UpdateAdApprovalImpl value,
          $Res Function(_$UpdateAdApprovalImpl) then) =
      __$$UpdateAdApprovalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String adId, bool isApproved});
}

/// @nodoc
class __$$UpdateAdApprovalImplCopyWithImpl<$Res>
    extends _$AdsEventCopyWithImpl<$Res, _$UpdateAdApprovalImpl>
    implements _$$UpdateAdApprovalImplCopyWith<$Res> {
  __$$UpdateAdApprovalImplCopyWithImpl(_$UpdateAdApprovalImpl _value,
      $Res Function(_$UpdateAdApprovalImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adId = null,
    Object? isApproved = null,
  }) {
    return _then(_$UpdateAdApprovalImpl(
      adId: null == adId
          ? _value.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateAdApprovalImpl implements _UpdateAdApproval {
  const _$UpdateAdApprovalImpl({required this.adId, required this.isApproved});

  @override
  final String adId;
  @override
  final bool isApproved;

  @override
  String toString() {
    return 'AdsEvent.updateAdApproval(adId: $adId, isApproved: $isApproved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAdApprovalImpl &&
            (identical(other.adId, adId) || other.adId == adId) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, adId, isApproved);

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAdApprovalImplCopyWith<_$UpdateAdApprovalImpl> get copyWith =>
      __$$UpdateAdApprovalImplCopyWithImpl<_$UpdateAdApprovalImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? searchQuery)
        fetchAllAds,
    required TResult Function(String adId, bool isApproved) updateAdApproval,
    required TResult Function(int page, int limit, String? searchQuery)
        refreshAds,
  }) {
    return updateAdApproval(adId, isApproved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? searchQuery)? fetchAllAds,
    TResult? Function(String adId, bool isApproved)? updateAdApproval,
    TResult? Function(int page, int limit, String? searchQuery)? refreshAds,
  }) {
    return updateAdApproval?.call(adId, isApproved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? searchQuery)? fetchAllAds,
    TResult Function(String adId, bool isApproved)? updateAdApproval,
    TResult Function(int page, int limit, String? searchQuery)? refreshAds,
    required TResult orElse(),
  }) {
    if (updateAdApproval != null) {
      return updateAdApproval(adId, isApproved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllAds value) fetchAllAds,
    required TResult Function(_UpdateAdApproval value) updateAdApproval,
    required TResult Function(_RefreshAds value) refreshAds,
  }) {
    return updateAdApproval(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllAds value)? fetchAllAds,
    TResult? Function(_UpdateAdApproval value)? updateAdApproval,
    TResult? Function(_RefreshAds value)? refreshAds,
  }) {
    return updateAdApproval?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllAds value)? fetchAllAds,
    TResult Function(_UpdateAdApproval value)? updateAdApproval,
    TResult Function(_RefreshAds value)? refreshAds,
    required TResult orElse(),
  }) {
    if (updateAdApproval != null) {
      return updateAdApproval(this);
    }
    return orElse();
  }
}

abstract class _UpdateAdApproval implements AdsEvent {
  const factory _UpdateAdApproval(
      {required final String adId,
      required final bool isApproved}) = _$UpdateAdApprovalImpl;

  String get adId;
  bool get isApproved;

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAdApprovalImplCopyWith<_$UpdateAdApprovalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshAdsImplCopyWith<$Res> {
  factory _$$RefreshAdsImplCopyWith(
          _$RefreshAdsImpl value, $Res Function(_$RefreshAdsImpl) then) =
      __$$RefreshAdsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit, String? searchQuery});
}

/// @nodoc
class __$$RefreshAdsImplCopyWithImpl<$Res>
    extends _$AdsEventCopyWithImpl<$Res, _$RefreshAdsImpl>
    implements _$$RefreshAdsImplCopyWith<$Res> {
  __$$RefreshAdsImplCopyWithImpl(
      _$RefreshAdsImpl _value, $Res Function(_$RefreshAdsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? searchQuery = freezed,
  }) {
    return _then(_$RefreshAdsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RefreshAdsImpl implements _RefreshAds {
  const _$RefreshAdsImpl({this.page = 1, this.limit = 10, this.searchQuery});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'AdsEvent.refreshAds(page: $page, limit: $limit, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshAdsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, searchQuery);

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshAdsImplCopyWith<_$RefreshAdsImpl> get copyWith =>
      __$$RefreshAdsImplCopyWithImpl<_$RefreshAdsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? searchQuery)
        fetchAllAds,
    required TResult Function(String adId, bool isApproved) updateAdApproval,
    required TResult Function(int page, int limit, String? searchQuery)
        refreshAds,
  }) {
    return refreshAds(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? searchQuery)? fetchAllAds,
    TResult? Function(String adId, bool isApproved)? updateAdApproval,
    TResult? Function(int page, int limit, String? searchQuery)? refreshAds,
  }) {
    return refreshAds?.call(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? searchQuery)? fetchAllAds,
    TResult Function(String adId, bool isApproved)? updateAdApproval,
    TResult Function(int page, int limit, String? searchQuery)? refreshAds,
    required TResult orElse(),
  }) {
    if (refreshAds != null) {
      return refreshAds(page, limit, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllAds value) fetchAllAds,
    required TResult Function(_UpdateAdApproval value) updateAdApproval,
    required TResult Function(_RefreshAds value) refreshAds,
  }) {
    return refreshAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllAds value)? fetchAllAds,
    TResult? Function(_UpdateAdApproval value)? updateAdApproval,
    TResult? Function(_RefreshAds value)? refreshAds,
  }) {
    return refreshAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllAds value)? fetchAllAds,
    TResult Function(_UpdateAdApproval value)? updateAdApproval,
    TResult Function(_RefreshAds value)? refreshAds,
    required TResult orElse(),
  }) {
    if (refreshAds != null) {
      return refreshAds(this);
    }
    return orElse();
  }
}

abstract class _RefreshAds implements AdsEvent {
  const factory _RefreshAds(
      {final int page,
      final int limit,
      final String? searchQuery}) = _$RefreshAdsImpl;

  int get page;
  int get limit;
  String? get searchQuery;

  /// Create a copy of AdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshAdsImplCopyWith<_$RefreshAdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
