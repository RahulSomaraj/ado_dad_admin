// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'showroom_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShowroomEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)
        fetchAllShowrooms,
    required TResult Function(UserModel showroomData) addShowroom,
    required TResult Function(UserModel updatedShowroom) updateShowroom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult? Function(UserModel showroomData)? addShowroom,
    TResult? Function(UserModel updatedShowroom)? updateShowroom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult Function(UserModel showroomData)? addShowroom,
    TResult Function(UserModel updatedShowroom)? updateShowroom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllShowrooms value) fetchAllShowrooms,
    required TResult Function(AddShowroom value) addShowroom,
    required TResult Function(UpdateShowroom value) updateShowroom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult? Function(AddShowroom value)? addShowroom,
    TResult? Function(UpdateShowroom value)? updateShowroom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult Function(AddShowroom value)? addShowroom,
    TResult Function(UpdateShowroom value)? updateShowroom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowroomEventCopyWith<$Res> {
  factory $ShowroomEventCopyWith(
          ShowroomEvent value, $Res Function(ShowroomEvent) then) =
      _$ShowroomEventCopyWithImpl<$Res, ShowroomEvent>;
}

/// @nodoc
class _$ShowroomEventCopyWithImpl<$Res, $Val extends ShowroomEvent>
    implements $ShowroomEventCopyWith<$Res> {
  _$ShowroomEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShowroomEvent
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
    extends _$ShowroomEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ShowroomEvent.started()';
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
    required TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)
        fetchAllShowrooms,
    required TResult Function(UserModel showroomData) addShowroom,
    required TResult Function(UserModel updatedShowroom) updateShowroom,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult? Function(UserModel showroomData)? addShowroom,
    TResult? Function(UserModel updatedShowroom)? updateShowroom,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult Function(UserModel showroomData)? addShowroom,
    TResult Function(UserModel updatedShowroom)? updateShowroom,
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
    required TResult Function(FetchAllShowrooms value) fetchAllShowrooms,
    required TResult Function(AddShowroom value) addShowroom,
    required TResult Function(UpdateShowroom value) updateShowroom,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult? Function(AddShowroom value)? addShowroom,
    TResult? Function(UpdateShowroom value)? updateShowroom,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult Function(AddShowroom value)? addShowroom,
    TResult Function(UpdateShowroom value)? updateShowroom,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ShowroomEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchAllShowroomsImplCopyWith<$Res> {
  factory _$$FetchAllShowroomsImplCopyWith(_$FetchAllShowroomsImpl value,
          $Res Function(_$FetchAllShowroomsImpl) then) =
      __$$FetchAllShowroomsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? page, int? limit, String? userType, String? searchQuery});
}

/// @nodoc
class __$$FetchAllShowroomsImplCopyWithImpl<$Res>
    extends _$ShowroomEventCopyWithImpl<$Res, _$FetchAllShowroomsImpl>
    implements _$$FetchAllShowroomsImplCopyWith<$Res> {
  __$$FetchAllShowroomsImplCopyWithImpl(_$FetchAllShowroomsImpl _value,
      $Res Function(_$FetchAllShowroomsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
    Object? userType = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_$FetchAllShowroomsImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchAllShowroomsImpl implements FetchAllShowrooms {
  const _$FetchAllShowroomsImpl(
      {this.page = 1,
      this.limit = 10,
      this.userType = 'SR',
      this.searchQuery = ''});

  @override
  @JsonKey()
  final int? page;
  @override
  @JsonKey()
  final int? limit;
  @override
  @JsonKey()
  final String? userType;
  @override
  @JsonKey()
  final String? searchQuery;

  @override
  String toString() {
    return 'ShowroomEvent.fetchAllShowrooms(page: $page, limit: $limit, userType: $userType, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllShowroomsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, limit, userType, searchQuery);

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllShowroomsImplCopyWith<_$FetchAllShowroomsImpl> get copyWith =>
      __$$FetchAllShowroomsImplCopyWithImpl<_$FetchAllShowroomsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)
        fetchAllShowrooms,
    required TResult Function(UserModel showroomData) addShowroom,
    required TResult Function(UserModel updatedShowroom) updateShowroom,
  }) {
    return fetchAllShowrooms(page, limit, userType, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult? Function(UserModel showroomData)? addShowroom,
    TResult? Function(UserModel updatedShowroom)? updateShowroom,
  }) {
    return fetchAllShowrooms?.call(page, limit, userType, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult Function(UserModel showroomData)? addShowroom,
    TResult Function(UserModel updatedShowroom)? updateShowroom,
    required TResult orElse(),
  }) {
    if (fetchAllShowrooms != null) {
      return fetchAllShowrooms(page, limit, userType, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllShowrooms value) fetchAllShowrooms,
    required TResult Function(AddShowroom value) addShowroom,
    required TResult Function(UpdateShowroom value) updateShowroom,
  }) {
    return fetchAllShowrooms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult? Function(AddShowroom value)? addShowroom,
    TResult? Function(UpdateShowroom value)? updateShowroom,
  }) {
    return fetchAllShowrooms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult Function(AddShowroom value)? addShowroom,
    TResult Function(UpdateShowroom value)? updateShowroom,
    required TResult orElse(),
  }) {
    if (fetchAllShowrooms != null) {
      return fetchAllShowrooms(this);
    }
    return orElse();
  }
}

abstract class FetchAllShowrooms implements ShowroomEvent {
  const factory FetchAllShowrooms(
      {final int? page,
      final int? limit,
      final String? userType,
      final String? searchQuery}) = _$FetchAllShowroomsImpl;

  int? get page;
  int? get limit;
  String? get userType;
  String? get searchQuery;

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllShowroomsImplCopyWith<_$FetchAllShowroomsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddShowroomImplCopyWith<$Res> {
  factory _$$AddShowroomImplCopyWith(
          _$AddShowroomImpl value, $Res Function(_$AddShowroomImpl) then) =
      __$$AddShowroomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel showroomData});
}

/// @nodoc
class __$$AddShowroomImplCopyWithImpl<$Res>
    extends _$ShowroomEventCopyWithImpl<$Res, _$AddShowroomImpl>
    implements _$$AddShowroomImplCopyWith<$Res> {
  __$$AddShowroomImplCopyWithImpl(
      _$AddShowroomImpl _value, $Res Function(_$AddShowroomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showroomData = null,
  }) {
    return _then(_$AddShowroomImpl(
      showroomData: null == showroomData
          ? _value.showroomData
          : showroomData // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$AddShowroomImpl implements AddShowroom {
  const _$AddShowroomImpl({required this.showroomData});

  @override
  final UserModel showroomData;

  @override
  String toString() {
    return 'ShowroomEvent.addShowroom(showroomData: $showroomData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddShowroomImpl &&
            (identical(other.showroomData, showroomData) ||
                other.showroomData == showroomData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showroomData);

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddShowroomImplCopyWith<_$AddShowroomImpl> get copyWith =>
      __$$AddShowroomImplCopyWithImpl<_$AddShowroomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)
        fetchAllShowrooms,
    required TResult Function(UserModel showroomData) addShowroom,
    required TResult Function(UserModel updatedShowroom) updateShowroom,
  }) {
    return addShowroom(showroomData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult? Function(UserModel showroomData)? addShowroom,
    TResult? Function(UserModel updatedShowroom)? updateShowroom,
  }) {
    return addShowroom?.call(showroomData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult Function(UserModel showroomData)? addShowroom,
    TResult Function(UserModel updatedShowroom)? updateShowroom,
    required TResult orElse(),
  }) {
    if (addShowroom != null) {
      return addShowroom(showroomData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllShowrooms value) fetchAllShowrooms,
    required TResult Function(AddShowroom value) addShowroom,
    required TResult Function(UpdateShowroom value) updateShowroom,
  }) {
    return addShowroom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult? Function(AddShowroom value)? addShowroom,
    TResult? Function(UpdateShowroom value)? updateShowroom,
  }) {
    return addShowroom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult Function(AddShowroom value)? addShowroom,
    TResult Function(UpdateShowroom value)? updateShowroom,
    required TResult orElse(),
  }) {
    if (addShowroom != null) {
      return addShowroom(this);
    }
    return orElse();
  }
}

abstract class AddShowroom implements ShowroomEvent {
  const factory AddShowroom({required final UserModel showroomData}) =
      _$AddShowroomImpl;

  UserModel get showroomData;

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddShowroomImplCopyWith<_$AddShowroomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateShowroomImplCopyWith<$Res> {
  factory _$$UpdateShowroomImplCopyWith(_$UpdateShowroomImpl value,
          $Res Function(_$UpdateShowroomImpl) then) =
      __$$UpdateShowroomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel updatedShowroom});
}

/// @nodoc
class __$$UpdateShowroomImplCopyWithImpl<$Res>
    extends _$ShowroomEventCopyWithImpl<$Res, _$UpdateShowroomImpl>
    implements _$$UpdateShowroomImplCopyWith<$Res> {
  __$$UpdateShowroomImplCopyWithImpl(
      _$UpdateShowroomImpl _value, $Res Function(_$UpdateShowroomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedShowroom = null,
  }) {
    return _then(_$UpdateShowroomImpl(
      updatedShowroom: null == updatedShowroom
          ? _value.updatedShowroom
          : updatedShowroom // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$UpdateShowroomImpl implements UpdateShowroom {
  const _$UpdateShowroomImpl({required this.updatedShowroom});

  @override
  final UserModel updatedShowroom;

  @override
  String toString() {
    return 'ShowroomEvent.updateShowroom(updatedShowroom: $updatedShowroom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateShowroomImpl &&
            (identical(other.updatedShowroom, updatedShowroom) ||
                other.updatedShowroom == updatedShowroom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updatedShowroom);

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateShowroomImplCopyWith<_$UpdateShowroomImpl> get copyWith =>
      __$$UpdateShowroomImplCopyWithImpl<_$UpdateShowroomImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)
        fetchAllShowrooms,
    required TResult Function(UserModel showroomData) addShowroom,
    required TResult Function(UserModel updatedShowroom) updateShowroom,
  }) {
    return updateShowroom(updatedShowroom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult? Function(UserModel showroomData)? addShowroom,
    TResult? Function(UserModel updatedShowroom)? updateShowroom,
  }) {
    return updateShowroom?.call(updatedShowroom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            int? page, int? limit, String? userType, String? searchQuery)?
        fetchAllShowrooms,
    TResult Function(UserModel showroomData)? addShowroom,
    TResult Function(UserModel updatedShowroom)? updateShowroom,
    required TResult orElse(),
  }) {
    if (updateShowroom != null) {
      return updateShowroom(updatedShowroom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllShowrooms value) fetchAllShowrooms,
    required TResult Function(AddShowroom value) addShowroom,
    required TResult Function(UpdateShowroom value) updateShowroom,
  }) {
    return updateShowroom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult? Function(AddShowroom value)? addShowroom,
    TResult? Function(UpdateShowroom value)? updateShowroom,
  }) {
    return updateShowroom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllShowrooms value)? fetchAllShowrooms,
    TResult Function(AddShowroom value)? addShowroom,
    TResult Function(UpdateShowroom value)? updateShowroom,
    required TResult orElse(),
  }) {
    if (updateShowroom != null) {
      return updateShowroom(this);
    }
    return orElse();
  }
}

abstract class UpdateShowroom implements ShowroomEvent {
  const factory UpdateShowroom({required final UserModel updatedShowroom}) =
      _$UpdateShowroomImpl;

  UserModel get updatedShowroom;

  /// Create a copy of ShowroomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateShowroomImplCopyWith<_$UpdateShowroomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShowroomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() addingShowroom,
    required TResult Function(String message) showroomAddedSuccess,
    required TResult Function() updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? addingShowroom,
    TResult? Function(String message)? showroomAddedSuccess,
    TResult? Function()? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? addingShowroom,
    TResult Function(String message)? showroomAddedSuccess,
    TResult Function()? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowroomInitial value) initial,
    required TResult Function(ShowroomLoading value) loading,
    required TResult Function(ShowroomLoaded value) loaded,
    required TResult Function(ShowroomError value) error,
    required TResult Function(AddingShowroom value) addingShowroom,
    required TResult Function(ShowroomAddedSuccess value) showroomAddedSuccess,
    required TResult Function(ShowroomUpdated value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomInitial value)? initial,
    TResult? Function(ShowroomLoading value)? loading,
    TResult? Function(ShowroomLoaded value)? loaded,
    TResult? Function(ShowroomError value)? error,
    TResult? Function(AddingShowroom value)? addingShowroom,
    TResult? Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult? Function(ShowroomUpdated value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomInitial value)? initial,
    TResult Function(ShowroomLoading value)? loading,
    TResult Function(ShowroomLoaded value)? loaded,
    TResult Function(ShowroomError value)? error,
    TResult Function(AddingShowroom value)? addingShowroom,
    TResult Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult Function(ShowroomUpdated value)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowroomStateCopyWith<$Res> {
  factory $ShowroomStateCopyWith(
          ShowroomState value, $Res Function(ShowroomState) then) =
      _$ShowroomStateCopyWithImpl<$Res, ShowroomState>;
}

/// @nodoc
class _$ShowroomStateCopyWithImpl<$Res, $Val extends ShowroomState>
    implements $ShowroomStateCopyWith<$Res> {
  _$ShowroomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ShowroomInitialImplCopyWith<$Res> {
  factory _$$ShowroomInitialImplCopyWith(_$ShowroomInitialImpl value,
          $Res Function(_$ShowroomInitialImpl) then) =
      __$$ShowroomInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowroomInitialImplCopyWithImpl<$Res>
    extends _$ShowroomStateCopyWithImpl<$Res, _$ShowroomInitialImpl>
    implements _$$ShowroomInitialImplCopyWith<$Res> {
  __$$ShowroomInitialImplCopyWithImpl(
      _$ShowroomInitialImpl _value, $Res Function(_$ShowroomInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ShowroomInitialImpl implements ShowroomInitial {
  const _$ShowroomInitialImpl();

  @override
  String toString() {
    return 'ShowroomState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowroomInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() addingShowroom,
    required TResult Function(String message) showroomAddedSuccess,
    required TResult Function() updated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? addingShowroom,
    TResult? Function(String message)? showroomAddedSuccess,
    TResult? Function()? updated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? addingShowroom,
    TResult Function(String message)? showroomAddedSuccess,
    TResult Function()? updated,
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
    required TResult Function(ShowroomInitial value) initial,
    required TResult Function(ShowroomLoading value) loading,
    required TResult Function(ShowroomLoaded value) loaded,
    required TResult Function(ShowroomError value) error,
    required TResult Function(AddingShowroom value) addingShowroom,
    required TResult Function(ShowroomAddedSuccess value) showroomAddedSuccess,
    required TResult Function(ShowroomUpdated value) updated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomInitial value)? initial,
    TResult? Function(ShowroomLoading value)? loading,
    TResult? Function(ShowroomLoaded value)? loaded,
    TResult? Function(ShowroomError value)? error,
    TResult? Function(AddingShowroom value)? addingShowroom,
    TResult? Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult? Function(ShowroomUpdated value)? updated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomInitial value)? initial,
    TResult Function(ShowroomLoading value)? loading,
    TResult Function(ShowroomLoaded value)? loaded,
    TResult Function(ShowroomError value)? error,
    TResult Function(AddingShowroom value)? addingShowroom,
    TResult Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult Function(ShowroomUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ShowroomInitial implements ShowroomState {
  const factory ShowroomInitial() = _$ShowroomInitialImpl;
}

/// @nodoc
abstract class _$$ShowroomLoadingImplCopyWith<$Res> {
  factory _$$ShowroomLoadingImplCopyWith(_$ShowroomLoadingImpl value,
          $Res Function(_$ShowroomLoadingImpl) then) =
      __$$ShowroomLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowroomLoadingImplCopyWithImpl<$Res>
    extends _$ShowroomStateCopyWithImpl<$Res, _$ShowroomLoadingImpl>
    implements _$$ShowroomLoadingImplCopyWith<$Res> {
  __$$ShowroomLoadingImplCopyWithImpl(
      _$ShowroomLoadingImpl _value, $Res Function(_$ShowroomLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ShowroomLoadingImpl implements ShowroomLoading {
  const _$ShowroomLoadingImpl();

  @override
  String toString() {
    return 'ShowroomState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowroomLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() addingShowroom,
    required TResult Function(String message) showroomAddedSuccess,
    required TResult Function() updated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? addingShowroom,
    TResult? Function(String message)? showroomAddedSuccess,
    TResult? Function()? updated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? addingShowroom,
    TResult Function(String message)? showroomAddedSuccess,
    TResult Function()? updated,
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
    required TResult Function(ShowroomInitial value) initial,
    required TResult Function(ShowroomLoading value) loading,
    required TResult Function(ShowroomLoaded value) loaded,
    required TResult Function(ShowroomError value) error,
    required TResult Function(AddingShowroom value) addingShowroom,
    required TResult Function(ShowroomAddedSuccess value) showroomAddedSuccess,
    required TResult Function(ShowroomUpdated value) updated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomInitial value)? initial,
    TResult? Function(ShowroomLoading value)? loading,
    TResult? Function(ShowroomLoaded value)? loaded,
    TResult? Function(ShowroomError value)? error,
    TResult? Function(AddingShowroom value)? addingShowroom,
    TResult? Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult? Function(ShowroomUpdated value)? updated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomInitial value)? initial,
    TResult Function(ShowroomLoading value)? loading,
    TResult Function(ShowroomLoaded value)? loaded,
    TResult Function(ShowroomError value)? error,
    TResult Function(AddingShowroom value)? addingShowroom,
    TResult Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult Function(ShowroomUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShowroomLoading implements ShowroomState {
  const factory ShowroomLoading() = _$ShowroomLoadingImpl;
}

/// @nodoc
abstract class _$$ShowroomLoadedImplCopyWith<$Res> {
  factory _$$ShowroomLoadedImplCopyWith(_$ShowroomLoadedImpl value,
          $Res Function(_$ShowroomLoadedImpl) then) =
      __$$ShowroomLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserModel> showroomusers, int totalPages, int currentPage});
}

/// @nodoc
class __$$ShowroomLoadedImplCopyWithImpl<$Res>
    extends _$ShowroomStateCopyWithImpl<$Res, _$ShowroomLoadedImpl>
    implements _$$ShowroomLoadedImplCopyWith<$Res> {
  __$$ShowroomLoadedImplCopyWithImpl(
      _$ShowroomLoadedImpl _value, $Res Function(_$ShowroomLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showroomusers = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(_$ShowroomLoadedImpl(
      showroomusers: null == showroomusers
          ? _value._showroomusers
          : showroomusers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ShowroomLoadedImpl implements ShowroomLoaded {
  const _$ShowroomLoadedImpl(
      {required final List<UserModel> showroomusers,
      required this.totalPages,
      required this.currentPage})
      : _showroomusers = showroomusers;

  final List<UserModel> _showroomusers;
  @override
  List<UserModel> get showroomusers {
    if (_showroomusers is EqualUnmodifiableListView) return _showroomusers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_showroomusers);
  }

  @override
  final int totalPages;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'ShowroomState.loaded(showroomusers: $showroomusers, totalPages: $totalPages, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowroomLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._showroomusers, _showroomusers) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_showroomusers),
      totalPages,
      currentPage);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowroomLoadedImplCopyWith<_$ShowroomLoadedImpl> get copyWith =>
      __$$ShowroomLoadedImplCopyWithImpl<_$ShowroomLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() addingShowroom,
    required TResult Function(String message) showroomAddedSuccess,
    required TResult Function() updated,
  }) {
    return loaded(showroomusers, totalPages, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? addingShowroom,
    TResult? Function(String message)? showroomAddedSuccess,
    TResult? Function()? updated,
  }) {
    return loaded?.call(showroomusers, totalPages, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? addingShowroom,
    TResult Function(String message)? showroomAddedSuccess,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(showroomusers, totalPages, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowroomInitial value) initial,
    required TResult Function(ShowroomLoading value) loading,
    required TResult Function(ShowroomLoaded value) loaded,
    required TResult Function(ShowroomError value) error,
    required TResult Function(AddingShowroom value) addingShowroom,
    required TResult Function(ShowroomAddedSuccess value) showroomAddedSuccess,
    required TResult Function(ShowroomUpdated value) updated,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomInitial value)? initial,
    TResult? Function(ShowroomLoading value)? loading,
    TResult? Function(ShowroomLoaded value)? loaded,
    TResult? Function(ShowroomError value)? error,
    TResult? Function(AddingShowroom value)? addingShowroom,
    TResult? Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult? Function(ShowroomUpdated value)? updated,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomInitial value)? initial,
    TResult Function(ShowroomLoading value)? loading,
    TResult Function(ShowroomLoaded value)? loaded,
    TResult Function(ShowroomError value)? error,
    TResult Function(AddingShowroom value)? addingShowroom,
    TResult Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult Function(ShowroomUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ShowroomLoaded implements ShowroomState {
  const factory ShowroomLoaded(
      {required final List<UserModel> showroomusers,
      required final int totalPages,
      required final int currentPage}) = _$ShowroomLoadedImpl;

  List<UserModel> get showroomusers;
  int get totalPages;
  int get currentPage;

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowroomLoadedImplCopyWith<_$ShowroomLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowroomErrorImplCopyWith<$Res> {
  factory _$$ShowroomErrorImplCopyWith(
          _$ShowroomErrorImpl value, $Res Function(_$ShowroomErrorImpl) then) =
      __$$ShowroomErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ShowroomErrorImplCopyWithImpl<$Res>
    extends _$ShowroomStateCopyWithImpl<$Res, _$ShowroomErrorImpl>
    implements _$$ShowroomErrorImplCopyWith<$Res> {
  __$$ShowroomErrorImplCopyWithImpl(
      _$ShowroomErrorImpl _value, $Res Function(_$ShowroomErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ShowroomErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowroomErrorImpl implements ShowroomError {
  const _$ShowroomErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ShowroomState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowroomErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowroomErrorImplCopyWith<_$ShowroomErrorImpl> get copyWith =>
      __$$ShowroomErrorImplCopyWithImpl<_$ShowroomErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() addingShowroom,
    required TResult Function(String message) showroomAddedSuccess,
    required TResult Function() updated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? addingShowroom,
    TResult? Function(String message)? showroomAddedSuccess,
    TResult? Function()? updated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? addingShowroom,
    TResult Function(String message)? showroomAddedSuccess,
    TResult Function()? updated,
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
    required TResult Function(ShowroomInitial value) initial,
    required TResult Function(ShowroomLoading value) loading,
    required TResult Function(ShowroomLoaded value) loaded,
    required TResult Function(ShowroomError value) error,
    required TResult Function(AddingShowroom value) addingShowroom,
    required TResult Function(ShowroomAddedSuccess value) showroomAddedSuccess,
    required TResult Function(ShowroomUpdated value) updated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomInitial value)? initial,
    TResult? Function(ShowroomLoading value)? loading,
    TResult? Function(ShowroomLoaded value)? loaded,
    TResult? Function(ShowroomError value)? error,
    TResult? Function(AddingShowroom value)? addingShowroom,
    TResult? Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult? Function(ShowroomUpdated value)? updated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomInitial value)? initial,
    TResult Function(ShowroomLoading value)? loading,
    TResult Function(ShowroomLoaded value)? loaded,
    TResult Function(ShowroomError value)? error,
    TResult Function(AddingShowroom value)? addingShowroom,
    TResult Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult Function(ShowroomUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShowroomError implements ShowroomState {
  const factory ShowroomError(final String message) = _$ShowroomErrorImpl;

  String get message;

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowroomErrorImplCopyWith<_$ShowroomErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddingShowroomImplCopyWith<$Res> {
  factory _$$AddingShowroomImplCopyWith(_$AddingShowroomImpl value,
          $Res Function(_$AddingShowroomImpl) then) =
      __$$AddingShowroomImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddingShowroomImplCopyWithImpl<$Res>
    extends _$ShowroomStateCopyWithImpl<$Res, _$AddingShowroomImpl>
    implements _$$AddingShowroomImplCopyWith<$Res> {
  __$$AddingShowroomImplCopyWithImpl(
      _$AddingShowroomImpl _value, $Res Function(_$AddingShowroomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddingShowroomImpl implements AddingShowroom {
  const _$AddingShowroomImpl();

  @override
  String toString() {
    return 'ShowroomState.addingShowroom()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddingShowroomImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() addingShowroom,
    required TResult Function(String message) showroomAddedSuccess,
    required TResult Function() updated,
  }) {
    return addingShowroom();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? addingShowroom,
    TResult? Function(String message)? showroomAddedSuccess,
    TResult? Function()? updated,
  }) {
    return addingShowroom?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? addingShowroom,
    TResult Function(String message)? showroomAddedSuccess,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (addingShowroom != null) {
      return addingShowroom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowroomInitial value) initial,
    required TResult Function(ShowroomLoading value) loading,
    required TResult Function(ShowroomLoaded value) loaded,
    required TResult Function(ShowroomError value) error,
    required TResult Function(AddingShowroom value) addingShowroom,
    required TResult Function(ShowroomAddedSuccess value) showroomAddedSuccess,
    required TResult Function(ShowroomUpdated value) updated,
  }) {
    return addingShowroom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomInitial value)? initial,
    TResult? Function(ShowroomLoading value)? loading,
    TResult? Function(ShowroomLoaded value)? loaded,
    TResult? Function(ShowroomError value)? error,
    TResult? Function(AddingShowroom value)? addingShowroom,
    TResult? Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult? Function(ShowroomUpdated value)? updated,
  }) {
    return addingShowroom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomInitial value)? initial,
    TResult Function(ShowroomLoading value)? loading,
    TResult Function(ShowroomLoaded value)? loaded,
    TResult Function(ShowroomError value)? error,
    TResult Function(AddingShowroom value)? addingShowroom,
    TResult Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult Function(ShowroomUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (addingShowroom != null) {
      return addingShowroom(this);
    }
    return orElse();
  }
}

abstract class AddingShowroom implements ShowroomState {
  const factory AddingShowroom() = _$AddingShowroomImpl;
}

/// @nodoc
abstract class _$$ShowroomAddedSuccessImplCopyWith<$Res> {
  factory _$$ShowroomAddedSuccessImplCopyWith(_$ShowroomAddedSuccessImpl value,
          $Res Function(_$ShowroomAddedSuccessImpl) then) =
      __$$ShowroomAddedSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ShowroomAddedSuccessImplCopyWithImpl<$Res>
    extends _$ShowroomStateCopyWithImpl<$Res, _$ShowroomAddedSuccessImpl>
    implements _$$ShowroomAddedSuccessImplCopyWith<$Res> {
  __$$ShowroomAddedSuccessImplCopyWithImpl(_$ShowroomAddedSuccessImpl _value,
      $Res Function(_$ShowroomAddedSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ShowroomAddedSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowroomAddedSuccessImpl implements ShowroomAddedSuccess {
  const _$ShowroomAddedSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ShowroomState.showroomAddedSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowroomAddedSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowroomAddedSuccessImplCopyWith<_$ShowroomAddedSuccessImpl>
      get copyWith =>
          __$$ShowroomAddedSuccessImplCopyWithImpl<_$ShowroomAddedSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() addingShowroom,
    required TResult Function(String message) showroomAddedSuccess,
    required TResult Function() updated,
  }) {
    return showroomAddedSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? addingShowroom,
    TResult? Function(String message)? showroomAddedSuccess,
    TResult? Function()? updated,
  }) {
    return showroomAddedSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? addingShowroom,
    TResult Function(String message)? showroomAddedSuccess,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (showroomAddedSuccess != null) {
      return showroomAddedSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowroomInitial value) initial,
    required TResult Function(ShowroomLoading value) loading,
    required TResult Function(ShowroomLoaded value) loaded,
    required TResult Function(ShowroomError value) error,
    required TResult Function(AddingShowroom value) addingShowroom,
    required TResult Function(ShowroomAddedSuccess value) showroomAddedSuccess,
    required TResult Function(ShowroomUpdated value) updated,
  }) {
    return showroomAddedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomInitial value)? initial,
    TResult? Function(ShowroomLoading value)? loading,
    TResult? Function(ShowroomLoaded value)? loaded,
    TResult? Function(ShowroomError value)? error,
    TResult? Function(AddingShowroom value)? addingShowroom,
    TResult? Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult? Function(ShowroomUpdated value)? updated,
  }) {
    return showroomAddedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomInitial value)? initial,
    TResult Function(ShowroomLoading value)? loading,
    TResult Function(ShowroomLoaded value)? loaded,
    TResult Function(ShowroomError value)? error,
    TResult Function(AddingShowroom value)? addingShowroom,
    TResult Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult Function(ShowroomUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (showroomAddedSuccess != null) {
      return showroomAddedSuccess(this);
    }
    return orElse();
  }
}

abstract class ShowroomAddedSuccess implements ShowroomState {
  const factory ShowroomAddedSuccess(final String message) =
      _$ShowroomAddedSuccessImpl;

  String get message;

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowroomAddedSuccessImplCopyWith<_$ShowroomAddedSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowroomUpdatedImplCopyWith<$Res> {
  factory _$$ShowroomUpdatedImplCopyWith(_$ShowroomUpdatedImpl value,
          $Res Function(_$ShowroomUpdatedImpl) then) =
      __$$ShowroomUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowroomUpdatedImplCopyWithImpl<$Res>
    extends _$ShowroomStateCopyWithImpl<$Res, _$ShowroomUpdatedImpl>
    implements _$$ShowroomUpdatedImplCopyWith<$Res> {
  __$$ShowroomUpdatedImplCopyWithImpl(
      _$ShowroomUpdatedImpl _value, $Res Function(_$ShowroomUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShowroomState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ShowroomUpdatedImpl implements ShowroomUpdated {
  const _$ShowroomUpdatedImpl();

  @override
  String toString() {
    return 'ShowroomState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowroomUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() addingShowroom,
    required TResult Function(String message) showroomAddedSuccess,
    required TResult Function() updated,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? addingShowroom,
    TResult? Function(String message)? showroomAddedSuccess,
    TResult? Function()? updated,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<UserModel> showroomusers, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? addingShowroom,
    TResult Function(String message)? showroomAddedSuccess,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowroomInitial value) initial,
    required TResult Function(ShowroomLoading value) loading,
    required TResult Function(ShowroomLoaded value) loaded,
    required TResult Function(ShowroomError value) error,
    required TResult Function(AddingShowroom value) addingShowroom,
    required TResult Function(ShowroomAddedSuccess value) showroomAddedSuccess,
    required TResult Function(ShowroomUpdated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowroomInitial value)? initial,
    TResult? Function(ShowroomLoading value)? loading,
    TResult? Function(ShowroomLoaded value)? loaded,
    TResult? Function(ShowroomError value)? error,
    TResult? Function(AddingShowroom value)? addingShowroom,
    TResult? Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult? Function(ShowroomUpdated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowroomInitial value)? initial,
    TResult Function(ShowroomLoading value)? loading,
    TResult Function(ShowroomLoaded value)? loaded,
    TResult Function(ShowroomError value)? error,
    TResult Function(AddingShowroom value)? addingShowroom,
    TResult Function(ShowroomAddedSuccess value)? showroomAddedSuccess,
    TResult Function(ShowroomUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class ShowroomUpdated implements ShowroomState {
  const factory ShowroomUpdated() = _$ShowroomUpdatedImpl;
}
