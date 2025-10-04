// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_ads_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAdsEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) fetchUserAds,
    required TResult Function(String userId) refreshUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? fetchUserAds,
    TResult? Function(String userId)? refreshUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? fetchUserAds,
    TResult Function(String userId)? refreshUserAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchUserAds value) fetchUserAds,
    required TResult Function(_RefreshUserAds value) refreshUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchUserAds value)? fetchUserAds,
    TResult? Function(_RefreshUserAds value)? refreshUserAds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchUserAds value)? fetchUserAds,
    TResult Function(_RefreshUserAds value)? refreshUserAds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAdsEventCopyWith<UserAdsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAdsEventCopyWith<$Res> {
  factory $UserAdsEventCopyWith(
          UserAdsEvent value, $Res Function(UserAdsEvent) then) =
      _$UserAdsEventCopyWithImpl<$Res, UserAdsEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$UserAdsEventCopyWithImpl<$Res, $Val extends UserAdsEvent>
    implements $UserAdsEventCopyWith<$Res> {
  _$UserAdsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchUserAdsImplCopyWith<$Res>
    implements $UserAdsEventCopyWith<$Res> {
  factory _$$FetchUserAdsImplCopyWith(
          _$FetchUserAdsImpl value, $Res Function(_$FetchUserAdsImpl) then) =
      __$$FetchUserAdsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$FetchUserAdsImplCopyWithImpl<$Res>
    extends _$UserAdsEventCopyWithImpl<$Res, _$FetchUserAdsImpl>
    implements _$$FetchUserAdsImplCopyWith<$Res> {
  __$$FetchUserAdsImplCopyWithImpl(
      _$FetchUserAdsImpl _value, $Res Function(_$FetchUserAdsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$FetchUserAdsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchUserAdsImpl implements _FetchUserAds {
  const _$FetchUserAdsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'UserAdsEvent.fetchUserAds(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUserAdsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of UserAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchUserAdsImplCopyWith<_$FetchUserAdsImpl> get copyWith =>
      __$$FetchUserAdsImplCopyWithImpl<_$FetchUserAdsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) fetchUserAds,
    required TResult Function(String userId) refreshUserAds,
  }) {
    return fetchUserAds(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? fetchUserAds,
    TResult? Function(String userId)? refreshUserAds,
  }) {
    return fetchUserAds?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? fetchUserAds,
    TResult Function(String userId)? refreshUserAds,
    required TResult orElse(),
  }) {
    if (fetchUserAds != null) {
      return fetchUserAds(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchUserAds value) fetchUserAds,
    required TResult Function(_RefreshUserAds value) refreshUserAds,
  }) {
    return fetchUserAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchUserAds value)? fetchUserAds,
    TResult? Function(_RefreshUserAds value)? refreshUserAds,
  }) {
    return fetchUserAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchUserAds value)? fetchUserAds,
    TResult Function(_RefreshUserAds value)? refreshUserAds,
    required TResult orElse(),
  }) {
    if (fetchUserAds != null) {
      return fetchUserAds(this);
    }
    return orElse();
  }
}

abstract class _FetchUserAds implements UserAdsEvent {
  const factory _FetchUserAds({required final String userId}) =
      _$FetchUserAdsImpl;

  @override
  String get userId;

  /// Create a copy of UserAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchUserAdsImplCopyWith<_$FetchUserAdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshUserAdsImplCopyWith<$Res>
    implements $UserAdsEventCopyWith<$Res> {
  factory _$$RefreshUserAdsImplCopyWith(_$RefreshUserAdsImpl value,
          $Res Function(_$RefreshUserAdsImpl) then) =
      __$$RefreshUserAdsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$RefreshUserAdsImplCopyWithImpl<$Res>
    extends _$UserAdsEventCopyWithImpl<$Res, _$RefreshUserAdsImpl>
    implements _$$RefreshUserAdsImplCopyWith<$Res> {
  __$$RefreshUserAdsImplCopyWithImpl(
      _$RefreshUserAdsImpl _value, $Res Function(_$RefreshUserAdsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$RefreshUserAdsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshUserAdsImpl implements _RefreshUserAds {
  const _$RefreshUserAdsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'UserAdsEvent.refreshUserAds(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshUserAdsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of UserAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshUserAdsImplCopyWith<_$RefreshUserAdsImpl> get copyWith =>
      __$$RefreshUserAdsImplCopyWithImpl<_$RefreshUserAdsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) fetchUserAds,
    required TResult Function(String userId) refreshUserAds,
  }) {
    return refreshUserAds(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? fetchUserAds,
    TResult? Function(String userId)? refreshUserAds,
  }) {
    return refreshUserAds?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? fetchUserAds,
    TResult Function(String userId)? refreshUserAds,
    required TResult orElse(),
  }) {
    if (refreshUserAds != null) {
      return refreshUserAds(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchUserAds value) fetchUserAds,
    required TResult Function(_RefreshUserAds value) refreshUserAds,
  }) {
    return refreshUserAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchUserAds value)? fetchUserAds,
    TResult? Function(_RefreshUserAds value)? refreshUserAds,
  }) {
    return refreshUserAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchUserAds value)? fetchUserAds,
    TResult Function(_RefreshUserAds value)? refreshUserAds,
    required TResult orElse(),
  }) {
    if (refreshUserAds != null) {
      return refreshUserAds(this);
    }
    return orElse();
  }
}

abstract class _RefreshUserAds implements UserAdsEvent {
  const factory _RefreshUserAds({required final String userId}) =
      _$RefreshUserAdsImpl;

  @override
  String get userId;

  /// Create a copy of UserAdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshUserAdsImplCopyWith<_$RefreshUserAdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
