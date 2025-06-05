// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllUsers,
    required TResult Function(UserModel userData) addUser,
    required TResult Function(String userId) deleteUser,
    required TResult Function(UserModel updatedUser) updateUser,
    required TResult Function() userListNavigation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllUsers,
    TResult? Function(UserModel userData)? addUser,
    TResult? Function(String userId)? deleteUser,
    TResult? Function(UserModel updatedUser)? updateUser,
    TResult? Function()? userListNavigation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)? fetchAllUsers,
    TResult Function(UserModel userData)? addUser,
    TResult Function(String userId)? deleteUser,
    TResult Function(UserModel updatedUser)? updateUser,
    TResult Function()? userListNavigation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllUsers value) fetchAllUsers,
    required TResult Function(AddUser value) addUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UserListNavigation value) userListNavigation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsers value)? fetchAllUsers,
    TResult? Function(AddUser value)? addUser,
    TResult? Function(DeleteUser value)? deleteUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UserListNavigation value)? userListNavigation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsers value)? fetchAllUsers,
    TResult Function(AddUser value)? addUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UserListNavigation value)? userListNavigation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
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
    extends _$UserEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UserEvent.started()';
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
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllUsers,
    required TResult Function(UserModel userData) addUser,
    required TResult Function(String userId) deleteUser,
    required TResult Function(UserModel updatedUser) updateUser,
    required TResult Function() userListNavigation,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllUsers,
    TResult? Function(UserModel userData)? addUser,
    TResult? Function(String userId)? deleteUser,
    TResult? Function(UserModel updatedUser)? updateUser,
    TResult? Function()? userListNavigation,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)? fetchAllUsers,
    TResult Function(UserModel userData)? addUser,
    TResult Function(String userId)? deleteUser,
    TResult Function(UserModel updatedUser)? updateUser,
    TResult Function()? userListNavigation,
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
    required TResult Function(FetchAllUsers value) fetchAllUsers,
    required TResult Function(AddUser value) addUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UserListNavigation value) userListNavigation,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsers value)? fetchAllUsers,
    TResult? Function(AddUser value)? addUser,
    TResult? Function(DeleteUser value)? deleteUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UserListNavigation value)? userListNavigation,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsers value)? fetchAllUsers,
    TResult Function(AddUser value)? addUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UserListNavigation value)? userListNavigation,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UserEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchAllUsersImplCopyWith<$Res> {
  factory _$$FetchAllUsersImplCopyWith(
          _$FetchAllUsersImpl value, $Res Function(_$FetchAllUsersImpl) then) =
      __$$FetchAllUsersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? page, int? limit, String? searchQuery});
}

/// @nodoc
class __$$FetchAllUsersImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$FetchAllUsersImpl>
    implements _$$FetchAllUsersImplCopyWith<$Res> {
  __$$FetchAllUsersImplCopyWithImpl(
      _$FetchAllUsersImpl _value, $Res Function(_$FetchAllUsersImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_$FetchAllUsersImpl(
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

class _$FetchAllUsersImpl implements FetchAllUsers {
  const _$FetchAllUsersImpl(
      {this.page = 1, this.limit = 10, this.searchQuery = ''});

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
    return 'UserEvent.fetchAllUsers(page: $page, limit: $limit, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllUsersImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, searchQuery);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllUsersImplCopyWith<_$FetchAllUsersImpl> get copyWith =>
      __$$FetchAllUsersImplCopyWithImpl<_$FetchAllUsersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllUsers,
    required TResult Function(UserModel userData) addUser,
    required TResult Function(String userId) deleteUser,
    required TResult Function(UserModel updatedUser) updateUser,
    required TResult Function() userListNavigation,
  }) {
    return fetchAllUsers(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllUsers,
    TResult? Function(UserModel userData)? addUser,
    TResult? Function(String userId)? deleteUser,
    TResult? Function(UserModel updatedUser)? updateUser,
    TResult? Function()? userListNavigation,
  }) {
    return fetchAllUsers?.call(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)? fetchAllUsers,
    TResult Function(UserModel userData)? addUser,
    TResult Function(String userId)? deleteUser,
    TResult Function(UserModel updatedUser)? updateUser,
    TResult Function()? userListNavigation,
    required TResult orElse(),
  }) {
    if (fetchAllUsers != null) {
      return fetchAllUsers(page, limit, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllUsers value) fetchAllUsers,
    required TResult Function(AddUser value) addUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UserListNavigation value) userListNavigation,
  }) {
    return fetchAllUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsers value)? fetchAllUsers,
    TResult? Function(AddUser value)? addUser,
    TResult? Function(DeleteUser value)? deleteUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UserListNavigation value)? userListNavigation,
  }) {
    return fetchAllUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsers value)? fetchAllUsers,
    TResult Function(AddUser value)? addUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UserListNavigation value)? userListNavigation,
    required TResult orElse(),
  }) {
    if (fetchAllUsers != null) {
      return fetchAllUsers(this);
    }
    return orElse();
  }
}

abstract class FetchAllUsers implements UserEvent {
  const factory FetchAllUsers(
      {final int? page,
      final int? limit,
      final String? searchQuery}) = _$FetchAllUsersImpl;

  int? get page;
  int? get limit;
  String? get searchQuery;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllUsersImplCopyWith<_$FetchAllUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddUserImplCopyWith<$Res> {
  factory _$$AddUserImplCopyWith(
          _$AddUserImpl value, $Res Function(_$AddUserImpl) then) =
      __$$AddUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel userData});
}

/// @nodoc
class __$$AddUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$AddUserImpl>
    implements _$$AddUserImplCopyWith<$Res> {
  __$$AddUserImplCopyWithImpl(
      _$AddUserImpl _value, $Res Function(_$AddUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = null,
  }) {
    return _then(_$AddUserImpl(
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$AddUserImpl implements AddUser {
  const _$AddUserImpl({required this.userData});

  @override
  final UserModel userData;

  @override
  String toString() {
    return 'UserEvent.addUser(userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddUserImpl &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userData);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddUserImplCopyWith<_$AddUserImpl> get copyWith =>
      __$$AddUserImplCopyWithImpl<_$AddUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllUsers,
    required TResult Function(UserModel userData) addUser,
    required TResult Function(String userId) deleteUser,
    required TResult Function(UserModel updatedUser) updateUser,
    required TResult Function() userListNavigation,
  }) {
    return addUser(userData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllUsers,
    TResult? Function(UserModel userData)? addUser,
    TResult? Function(String userId)? deleteUser,
    TResult? Function(UserModel updatedUser)? updateUser,
    TResult? Function()? userListNavigation,
  }) {
    return addUser?.call(userData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)? fetchAllUsers,
    TResult Function(UserModel userData)? addUser,
    TResult Function(String userId)? deleteUser,
    TResult Function(UserModel updatedUser)? updateUser,
    TResult Function()? userListNavigation,
    required TResult orElse(),
  }) {
    if (addUser != null) {
      return addUser(userData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllUsers value) fetchAllUsers,
    required TResult Function(AddUser value) addUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UserListNavigation value) userListNavigation,
  }) {
    return addUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsers value)? fetchAllUsers,
    TResult? Function(AddUser value)? addUser,
    TResult? Function(DeleteUser value)? deleteUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UserListNavigation value)? userListNavigation,
  }) {
    return addUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsers value)? fetchAllUsers,
    TResult Function(AddUser value)? addUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UserListNavigation value)? userListNavigation,
    required TResult orElse(),
  }) {
    if (addUser != null) {
      return addUser(this);
    }
    return orElse();
  }
}

abstract class AddUser implements UserEvent {
  const factory AddUser({required final UserModel userData}) = _$AddUserImpl;

  UserModel get userData;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddUserImplCopyWith<_$AddUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteUserImplCopyWith<$Res> {
  factory _$$DeleteUserImplCopyWith(
          _$DeleteUserImpl value, $Res Function(_$DeleteUserImpl) then) =
      __$$DeleteUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$DeleteUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$DeleteUserImpl>
    implements _$$DeleteUserImplCopyWith<$Res> {
  __$$DeleteUserImplCopyWithImpl(
      _$DeleteUserImpl _value, $Res Function(_$DeleteUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$DeleteUserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteUserImpl implements DeleteUser {
  const _$DeleteUserImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'UserEvent.deleteUser(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteUserImplCopyWith<_$DeleteUserImpl> get copyWith =>
      __$$DeleteUserImplCopyWithImpl<_$DeleteUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllUsers,
    required TResult Function(UserModel userData) addUser,
    required TResult Function(String userId) deleteUser,
    required TResult Function(UserModel updatedUser) updateUser,
    required TResult Function() userListNavigation,
  }) {
    return deleteUser(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllUsers,
    TResult? Function(UserModel userData)? addUser,
    TResult? Function(String userId)? deleteUser,
    TResult? Function(UserModel updatedUser)? updateUser,
    TResult? Function()? userListNavigation,
  }) {
    return deleteUser?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)? fetchAllUsers,
    TResult Function(UserModel userData)? addUser,
    TResult Function(String userId)? deleteUser,
    TResult Function(UserModel updatedUser)? updateUser,
    TResult Function()? userListNavigation,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllUsers value) fetchAllUsers,
    required TResult Function(AddUser value) addUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UserListNavigation value) userListNavigation,
  }) {
    return deleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsers value)? fetchAllUsers,
    TResult? Function(AddUser value)? addUser,
    TResult? Function(DeleteUser value)? deleteUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UserListNavigation value)? userListNavigation,
  }) {
    return deleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsers value)? fetchAllUsers,
    TResult Function(AddUser value)? addUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UserListNavigation value)? userListNavigation,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(this);
    }
    return orElse();
  }
}

abstract class DeleteUser implements UserEvent {
  const factory DeleteUser({required final String userId}) = _$DeleteUserImpl;

  String get userId;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteUserImplCopyWith<_$DeleteUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserImplCopyWith<$Res> {
  factory _$$UpdateUserImplCopyWith(
          _$UpdateUserImpl value, $Res Function(_$UpdateUserImpl) then) =
      __$$UpdateUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel updatedUser});
}

/// @nodoc
class __$$UpdateUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserImpl>
    implements _$$UpdateUserImplCopyWith<$Res> {
  __$$UpdateUserImplCopyWithImpl(
      _$UpdateUserImpl _value, $Res Function(_$UpdateUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedUser = null,
  }) {
    return _then(_$UpdateUserImpl(
      updatedUser: null == updatedUser
          ? _value.updatedUser
          : updatedUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$UpdateUserImpl implements UpdateUser {
  const _$UpdateUserImpl({required this.updatedUser});

  @override
  final UserModel updatedUser;

  @override
  String toString() {
    return 'UserEvent.updateUser(updatedUser: $updatedUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserImpl &&
            (identical(other.updatedUser, updatedUser) ||
                other.updatedUser == updatedUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updatedUser);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      __$$UpdateUserImplCopyWithImpl<_$UpdateUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllUsers,
    required TResult Function(UserModel userData) addUser,
    required TResult Function(String userId) deleteUser,
    required TResult Function(UserModel updatedUser) updateUser,
    required TResult Function() userListNavigation,
  }) {
    return updateUser(updatedUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllUsers,
    TResult? Function(UserModel userData)? addUser,
    TResult? Function(String userId)? deleteUser,
    TResult? Function(UserModel updatedUser)? updateUser,
    TResult? Function()? userListNavigation,
  }) {
    return updateUser?.call(updatedUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)? fetchAllUsers,
    TResult Function(UserModel userData)? addUser,
    TResult Function(String userId)? deleteUser,
    TResult Function(UserModel updatedUser)? updateUser,
    TResult Function()? userListNavigation,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(updatedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllUsers value) fetchAllUsers,
    required TResult Function(AddUser value) addUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UserListNavigation value) userListNavigation,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsers value)? fetchAllUsers,
    TResult? Function(AddUser value)? addUser,
    TResult? Function(DeleteUser value)? deleteUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UserListNavigation value)? userListNavigation,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsers value)? fetchAllUsers,
    TResult Function(AddUser value)? addUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UserListNavigation value)? userListNavigation,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class UpdateUser implements UserEvent {
  const factory UpdateUser({required final UserModel updatedUser}) =
      _$UpdateUserImpl;

  UserModel get updatedUser;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserListNavigationImplCopyWith<$Res> {
  factory _$$UserListNavigationImplCopyWith(_$UserListNavigationImpl value,
          $Res Function(_$UserListNavigationImpl) then) =
      __$$UserListNavigationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserListNavigationImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserListNavigationImpl>
    implements _$$UserListNavigationImplCopyWith<$Res> {
  __$$UserListNavigationImplCopyWithImpl(_$UserListNavigationImpl _value,
      $Res Function(_$UserListNavigationImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserListNavigationImpl implements UserListNavigation {
  const _$UserListNavigationImpl();

  @override
  String toString() {
    return 'UserEvent.userListNavigation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserListNavigationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllUsers,
    required TResult Function(UserModel userData) addUser,
    required TResult Function(String userId) deleteUser,
    required TResult Function(UserModel updatedUser) updateUser,
    required TResult Function() userListNavigation,
  }) {
    return userListNavigation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllUsers,
    TResult? Function(UserModel userData)? addUser,
    TResult? Function(String userId)? deleteUser,
    TResult? Function(UserModel updatedUser)? updateUser,
    TResult? Function()? userListNavigation,
  }) {
    return userListNavigation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)? fetchAllUsers,
    TResult Function(UserModel userData)? addUser,
    TResult Function(String userId)? deleteUser,
    TResult Function(UserModel updatedUser)? updateUser,
    TResult Function()? userListNavigation,
    required TResult orElse(),
  }) {
    if (userListNavigation != null) {
      return userListNavigation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllUsers value) fetchAllUsers,
    required TResult Function(AddUser value) addUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UserListNavigation value) userListNavigation,
  }) {
    return userListNavigation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsers value)? fetchAllUsers,
    TResult? Function(AddUser value)? addUser,
    TResult? Function(DeleteUser value)? deleteUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UserListNavigation value)? userListNavigation,
  }) {
    return userListNavigation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsers value)? fetchAllUsers,
    TResult Function(AddUser value)? addUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UserListNavigation value)? userListNavigation,
    required TResult orElse(),
  }) {
    if (userListNavigation != null) {
      return userListNavigation(this);
    }
    return orElse();
  }
}

abstract class UserListNavigation implements UserEvent {
  const factory UserListNavigation() = _$UserListNavigationImpl;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> users, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
    required TResult Function(String message) userAddedSuccess,
    required TResult Function(String message) error,
    required TResult Function() userListNavigated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
    TResult? Function(String message)? userAddedSuccess,
    TResult? Function(String message)? error,
    TResult? Function()? userListNavigated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    TResult Function(String message)? userAddedSuccess,
    TResult Function(String message)? error,
    TResult Function()? userListNavigated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoading value) loading,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserUpdated value) updated,
    required TResult Function(UserAddedSuccess value) userAddedSuccess,
    required TResult Function(UserError value) error,
    required TResult Function(UserListNavigated value) userListNavigated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitial value)? initial,
    TResult? Function(UserLoading value)? loading,
    TResult? Function(UserLoaded value)? loaded,
    TResult? Function(UserUpdated value)? updated,
    TResult? Function(UserAddedSuccess value)? userAddedSuccess,
    TResult? Function(UserError value)? error,
    TResult? Function(UserListNavigated value)? userListNavigated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoading value)? loading,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserUpdated value)? updated,
    TResult Function(UserAddedSuccess value)? userAddedSuccess,
    TResult Function(UserError value)? error,
    TResult Function(UserListNavigated value)? userListNavigated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserInitialImplCopyWith<$Res> {
  factory _$$UserInitialImplCopyWith(
          _$UserInitialImpl value, $Res Function(_$UserInitialImpl) then) =
      __$$UserInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserInitialImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserInitialImpl>
    implements _$$UserInitialImplCopyWith<$Res> {
  __$$UserInitialImplCopyWithImpl(
      _$UserInitialImpl _value, $Res Function(_$UserInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserInitialImpl implements UserInitial {
  const _$UserInitialImpl();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> users, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
    required TResult Function(String message) userAddedSuccess,
    required TResult Function(String message) error,
    required TResult Function() userListNavigated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
    TResult? Function(String message)? userAddedSuccess,
    TResult? Function(String message)? error,
    TResult? Function()? userListNavigated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    TResult Function(String message)? userAddedSuccess,
    TResult Function(String message)? error,
    TResult Function()? userListNavigated,
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
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoading value) loading,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserUpdated value) updated,
    required TResult Function(UserAddedSuccess value) userAddedSuccess,
    required TResult Function(UserError value) error,
    required TResult Function(UserListNavigated value) userListNavigated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitial value)? initial,
    TResult? Function(UserLoading value)? loading,
    TResult? Function(UserLoaded value)? loaded,
    TResult? Function(UserUpdated value)? updated,
    TResult? Function(UserAddedSuccess value)? userAddedSuccess,
    TResult? Function(UserError value)? error,
    TResult? Function(UserListNavigated value)? userListNavigated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoading value)? loading,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserUpdated value)? updated,
    TResult Function(UserAddedSuccess value)? userAddedSuccess,
    TResult Function(UserError value)? error,
    TResult Function(UserListNavigated value)? userListNavigated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UserInitial implements UserState {
  const factory UserInitial() = _$UserInitialImpl;
}

/// @nodoc
abstract class _$$UserLoadingImplCopyWith<$Res> {
  factory _$$UserLoadingImplCopyWith(
          _$UserLoadingImpl value, $Res Function(_$UserLoadingImpl) then) =
      __$$UserLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLoadingImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserLoadingImpl>
    implements _$$UserLoadingImplCopyWith<$Res> {
  __$$UserLoadingImplCopyWithImpl(
      _$UserLoadingImpl _value, $Res Function(_$UserLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserLoadingImpl implements UserLoading {
  const _$UserLoadingImpl();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> users, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
    required TResult Function(String message) userAddedSuccess,
    required TResult Function(String message) error,
    required TResult Function() userListNavigated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
    TResult? Function(String message)? userAddedSuccess,
    TResult? Function(String message)? error,
    TResult? Function()? userListNavigated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    TResult Function(String message)? userAddedSuccess,
    TResult Function(String message)? error,
    TResult Function()? userListNavigated,
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
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoading value) loading,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserUpdated value) updated,
    required TResult Function(UserAddedSuccess value) userAddedSuccess,
    required TResult Function(UserError value) error,
    required TResult Function(UserListNavigated value) userListNavigated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitial value)? initial,
    TResult? Function(UserLoading value)? loading,
    TResult? Function(UserLoaded value)? loaded,
    TResult? Function(UserUpdated value)? updated,
    TResult? Function(UserAddedSuccess value)? userAddedSuccess,
    TResult? Function(UserError value)? error,
    TResult? Function(UserListNavigated value)? userListNavigated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoading value)? loading,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserUpdated value)? updated,
    TResult Function(UserAddedSuccess value)? userAddedSuccess,
    TResult Function(UserError value)? error,
    TResult Function(UserListNavigated value)? userListNavigated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserLoading implements UserState {
  const factory UserLoading() = _$UserLoadingImpl;
}

/// @nodoc
abstract class _$$UserLoadedImplCopyWith<$Res> {
  factory _$$UserLoadedImplCopyWith(
          _$UserLoadedImpl value, $Res Function(_$UserLoadedImpl) then) =
      __$$UserLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserModel> users, int totalPages, int currentPage});
}

/// @nodoc
class __$$UserLoadedImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserLoadedImpl>
    implements _$$UserLoadedImplCopyWith<$Res> {
  __$$UserLoadedImplCopyWithImpl(
      _$UserLoadedImpl _value, $Res Function(_$UserLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(_$UserLoadedImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
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

class _$UserLoadedImpl implements UserLoaded {
  const _$UserLoadedImpl(
      {required final List<UserModel> users,
      required this.totalPages,
      required this.currentPage})
      : _users = users;

  final List<UserModel> _users;
  @override
  List<UserModel> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final int totalPages;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'UserState.loaded(users: $users, totalPages: $totalPages, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoadedImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_users), totalPages, currentPage);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoadedImplCopyWith<_$UserLoadedImpl> get copyWith =>
      __$$UserLoadedImplCopyWithImpl<_$UserLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> users, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
    required TResult Function(String message) userAddedSuccess,
    required TResult Function(String message) error,
    required TResult Function() userListNavigated,
  }) {
    return loaded(users, totalPages, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
    TResult? Function(String message)? userAddedSuccess,
    TResult? Function(String message)? error,
    TResult? Function()? userListNavigated,
  }) {
    return loaded?.call(users, totalPages, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    TResult Function(String message)? userAddedSuccess,
    TResult Function(String message)? error,
    TResult Function()? userListNavigated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(users, totalPages, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoading value) loading,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserUpdated value) updated,
    required TResult Function(UserAddedSuccess value) userAddedSuccess,
    required TResult Function(UserError value) error,
    required TResult Function(UserListNavigated value) userListNavigated,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitial value)? initial,
    TResult? Function(UserLoading value)? loading,
    TResult? Function(UserLoaded value)? loaded,
    TResult? Function(UserUpdated value)? updated,
    TResult? Function(UserAddedSuccess value)? userAddedSuccess,
    TResult? Function(UserError value)? error,
    TResult? Function(UserListNavigated value)? userListNavigated,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoading value)? loading,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserUpdated value)? updated,
    TResult Function(UserAddedSuccess value)? userAddedSuccess,
    TResult Function(UserError value)? error,
    TResult Function(UserListNavigated value)? userListNavigated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UserLoaded implements UserState {
  const factory UserLoaded(
      {required final List<UserModel> users,
      required final int totalPages,
      required final int currentPage}) = _$UserLoadedImpl;

  List<UserModel> get users;
  int get totalPages;
  int get currentPage;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserLoadedImplCopyWith<_$UserLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserUpdatedImplCopyWith<$Res> {
  factory _$$UserUpdatedImplCopyWith(
          _$UserUpdatedImpl value, $Res Function(_$UserUpdatedImpl) then) =
      __$$UserUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserUpdatedImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserUpdatedImpl>
    implements _$$UserUpdatedImplCopyWith<$Res> {
  __$$UserUpdatedImplCopyWithImpl(
      _$UserUpdatedImpl _value, $Res Function(_$UserUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserUpdatedImpl implements UserUpdated {
  const _$UserUpdatedImpl();

  @override
  String toString() {
    return 'UserState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> users, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
    required TResult Function(String message) userAddedSuccess,
    required TResult Function(String message) error,
    required TResult Function() userListNavigated,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
    TResult? Function(String message)? userAddedSuccess,
    TResult? Function(String message)? error,
    TResult? Function()? userListNavigated,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    TResult Function(String message)? userAddedSuccess,
    TResult Function(String message)? error,
    TResult Function()? userListNavigated,
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
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoading value) loading,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserUpdated value) updated,
    required TResult Function(UserAddedSuccess value) userAddedSuccess,
    required TResult Function(UserError value) error,
    required TResult Function(UserListNavigated value) userListNavigated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitial value)? initial,
    TResult? Function(UserLoading value)? loading,
    TResult? Function(UserLoaded value)? loaded,
    TResult? Function(UserUpdated value)? updated,
    TResult? Function(UserAddedSuccess value)? userAddedSuccess,
    TResult? Function(UserError value)? error,
    TResult? Function(UserListNavigated value)? userListNavigated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoading value)? loading,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserUpdated value)? updated,
    TResult Function(UserAddedSuccess value)? userAddedSuccess,
    TResult Function(UserError value)? error,
    TResult Function(UserListNavigated value)? userListNavigated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class UserUpdated implements UserState {
  const factory UserUpdated() = _$UserUpdatedImpl;
}

/// @nodoc
abstract class _$$UserAddedSuccessImplCopyWith<$Res> {
  factory _$$UserAddedSuccessImplCopyWith(_$UserAddedSuccessImpl value,
          $Res Function(_$UserAddedSuccessImpl) then) =
      __$$UserAddedSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UserAddedSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserAddedSuccessImpl>
    implements _$$UserAddedSuccessImplCopyWith<$Res> {
  __$$UserAddedSuccessImplCopyWithImpl(_$UserAddedSuccessImpl _value,
      $Res Function(_$UserAddedSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UserAddedSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserAddedSuccessImpl implements UserAddedSuccess {
  const _$UserAddedSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.userAddedSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAddedSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAddedSuccessImplCopyWith<_$UserAddedSuccessImpl> get copyWith =>
      __$$UserAddedSuccessImplCopyWithImpl<_$UserAddedSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> users, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
    required TResult Function(String message) userAddedSuccess,
    required TResult Function(String message) error,
    required TResult Function() userListNavigated,
  }) {
    return userAddedSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
    TResult? Function(String message)? userAddedSuccess,
    TResult? Function(String message)? error,
    TResult? Function()? userListNavigated,
  }) {
    return userAddedSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    TResult Function(String message)? userAddedSuccess,
    TResult Function(String message)? error,
    TResult Function()? userListNavigated,
    required TResult orElse(),
  }) {
    if (userAddedSuccess != null) {
      return userAddedSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoading value) loading,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserUpdated value) updated,
    required TResult Function(UserAddedSuccess value) userAddedSuccess,
    required TResult Function(UserError value) error,
    required TResult Function(UserListNavigated value) userListNavigated,
  }) {
    return userAddedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitial value)? initial,
    TResult? Function(UserLoading value)? loading,
    TResult? Function(UserLoaded value)? loaded,
    TResult? Function(UserUpdated value)? updated,
    TResult? Function(UserAddedSuccess value)? userAddedSuccess,
    TResult? Function(UserError value)? error,
    TResult? Function(UserListNavigated value)? userListNavigated,
  }) {
    return userAddedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoading value)? loading,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserUpdated value)? updated,
    TResult Function(UserAddedSuccess value)? userAddedSuccess,
    TResult Function(UserError value)? error,
    TResult Function(UserListNavigated value)? userListNavigated,
    required TResult orElse(),
  }) {
    if (userAddedSuccess != null) {
      return userAddedSuccess(this);
    }
    return orElse();
  }
}

abstract class UserAddedSuccess implements UserState {
  const factory UserAddedSuccess(final String message) = _$UserAddedSuccessImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAddedSuccessImplCopyWith<_$UserAddedSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserErrorImplCopyWith<$Res> {
  factory _$$UserErrorImplCopyWith(
          _$UserErrorImpl value, $Res Function(_$UserErrorImpl) then) =
      __$$UserErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UserErrorImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserErrorImpl>
    implements _$$UserErrorImplCopyWith<$Res> {
  __$$UserErrorImplCopyWithImpl(
      _$UserErrorImpl _value, $Res Function(_$UserErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UserErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserErrorImpl implements UserError {
  const _$UserErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserErrorImplCopyWith<_$UserErrorImpl> get copyWith =>
      __$$UserErrorImplCopyWithImpl<_$UserErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> users, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
    required TResult Function(String message) userAddedSuccess,
    required TResult Function(String message) error,
    required TResult Function() userListNavigated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
    TResult? Function(String message)? userAddedSuccess,
    TResult? Function(String message)? error,
    TResult? Function()? userListNavigated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    TResult Function(String message)? userAddedSuccess,
    TResult Function(String message)? error,
    TResult Function()? userListNavigated,
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
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoading value) loading,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserUpdated value) updated,
    required TResult Function(UserAddedSuccess value) userAddedSuccess,
    required TResult Function(UserError value) error,
    required TResult Function(UserListNavigated value) userListNavigated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitial value)? initial,
    TResult? Function(UserLoading value)? loading,
    TResult? Function(UserLoaded value)? loaded,
    TResult? Function(UserUpdated value)? updated,
    TResult? Function(UserAddedSuccess value)? userAddedSuccess,
    TResult? Function(UserError value)? error,
    TResult? Function(UserListNavigated value)? userListNavigated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoading value)? loading,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserUpdated value)? updated,
    TResult Function(UserAddedSuccess value)? userAddedSuccess,
    TResult Function(UserError value)? error,
    TResult Function(UserListNavigated value)? userListNavigated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UserError implements UserState {
  const factory UserError(final String message) = _$UserErrorImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserErrorImplCopyWith<_$UserErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserListNavigatedImplCopyWith<$Res> {
  factory _$$UserListNavigatedImplCopyWith(_$UserListNavigatedImpl value,
          $Res Function(_$UserListNavigatedImpl) then) =
      __$$UserListNavigatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserListNavigatedImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserListNavigatedImpl>
    implements _$$UserListNavigatedImplCopyWith<$Res> {
  __$$UserListNavigatedImplCopyWithImpl(_$UserListNavigatedImpl _value,
      $Res Function(_$UserListNavigatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserListNavigatedImpl implements UserListNavigated {
  const _$UserListNavigatedImpl();

  @override
  String toString() {
    return 'UserState.userListNavigated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserListNavigatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<UserModel> users, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
    required TResult Function(String message) userAddedSuccess,
    required TResult Function(String message) error,
    required TResult Function() userListNavigated,
  }) {
    return userListNavigated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
    TResult? Function(String message)? userAddedSuccess,
    TResult? Function(String message)? error,
    TResult? Function()? userListNavigated,
  }) {
    return userListNavigated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    TResult Function(String message)? userAddedSuccess,
    TResult Function(String message)? error,
    TResult Function()? userListNavigated,
    required TResult orElse(),
  }) {
    if (userListNavigated != null) {
      return userListNavigated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitial value) initial,
    required TResult Function(UserLoading value) loading,
    required TResult Function(UserLoaded value) loaded,
    required TResult Function(UserUpdated value) updated,
    required TResult Function(UserAddedSuccess value) userAddedSuccess,
    required TResult Function(UserError value) error,
    required TResult Function(UserListNavigated value) userListNavigated,
  }) {
    return userListNavigated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitial value)? initial,
    TResult? Function(UserLoading value)? loading,
    TResult? Function(UserLoaded value)? loaded,
    TResult? Function(UserUpdated value)? updated,
    TResult? Function(UserAddedSuccess value)? userAddedSuccess,
    TResult? Function(UserError value)? error,
    TResult? Function(UserListNavigated value)? userListNavigated,
  }) {
    return userListNavigated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitial value)? initial,
    TResult Function(UserLoading value)? loading,
    TResult Function(UserLoaded value)? loaded,
    TResult Function(UserUpdated value)? updated,
    TResult Function(UserAddedSuccess value)? userAddedSuccess,
    TResult Function(UserError value)? error,
    TResult Function(UserListNavigated value)? userListNavigated,
    required TResult orElse(),
  }) {
    if (userListNavigated != null) {
      return userListNavigated(this);
    }
    return orElse();
  }
}

abstract class UserListNavigated implements UserState {
  const factory UserListNavigated() = _$UserListNavigatedImpl;
}
