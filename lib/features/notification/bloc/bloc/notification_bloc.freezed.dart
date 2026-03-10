// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String body,
            Map<String, dynamic>? data, Uint8List? imageBytes)
        sendBroadcastNotification,
    required TResult Function(int page, int limit) fetchNotifications,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult? Function(int page, int limit)? fetchNotifications,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult Function(int page, int limit)? fetchNotifications,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendBroadcastNotification value)
        sendBroadcastNotification,
    required TResult Function(FetchNotifications value) fetchNotifications,
    required TResult Function(ResetNotificationState value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult? Function(FetchNotifications value)? fetchNotifications,
    TResult? Function(ResetNotificationState value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult Function(FetchNotifications value)? fetchNotifications,
    TResult Function(ResetNotificationState value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'NotificationEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String body,
            Map<String, dynamic>? data, Uint8List? imageBytes)
        sendBroadcastNotification,
    required TResult Function(int page, int limit) fetchNotifications,
    required TResult Function() reset,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult? Function(int page, int limit)? fetchNotifications,
    TResult? Function()? reset,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult Function(int page, int limit)? fetchNotifications,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendBroadcastNotification value)
        sendBroadcastNotification,
    required TResult Function(FetchNotifications value) fetchNotifications,
    required TResult Function(ResetNotificationState value) reset,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult? Function(FetchNotifications value)? fetchNotifications,
    TResult? Function(ResetNotificationState value)? reset,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult Function(FetchNotifications value)? fetchNotifications,
    TResult Function(ResetNotificationState value)? reset,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NotificationEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SendBroadcastNotificationImplCopyWith<$Res> {
  factory _$$SendBroadcastNotificationImplCopyWith(
          _$SendBroadcastNotificationImpl value,
          $Res Function(_$SendBroadcastNotificationImpl) then) =
      __$$SendBroadcastNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title,
      String body,
      Map<String, dynamic>? data,
      Uint8List? imageBytes});
}

/// @nodoc
class __$$SendBroadcastNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res,
        _$SendBroadcastNotificationImpl>
    implements _$$SendBroadcastNotificationImplCopyWith<$Res> {
  __$$SendBroadcastNotificationImplCopyWithImpl(
      _$SendBroadcastNotificationImpl _value,
      $Res Function(_$SendBroadcastNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? data = freezed,
    Object? imageBytes = freezed,
  }) {
    return _then(_$SendBroadcastNotificationImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$SendBroadcastNotificationImpl implements SendBroadcastNotification {
  const _$SendBroadcastNotificationImpl(
      {required this.title,
      required this.body,
      final Map<String, dynamic>? data,
      this.imageBytes})
      : _data = data;

  @override
  final String title;
  @override
  final String body;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final Uint8List? imageBytes;

  @override
  String toString() {
    return 'NotificationEvent.sendBroadcastNotification(title: $title, body: $body, data: $data, imageBytes: $imageBytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendBroadcastNotificationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      body,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(imageBytes));

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendBroadcastNotificationImplCopyWith<_$SendBroadcastNotificationImpl>
      get copyWith => __$$SendBroadcastNotificationImplCopyWithImpl<
          _$SendBroadcastNotificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String body,
            Map<String, dynamic>? data, Uint8List? imageBytes)
        sendBroadcastNotification,
    required TResult Function(int page, int limit) fetchNotifications,
    required TResult Function() reset,
  }) {
    return sendBroadcastNotification(title, body, data, imageBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult? Function(int page, int limit)? fetchNotifications,
    TResult? Function()? reset,
  }) {
    return sendBroadcastNotification?.call(title, body, data, imageBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult Function(int page, int limit)? fetchNotifications,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (sendBroadcastNotification != null) {
      return sendBroadcastNotification(title, body, data, imageBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendBroadcastNotification value)
        sendBroadcastNotification,
    required TResult Function(FetchNotifications value) fetchNotifications,
    required TResult Function(ResetNotificationState value) reset,
  }) {
    return sendBroadcastNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult? Function(FetchNotifications value)? fetchNotifications,
    TResult? Function(ResetNotificationState value)? reset,
  }) {
    return sendBroadcastNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult Function(FetchNotifications value)? fetchNotifications,
    TResult Function(ResetNotificationState value)? reset,
    required TResult orElse(),
  }) {
    if (sendBroadcastNotification != null) {
      return sendBroadcastNotification(this);
    }
    return orElse();
  }
}

abstract class SendBroadcastNotification implements NotificationEvent {
  const factory SendBroadcastNotification(
      {required final String title,
      required final String body,
      final Map<String, dynamic>? data,
      final Uint8List? imageBytes}) = _$SendBroadcastNotificationImpl;

  String get title;
  String get body;
  Map<String, dynamic>? get data;
  Uint8List? get imageBytes;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendBroadcastNotificationImplCopyWith<_$SendBroadcastNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchNotificationsImplCopyWith<$Res> {
  factory _$$FetchNotificationsImplCopyWith(_$FetchNotificationsImpl value,
          $Res Function(_$FetchNotificationsImpl) then) =
      __$$FetchNotificationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$FetchNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$FetchNotificationsImpl>
    implements _$$FetchNotificationsImplCopyWith<$Res> {
  __$$FetchNotificationsImplCopyWithImpl(_$FetchNotificationsImpl _value,
      $Res Function(_$FetchNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$FetchNotificationsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchNotificationsImpl implements FetchNotifications {
  const _$FetchNotificationsImpl({this.page = 1, this.limit = 10});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'NotificationEvent.fetchNotifications(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchNotificationsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchNotificationsImplCopyWith<_$FetchNotificationsImpl> get copyWith =>
      __$$FetchNotificationsImplCopyWithImpl<_$FetchNotificationsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String body,
            Map<String, dynamic>? data, Uint8List? imageBytes)
        sendBroadcastNotification,
    required TResult Function(int page, int limit) fetchNotifications,
    required TResult Function() reset,
  }) {
    return fetchNotifications(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult? Function(int page, int limit)? fetchNotifications,
    TResult? Function()? reset,
  }) {
    return fetchNotifications?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult Function(int page, int limit)? fetchNotifications,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (fetchNotifications != null) {
      return fetchNotifications(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendBroadcastNotification value)
        sendBroadcastNotification,
    required TResult Function(FetchNotifications value) fetchNotifications,
    required TResult Function(ResetNotificationState value) reset,
  }) {
    return fetchNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult? Function(FetchNotifications value)? fetchNotifications,
    TResult? Function(ResetNotificationState value)? reset,
  }) {
    return fetchNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult Function(FetchNotifications value)? fetchNotifications,
    TResult Function(ResetNotificationState value)? reset,
    required TResult orElse(),
  }) {
    if (fetchNotifications != null) {
      return fetchNotifications(this);
    }
    return orElse();
  }
}

abstract class FetchNotifications implements NotificationEvent {
  const factory FetchNotifications({final int page, final int limit}) =
      _$FetchNotificationsImpl;

  int get page;
  int get limit;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchNotificationsImplCopyWith<_$FetchNotificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetNotificationStateImplCopyWith<$Res> {
  factory _$$ResetNotificationStateImplCopyWith(
          _$ResetNotificationStateImpl value,
          $Res Function(_$ResetNotificationStateImpl) then) =
      __$$ResetNotificationStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetNotificationStateImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$ResetNotificationStateImpl>
    implements _$$ResetNotificationStateImplCopyWith<$Res> {
  __$$ResetNotificationStateImplCopyWithImpl(
      _$ResetNotificationStateImpl _value,
      $Res Function(_$ResetNotificationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetNotificationStateImpl implements ResetNotificationState {
  const _$ResetNotificationStateImpl();

  @override
  String toString() {
    return 'NotificationEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetNotificationStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String body,
            Map<String, dynamic>? data, Uint8List? imageBytes)
        sendBroadcastNotification,
    required TResult Function(int page, int limit) fetchNotifications,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult? Function(int page, int limit)? fetchNotifications,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String body, Map<String, dynamic>? data,
            Uint8List? imageBytes)?
        sendBroadcastNotification,
    TResult Function(int page, int limit)? fetchNotifications,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SendBroadcastNotification value)
        sendBroadcastNotification,
    required TResult Function(FetchNotifications value) fetchNotifications,
    required TResult Function(ResetNotificationState value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult? Function(FetchNotifications value)? fetchNotifications,
    TResult? Function(ResetNotificationState value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SendBroadcastNotification value)?
        sendBroadcastNotification,
    TResult Function(FetchNotifications value)? fetchNotifications,
    TResult Function(ResetNotificationState value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class ResetNotificationState implements NotificationEvent {
  const factory ResetNotificationState() = _$ResetNotificationStateImpl;
}

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() listLoading,
    required TResult Function(
            List<NotificationListItem> items, int page, int totalPages)
        listLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? listLoading,
    TResult? Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? listLoading,
    TResult Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NotificationLoading value) loading,
    required TResult Function(NotificationListLoading value) listLoading,
    required TResult Function(NotificationListLoaded value) listLoaded,
    required TResult Function(NotificationSuccess value) success,
    required TResult Function(NotificationError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NotificationLoading value)? loading,
    TResult? Function(NotificationListLoading value)? listLoading,
    TResult? Function(NotificationListLoaded value)? listLoaded,
    TResult? Function(NotificationSuccess value)? success,
    TResult? Function(NotificationError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NotificationLoading value)? loading,
    TResult Function(NotificationListLoading value)? listLoading,
    TResult Function(NotificationListLoaded value)? listLoaded,
    TResult Function(NotificationSuccess value)? success,
    TResult Function(NotificationError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationState
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
    extends _$NotificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotificationState.initial()';
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
    required TResult Function() listLoading,
    required TResult Function(
            List<NotificationListItem> items, int page, int totalPages)
        listLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? listLoading,
    TResult? Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? listLoading,
    TResult Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult Function(String message)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(NotificationLoading value) loading,
    required TResult Function(NotificationListLoading value) listLoading,
    required TResult Function(NotificationListLoaded value) listLoaded,
    required TResult Function(NotificationSuccess value) success,
    required TResult Function(NotificationError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NotificationLoading value)? loading,
    TResult? Function(NotificationListLoading value)? listLoading,
    TResult? Function(NotificationListLoaded value)? listLoaded,
    TResult? Function(NotificationSuccess value)? success,
    TResult? Function(NotificationError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NotificationLoading value)? loading,
    TResult Function(NotificationListLoading value)? listLoading,
    TResult Function(NotificationListLoaded value)? listLoaded,
    TResult Function(NotificationSuccess value)? success,
    TResult Function(NotificationError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotificationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$NotificationLoadingImplCopyWith<$Res> {
  factory _$$NotificationLoadingImplCopyWith(_$NotificationLoadingImpl value,
          $Res Function(_$NotificationLoadingImpl) then) =
      __$$NotificationLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationLoadingImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationLoadingImpl>
    implements _$$NotificationLoadingImplCopyWith<$Res> {
  __$$NotificationLoadingImplCopyWithImpl(_$NotificationLoadingImpl _value,
      $Res Function(_$NotificationLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotificationLoadingImpl implements NotificationLoading {
  const _$NotificationLoadingImpl();

  @override
  String toString() {
    return 'NotificationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() listLoading,
    required TResult Function(
            List<NotificationListItem> items, int page, int totalPages)
        listLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? listLoading,
    TResult? Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? listLoading,
    TResult Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult Function(String message)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(NotificationLoading value) loading,
    required TResult Function(NotificationListLoading value) listLoading,
    required TResult Function(NotificationListLoaded value) listLoaded,
    required TResult Function(NotificationSuccess value) success,
    required TResult Function(NotificationError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NotificationLoading value)? loading,
    TResult? Function(NotificationListLoading value)? listLoading,
    TResult? Function(NotificationListLoaded value)? listLoaded,
    TResult? Function(NotificationSuccess value)? success,
    TResult? Function(NotificationError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NotificationLoading value)? loading,
    TResult Function(NotificationListLoading value)? listLoading,
    TResult Function(NotificationListLoaded value)? listLoaded,
    TResult Function(NotificationSuccess value)? success,
    TResult Function(NotificationError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NotificationLoading implements NotificationState {
  const factory NotificationLoading() = _$NotificationLoadingImpl;
}

/// @nodoc
abstract class _$$NotificationListLoadingImplCopyWith<$Res> {
  factory _$$NotificationListLoadingImplCopyWith(
          _$NotificationListLoadingImpl value,
          $Res Function(_$NotificationListLoadingImpl) then) =
      __$$NotificationListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationListLoadingImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationListLoadingImpl>
    implements _$$NotificationListLoadingImplCopyWith<$Res> {
  __$$NotificationListLoadingImplCopyWithImpl(
      _$NotificationListLoadingImpl _value,
      $Res Function(_$NotificationListLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotificationListLoadingImpl implements NotificationListLoading {
  const _$NotificationListLoadingImpl();

  @override
  String toString() {
    return 'NotificationState.listLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() listLoading,
    required TResult Function(
            List<NotificationListItem> items, int page, int totalPages)
        listLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return listLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? listLoading,
    TResult? Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return listLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? listLoading,
    TResult Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (listLoading != null) {
      return listLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NotificationLoading value) loading,
    required TResult Function(NotificationListLoading value) listLoading,
    required TResult Function(NotificationListLoaded value) listLoaded,
    required TResult Function(NotificationSuccess value) success,
    required TResult Function(NotificationError value) error,
  }) {
    return listLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NotificationLoading value)? loading,
    TResult? Function(NotificationListLoading value)? listLoading,
    TResult? Function(NotificationListLoaded value)? listLoaded,
    TResult? Function(NotificationSuccess value)? success,
    TResult? Function(NotificationError value)? error,
  }) {
    return listLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NotificationLoading value)? loading,
    TResult Function(NotificationListLoading value)? listLoading,
    TResult Function(NotificationListLoaded value)? listLoaded,
    TResult Function(NotificationSuccess value)? success,
    TResult Function(NotificationError value)? error,
    required TResult orElse(),
  }) {
    if (listLoading != null) {
      return listLoading(this);
    }
    return orElse();
  }
}

abstract class NotificationListLoading implements NotificationState {
  const factory NotificationListLoading() = _$NotificationListLoadingImpl;
}

/// @nodoc
abstract class _$$NotificationListLoadedImplCopyWith<$Res> {
  factory _$$NotificationListLoadedImplCopyWith(
          _$NotificationListLoadedImpl value,
          $Res Function(_$NotificationListLoadedImpl) then) =
      __$$NotificationListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationListItem> items, int page, int totalPages});
}

/// @nodoc
class __$$NotificationListLoadedImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationListLoadedImpl>
    implements _$$NotificationListLoadedImplCopyWith<$Res> {
  __$$NotificationListLoadedImplCopyWithImpl(
      _$NotificationListLoadedImpl _value,
      $Res Function(_$NotificationListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? totalPages = null,
  }) {
    return _then(_$NotificationListLoadedImpl(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NotificationListItem>,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NotificationListLoadedImpl implements NotificationListLoaded {
  const _$NotificationListLoadedImpl(
      final List<NotificationListItem> items, this.page, this.totalPages)
      : _items = items;

  final List<NotificationListItem> _items;
  @override
  List<NotificationListItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int page;
  @override
  final int totalPages;

  @override
  String toString() {
    return 'NotificationState.listLoaded(items: $items, page: $page, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationListLoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), page, totalPages);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationListLoadedImplCopyWith<_$NotificationListLoadedImpl>
      get copyWith => __$$NotificationListLoadedImplCopyWithImpl<
          _$NotificationListLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() listLoading,
    required TResult Function(
            List<NotificationListItem> items, int page, int totalPages)
        listLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return listLoaded(items, page, totalPages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? listLoading,
    TResult? Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return listLoaded?.call(items, page, totalPages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? listLoading,
    TResult Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (listLoaded != null) {
      return listLoaded(items, page, totalPages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NotificationLoading value) loading,
    required TResult Function(NotificationListLoading value) listLoading,
    required TResult Function(NotificationListLoaded value) listLoaded,
    required TResult Function(NotificationSuccess value) success,
    required TResult Function(NotificationError value) error,
  }) {
    return listLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NotificationLoading value)? loading,
    TResult? Function(NotificationListLoading value)? listLoading,
    TResult? Function(NotificationListLoaded value)? listLoaded,
    TResult? Function(NotificationSuccess value)? success,
    TResult? Function(NotificationError value)? error,
  }) {
    return listLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NotificationLoading value)? loading,
    TResult Function(NotificationListLoading value)? listLoading,
    TResult Function(NotificationListLoaded value)? listLoaded,
    TResult Function(NotificationSuccess value)? success,
    TResult Function(NotificationError value)? error,
    required TResult orElse(),
  }) {
    if (listLoaded != null) {
      return listLoaded(this);
    }
    return orElse();
  }
}

abstract class NotificationListLoaded implements NotificationState {
  const factory NotificationListLoaded(final List<NotificationListItem> items,
      final int page, final int totalPages) = _$NotificationListLoadedImpl;

  List<NotificationListItem> get items;
  int get page;
  int get totalPages;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationListLoadedImplCopyWith<_$NotificationListLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationSuccessImplCopyWith<$Res> {
  factory _$$NotificationSuccessImplCopyWith(_$NotificationSuccessImpl value,
          $Res Function(_$NotificationSuccessImpl) then) =
      __$$NotificationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotificationSuccessImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationSuccessImpl>
    implements _$$NotificationSuccessImplCopyWith<$Res> {
  __$$NotificationSuccessImplCopyWithImpl(_$NotificationSuccessImpl _value,
      $Res Function(_$NotificationSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotificationSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotificationSuccessImpl implements NotificationSuccess {
  const _$NotificationSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSuccessImplCopyWith<_$NotificationSuccessImpl> get copyWith =>
      __$$NotificationSuccessImplCopyWithImpl<_$NotificationSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() listLoading,
    required TResult Function(
            List<NotificationListItem> items, int page, int totalPages)
        listLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? listLoading,
    TResult? Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? listLoading,
    TResult Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(NotificationLoading value) loading,
    required TResult Function(NotificationListLoading value) listLoading,
    required TResult Function(NotificationListLoaded value) listLoaded,
    required TResult Function(NotificationSuccess value) success,
    required TResult Function(NotificationError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NotificationLoading value)? loading,
    TResult? Function(NotificationListLoading value)? listLoading,
    TResult? Function(NotificationListLoaded value)? listLoaded,
    TResult? Function(NotificationSuccess value)? success,
    TResult? Function(NotificationError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NotificationLoading value)? loading,
    TResult Function(NotificationListLoading value)? listLoading,
    TResult Function(NotificationListLoaded value)? listLoaded,
    TResult Function(NotificationSuccess value)? success,
    TResult Function(NotificationError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class NotificationSuccess implements NotificationState {
  const factory NotificationSuccess(final String message) =
      _$NotificationSuccessImpl;

  String get message;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSuccessImplCopyWith<_$NotificationSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationErrorImplCopyWith<$Res> {
  factory _$$NotificationErrorImplCopyWith(_$NotificationErrorImpl value,
          $Res Function(_$NotificationErrorImpl) then) =
      __$$NotificationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotificationErrorImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationErrorImpl>
    implements _$$NotificationErrorImplCopyWith<$Res> {
  __$$NotificationErrorImplCopyWithImpl(_$NotificationErrorImpl _value,
      $Res Function(_$NotificationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotificationErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotificationErrorImpl implements NotificationError {
  const _$NotificationErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationErrorImplCopyWith<_$NotificationErrorImpl> get copyWith =>
      __$$NotificationErrorImplCopyWithImpl<_$NotificationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() listLoading,
    required TResult Function(
            List<NotificationListItem> items, int page, int totalPages)
        listLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? listLoading,
    TResult? Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? listLoading,
    TResult Function(
            List<NotificationListItem> items, int page, int totalPages)?
        listLoaded,
    TResult Function(String message)? success,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(NotificationLoading value) loading,
    required TResult Function(NotificationListLoading value) listLoading,
    required TResult Function(NotificationListLoaded value) listLoaded,
    required TResult Function(NotificationSuccess value) success,
    required TResult Function(NotificationError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(NotificationLoading value)? loading,
    TResult? Function(NotificationListLoading value)? listLoading,
    TResult? Function(NotificationListLoaded value)? listLoaded,
    TResult? Function(NotificationSuccess value)? success,
    TResult? Function(NotificationError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(NotificationLoading value)? loading,
    TResult Function(NotificationListLoading value)? listLoading,
    TResult Function(NotificationListLoaded value)? listLoaded,
    TResult Function(NotificationSuccess value)? success,
    TResult Function(NotificationError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NotificationError implements NotificationState {
  const factory NotificationError(final String message) =
      _$NotificationErrorImpl;

  String get message;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationErrorImplCopyWith<_$NotificationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
