// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VehicleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllVehicles,
    required TResult Function(VehicleRequest vehicleData) addVehicle,
    required TResult Function(VehicleRequest updatedVehicle)
        updateVehicleCompany,
    required TResult Function(String vehicleId) deleteVehicle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult? Function(VehicleRequest vehicleData)? addVehicle,
    TResult? Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult? Function(String vehicleId)? deleteVehicle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult Function(VehicleRequest vehicleData)? addVehicle,
    TResult Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult Function(String vehicleId)? deleteVehicle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllVehicles value) fetchAllVehicles,
    required TResult Function(AddVehicle value) addVehicle,
    required TResult Function(UpdateVehicle value) updateVehicleCompany,
    required TResult Function(DeleteVehicle value) deleteVehicle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult? Function(AddVehicle value)? addVehicle,
    TResult? Function(UpdateVehicle value)? updateVehicleCompany,
    TResult? Function(DeleteVehicle value)? deleteVehicle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult Function(AddVehicle value)? addVehicle,
    TResult Function(UpdateVehicle value)? updateVehicleCompany,
    TResult Function(DeleteVehicle value)? deleteVehicle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleEventCopyWith<$Res> {
  factory $VehicleEventCopyWith(
          VehicleEvent value, $Res Function(VehicleEvent) then) =
      _$VehicleEventCopyWithImpl<$Res, VehicleEvent>;
}

/// @nodoc
class _$VehicleEventCopyWithImpl<$Res, $Val extends VehicleEvent>
    implements $VehicleEventCopyWith<$Res> {
  _$VehicleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleEvent
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
    extends _$VehicleEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'VehicleEvent.started()';
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
        fetchAllVehicles,
    required TResult Function(VehicleRequest vehicleData) addVehicle,
    required TResult Function(VehicleRequest updatedVehicle)
        updateVehicleCompany,
    required TResult Function(String vehicleId) deleteVehicle,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult? Function(VehicleRequest vehicleData)? addVehicle,
    TResult? Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult? Function(String vehicleId)? deleteVehicle,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult Function(VehicleRequest vehicleData)? addVehicle,
    TResult Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult Function(String vehicleId)? deleteVehicle,
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
    required TResult Function(FetchAllVehicles value) fetchAllVehicles,
    required TResult Function(AddVehicle value) addVehicle,
    required TResult Function(UpdateVehicle value) updateVehicleCompany,
    required TResult Function(DeleteVehicle value) deleteVehicle,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult? Function(AddVehicle value)? addVehicle,
    TResult? Function(UpdateVehicle value)? updateVehicleCompany,
    TResult? Function(DeleteVehicle value)? deleteVehicle,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult Function(AddVehicle value)? addVehicle,
    TResult Function(UpdateVehicle value)? updateVehicleCompany,
    TResult Function(DeleteVehicle value)? deleteVehicle,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VehicleEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchAllVehiclesImplCopyWith<$Res> {
  factory _$$FetchAllVehiclesImplCopyWith(_$FetchAllVehiclesImpl value,
          $Res Function(_$FetchAllVehiclesImpl) then) =
      __$$FetchAllVehiclesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? page, int? limit, String? searchQuery});
}

/// @nodoc
class __$$FetchAllVehiclesImplCopyWithImpl<$Res>
    extends _$VehicleEventCopyWithImpl<$Res, _$FetchAllVehiclesImpl>
    implements _$$FetchAllVehiclesImplCopyWith<$Res> {
  __$$FetchAllVehiclesImplCopyWithImpl(_$FetchAllVehiclesImpl _value,
      $Res Function(_$FetchAllVehiclesImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_$FetchAllVehiclesImpl(
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

class _$FetchAllVehiclesImpl implements FetchAllVehicles {
  const _$FetchAllVehiclesImpl(
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
    return 'VehicleEvent.fetchAllVehicles(page: $page, limit: $limit, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllVehiclesImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, searchQuery);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllVehiclesImplCopyWith<_$FetchAllVehiclesImpl> get copyWith =>
      __$$FetchAllVehiclesImplCopyWithImpl<_$FetchAllVehiclesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllVehicles,
    required TResult Function(VehicleRequest vehicleData) addVehicle,
    required TResult Function(VehicleRequest updatedVehicle)
        updateVehicleCompany,
    required TResult Function(String vehicleId) deleteVehicle,
  }) {
    return fetchAllVehicles(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult? Function(VehicleRequest vehicleData)? addVehicle,
    TResult? Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult? Function(String vehicleId)? deleteVehicle,
  }) {
    return fetchAllVehicles?.call(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult Function(VehicleRequest vehicleData)? addVehicle,
    TResult Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult Function(String vehicleId)? deleteVehicle,
    required TResult orElse(),
  }) {
    if (fetchAllVehicles != null) {
      return fetchAllVehicles(page, limit, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllVehicles value) fetchAllVehicles,
    required TResult Function(AddVehicle value) addVehicle,
    required TResult Function(UpdateVehicle value) updateVehicleCompany,
    required TResult Function(DeleteVehicle value) deleteVehicle,
  }) {
    return fetchAllVehicles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult? Function(AddVehicle value)? addVehicle,
    TResult? Function(UpdateVehicle value)? updateVehicleCompany,
    TResult? Function(DeleteVehicle value)? deleteVehicle,
  }) {
    return fetchAllVehicles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult Function(AddVehicle value)? addVehicle,
    TResult Function(UpdateVehicle value)? updateVehicleCompany,
    TResult Function(DeleteVehicle value)? deleteVehicle,
    required TResult orElse(),
  }) {
    if (fetchAllVehicles != null) {
      return fetchAllVehicles(this);
    }
    return orElse();
  }
}

abstract class FetchAllVehicles implements VehicleEvent {
  const factory FetchAllVehicles(
      {final int? page,
      final int? limit,
      final String? searchQuery}) = _$FetchAllVehiclesImpl;

  int? get page;
  int? get limit;
  String? get searchQuery;

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllVehiclesImplCopyWith<_$FetchAllVehiclesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddVehicleImplCopyWith<$Res> {
  factory _$$AddVehicleImplCopyWith(
          _$AddVehicleImpl value, $Res Function(_$AddVehicleImpl) then) =
      __$$AddVehicleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleRequest vehicleData});
}

/// @nodoc
class __$$AddVehicleImplCopyWithImpl<$Res>
    extends _$VehicleEventCopyWithImpl<$Res, _$AddVehicleImpl>
    implements _$$AddVehicleImplCopyWith<$Res> {
  __$$AddVehicleImplCopyWithImpl(
      _$AddVehicleImpl _value, $Res Function(_$AddVehicleImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleData = null,
  }) {
    return _then(_$AddVehicleImpl(
      vehicleData: null == vehicleData
          ? _value.vehicleData
          : vehicleData // ignore: cast_nullable_to_non_nullable
              as VehicleRequest,
    ));
  }
}

/// @nodoc

class _$AddVehicleImpl implements AddVehicle {
  const _$AddVehicleImpl({required this.vehicleData});

  @override
  final VehicleRequest vehicleData;

  @override
  String toString() {
    return 'VehicleEvent.addVehicle(vehicleData: $vehicleData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddVehicleImpl &&
            (identical(other.vehicleData, vehicleData) ||
                other.vehicleData == vehicleData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleData);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddVehicleImplCopyWith<_$AddVehicleImpl> get copyWith =>
      __$$AddVehicleImplCopyWithImpl<_$AddVehicleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllVehicles,
    required TResult Function(VehicleRequest vehicleData) addVehicle,
    required TResult Function(VehicleRequest updatedVehicle)
        updateVehicleCompany,
    required TResult Function(String vehicleId) deleteVehicle,
  }) {
    return addVehicle(vehicleData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult? Function(VehicleRequest vehicleData)? addVehicle,
    TResult? Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult? Function(String vehicleId)? deleteVehicle,
  }) {
    return addVehicle?.call(vehicleData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult Function(VehicleRequest vehicleData)? addVehicle,
    TResult Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult Function(String vehicleId)? deleteVehicle,
    required TResult orElse(),
  }) {
    if (addVehicle != null) {
      return addVehicle(vehicleData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllVehicles value) fetchAllVehicles,
    required TResult Function(AddVehicle value) addVehicle,
    required TResult Function(UpdateVehicle value) updateVehicleCompany,
    required TResult Function(DeleteVehicle value) deleteVehicle,
  }) {
    return addVehicle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult? Function(AddVehicle value)? addVehicle,
    TResult? Function(UpdateVehicle value)? updateVehicleCompany,
    TResult? Function(DeleteVehicle value)? deleteVehicle,
  }) {
    return addVehicle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult Function(AddVehicle value)? addVehicle,
    TResult Function(UpdateVehicle value)? updateVehicleCompany,
    TResult Function(DeleteVehicle value)? deleteVehicle,
    required TResult orElse(),
  }) {
    if (addVehicle != null) {
      return addVehicle(this);
    }
    return orElse();
  }
}

abstract class AddVehicle implements VehicleEvent {
  const factory AddVehicle({required final VehicleRequest vehicleData}) =
      _$AddVehicleImpl;

  VehicleRequest get vehicleData;

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddVehicleImplCopyWith<_$AddVehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateVehicleImplCopyWith<$Res> {
  factory _$$UpdateVehicleImplCopyWith(
          _$UpdateVehicleImpl value, $Res Function(_$UpdateVehicleImpl) then) =
      __$$UpdateVehicleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleRequest updatedVehicle});
}

/// @nodoc
class __$$UpdateVehicleImplCopyWithImpl<$Res>
    extends _$VehicleEventCopyWithImpl<$Res, _$UpdateVehicleImpl>
    implements _$$UpdateVehicleImplCopyWith<$Res> {
  __$$UpdateVehicleImplCopyWithImpl(
      _$UpdateVehicleImpl _value, $Res Function(_$UpdateVehicleImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedVehicle = null,
  }) {
    return _then(_$UpdateVehicleImpl(
      updatedVehicle: null == updatedVehicle
          ? _value.updatedVehicle
          : updatedVehicle // ignore: cast_nullable_to_non_nullable
              as VehicleRequest,
    ));
  }
}

/// @nodoc

class _$UpdateVehicleImpl implements UpdateVehicle {
  const _$UpdateVehicleImpl({required this.updatedVehicle});

  @override
  final VehicleRequest updatedVehicle;

  @override
  String toString() {
    return 'VehicleEvent.updateVehicleCompany(updatedVehicle: $updatedVehicle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateVehicleImpl &&
            (identical(other.updatedVehicle, updatedVehicle) ||
                other.updatedVehicle == updatedVehicle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updatedVehicle);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateVehicleImplCopyWith<_$UpdateVehicleImpl> get copyWith =>
      __$$UpdateVehicleImplCopyWithImpl<_$UpdateVehicleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllVehicles,
    required TResult Function(VehicleRequest vehicleData) addVehicle,
    required TResult Function(VehicleRequest updatedVehicle)
        updateVehicleCompany,
    required TResult Function(String vehicleId) deleteVehicle,
  }) {
    return updateVehicleCompany(updatedVehicle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult? Function(VehicleRequest vehicleData)? addVehicle,
    TResult? Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult? Function(String vehicleId)? deleteVehicle,
  }) {
    return updateVehicleCompany?.call(updatedVehicle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult Function(VehicleRequest vehicleData)? addVehicle,
    TResult Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult Function(String vehicleId)? deleteVehicle,
    required TResult orElse(),
  }) {
    if (updateVehicleCompany != null) {
      return updateVehicleCompany(updatedVehicle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllVehicles value) fetchAllVehicles,
    required TResult Function(AddVehicle value) addVehicle,
    required TResult Function(UpdateVehicle value) updateVehicleCompany,
    required TResult Function(DeleteVehicle value) deleteVehicle,
  }) {
    return updateVehicleCompany(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult? Function(AddVehicle value)? addVehicle,
    TResult? Function(UpdateVehicle value)? updateVehicleCompany,
    TResult? Function(DeleteVehicle value)? deleteVehicle,
  }) {
    return updateVehicleCompany?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult Function(AddVehicle value)? addVehicle,
    TResult Function(UpdateVehicle value)? updateVehicleCompany,
    TResult Function(DeleteVehicle value)? deleteVehicle,
    required TResult orElse(),
  }) {
    if (updateVehicleCompany != null) {
      return updateVehicleCompany(this);
    }
    return orElse();
  }
}

abstract class UpdateVehicle implements VehicleEvent {
  const factory UpdateVehicle({required final VehicleRequest updatedVehicle}) =
      _$UpdateVehicleImpl;

  VehicleRequest get updatedVehicle;

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateVehicleImplCopyWith<_$UpdateVehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteVehicleImplCopyWith<$Res> {
  factory _$$DeleteVehicleImplCopyWith(
          _$DeleteVehicleImpl value, $Res Function(_$DeleteVehicleImpl) then) =
      __$$DeleteVehicleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String vehicleId});
}

/// @nodoc
class __$$DeleteVehicleImplCopyWithImpl<$Res>
    extends _$VehicleEventCopyWithImpl<$Res, _$DeleteVehicleImpl>
    implements _$$DeleteVehicleImplCopyWith<$Res> {
  __$$DeleteVehicleImplCopyWithImpl(
      _$DeleteVehicleImpl _value, $Res Function(_$DeleteVehicleImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
  }) {
    return _then(_$DeleteVehicleImpl(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteVehicleImpl implements DeleteVehicle {
  const _$DeleteVehicleImpl({required this.vehicleId});

  @override
  final String vehicleId;

  @override
  String toString() {
    return 'VehicleEvent.deleteVehicle(vehicleId: $vehicleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteVehicleImpl &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleId);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteVehicleImplCopyWith<_$DeleteVehicleImpl> get copyWith =>
      __$$DeleteVehicleImplCopyWithImpl<_$DeleteVehicleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllVehicles,
    required TResult Function(VehicleRequest vehicleData) addVehicle,
    required TResult Function(VehicleRequest updatedVehicle)
        updateVehicleCompany,
    required TResult Function(String vehicleId) deleteVehicle,
  }) {
    return deleteVehicle(vehicleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult? Function(VehicleRequest vehicleData)? addVehicle,
    TResult? Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult? Function(String vehicleId)? deleteVehicle,
  }) {
    return deleteVehicle?.call(vehicleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllVehicles,
    TResult Function(VehicleRequest vehicleData)? addVehicle,
    TResult Function(VehicleRequest updatedVehicle)? updateVehicleCompany,
    TResult Function(String vehicleId)? deleteVehicle,
    required TResult orElse(),
  }) {
    if (deleteVehicle != null) {
      return deleteVehicle(vehicleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllVehicles value) fetchAllVehicles,
    required TResult Function(AddVehicle value) addVehicle,
    required TResult Function(UpdateVehicle value) updateVehicleCompany,
    required TResult Function(DeleteVehicle value) deleteVehicle,
  }) {
    return deleteVehicle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult? Function(AddVehicle value)? addVehicle,
    TResult? Function(UpdateVehicle value)? updateVehicleCompany,
    TResult? Function(DeleteVehicle value)? deleteVehicle,
  }) {
    return deleteVehicle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicles value)? fetchAllVehicles,
    TResult Function(AddVehicle value)? addVehicle,
    TResult Function(UpdateVehicle value)? updateVehicleCompany,
    TResult Function(DeleteVehicle value)? deleteVehicle,
    required TResult orElse(),
  }) {
    if (deleteVehicle != null) {
      return deleteVehicle(this);
    }
    return orElse();
  }
}

abstract class DeleteVehicle implements VehicleEvent {
  const factory DeleteVehicle({required final String vehicleId}) =
      _$DeleteVehicleImpl;

  String get vehicleId;

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteVehicleImplCopyWith<_$DeleteVehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VehicleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) vehicleAddedSuccess,
    required TResult Function() updated,
    required TResult Function() deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? vehicleAddedSuccess,
    TResult? Function()? updated,
    TResult? Function()? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? vehicleAddedSuccess,
    TResult Function()? updated,
    TResult Function()? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VehicleInitial value) initial,
    required TResult Function(VehicleLoading value) loading,
    required TResult Function(VehicleLoaded value) loaded,
    required TResult Function(VehicleError value) error,
    required TResult Function(VehicleAddedSuccess value) vehicleAddedSuccess,
    required TResult Function(VehicleUpdated value) updated,
    required TResult Function(VehicleDeleted value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VehicleInitial value)? initial,
    TResult? Function(VehicleLoading value)? loading,
    TResult? Function(VehicleLoaded value)? loaded,
    TResult? Function(VehicleError value)? error,
    TResult? Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult? Function(VehicleUpdated value)? updated,
    TResult? Function(VehicleDeleted value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VehicleInitial value)? initial,
    TResult Function(VehicleLoading value)? loading,
    TResult Function(VehicleLoaded value)? loaded,
    TResult Function(VehicleError value)? error,
    TResult Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult Function(VehicleUpdated value)? updated,
    TResult Function(VehicleDeleted value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleStateCopyWith<$Res> {
  factory $VehicleStateCopyWith(
          VehicleState value, $Res Function(VehicleState) then) =
      _$VehicleStateCopyWithImpl<$Res, VehicleState>;
}

/// @nodoc
class _$VehicleStateCopyWithImpl<$Res, $Val extends VehicleState>
    implements $VehicleStateCopyWith<$Res> {
  _$VehicleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$VehicleInitialImplCopyWith<$Res> {
  factory _$$VehicleInitialImplCopyWith(_$VehicleInitialImpl value,
          $Res Function(_$VehicleInitialImpl) then) =
      __$$VehicleInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VehicleInitialImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleInitialImpl>
    implements _$$VehicleInitialImplCopyWith<$Res> {
  __$$VehicleInitialImplCopyWithImpl(
      _$VehicleInitialImpl _value, $Res Function(_$VehicleInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VehicleInitialImpl implements VehicleInitial {
  const _$VehicleInitialImpl();

  @override
  String toString() {
    return 'VehicleState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VehicleInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) vehicleAddedSuccess,
    required TResult Function() updated,
    required TResult Function() deleted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? vehicleAddedSuccess,
    TResult? Function()? updated,
    TResult? Function()? deleted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? vehicleAddedSuccess,
    TResult Function()? updated,
    TResult Function()? deleted,
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
    required TResult Function(VehicleInitial value) initial,
    required TResult Function(VehicleLoading value) loading,
    required TResult Function(VehicleLoaded value) loaded,
    required TResult Function(VehicleError value) error,
    required TResult Function(VehicleAddedSuccess value) vehicleAddedSuccess,
    required TResult Function(VehicleUpdated value) updated,
    required TResult Function(VehicleDeleted value) deleted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VehicleInitial value)? initial,
    TResult? Function(VehicleLoading value)? loading,
    TResult? Function(VehicleLoaded value)? loaded,
    TResult? Function(VehicleError value)? error,
    TResult? Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult? Function(VehicleUpdated value)? updated,
    TResult? Function(VehicleDeleted value)? deleted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VehicleInitial value)? initial,
    TResult Function(VehicleLoading value)? loading,
    TResult Function(VehicleLoaded value)? loaded,
    TResult Function(VehicleError value)? error,
    TResult Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult Function(VehicleUpdated value)? updated,
    TResult Function(VehicleDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class VehicleInitial implements VehicleState {
  const factory VehicleInitial() = _$VehicleInitialImpl;
}

/// @nodoc
abstract class _$$VehicleLoadingImplCopyWith<$Res> {
  factory _$$VehicleLoadingImplCopyWith(_$VehicleLoadingImpl value,
          $Res Function(_$VehicleLoadingImpl) then) =
      __$$VehicleLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VehicleLoadingImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleLoadingImpl>
    implements _$$VehicleLoadingImplCopyWith<$Res> {
  __$$VehicleLoadingImplCopyWithImpl(
      _$VehicleLoadingImpl _value, $Res Function(_$VehicleLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VehicleLoadingImpl implements VehicleLoading {
  const _$VehicleLoadingImpl();

  @override
  String toString() {
    return 'VehicleState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VehicleLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) vehicleAddedSuccess,
    required TResult Function() updated,
    required TResult Function() deleted,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? vehicleAddedSuccess,
    TResult? Function()? updated,
    TResult? Function()? deleted,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? vehicleAddedSuccess,
    TResult Function()? updated,
    TResult Function()? deleted,
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
    required TResult Function(VehicleInitial value) initial,
    required TResult Function(VehicleLoading value) loading,
    required TResult Function(VehicleLoaded value) loaded,
    required TResult Function(VehicleError value) error,
    required TResult Function(VehicleAddedSuccess value) vehicleAddedSuccess,
    required TResult Function(VehicleUpdated value) updated,
    required TResult Function(VehicleDeleted value) deleted,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VehicleInitial value)? initial,
    TResult? Function(VehicleLoading value)? loading,
    TResult? Function(VehicleLoaded value)? loaded,
    TResult? Function(VehicleError value)? error,
    TResult? Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult? Function(VehicleUpdated value)? updated,
    TResult? Function(VehicleDeleted value)? deleted,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VehicleInitial value)? initial,
    TResult Function(VehicleLoading value)? loading,
    TResult Function(VehicleLoaded value)? loaded,
    TResult Function(VehicleError value)? error,
    TResult Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult Function(VehicleUpdated value)? updated,
    TResult Function(VehicleDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class VehicleLoading implements VehicleState {
  const factory VehicleLoading() = _$VehicleLoadingImpl;
}

/// @nodoc
abstract class _$$VehicleLoadedImplCopyWith<$Res> {
  factory _$$VehicleLoadedImplCopyWith(
          _$VehicleLoadedImpl value, $Res Function(_$VehicleLoadedImpl) then) =
      __$$VehicleLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<VehicleRequest> vehicles, int totalPages, int currentPage});
}

/// @nodoc
class __$$VehicleLoadedImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleLoadedImpl>
    implements _$$VehicleLoadedImplCopyWith<$Res> {
  __$$VehicleLoadedImplCopyWithImpl(
      _$VehicleLoadedImpl _value, $Res Function(_$VehicleLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicles = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(_$VehicleLoadedImpl(
      vehicles: null == vehicles
          ? _value._vehicles
          : vehicles // ignore: cast_nullable_to_non_nullable
              as List<VehicleRequest>,
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

class _$VehicleLoadedImpl implements VehicleLoaded {
  const _$VehicleLoadedImpl(
      {required final List<VehicleRequest> vehicles,
      required this.totalPages,
      required this.currentPage})
      : _vehicles = vehicles;

//  required List<VehicleModel> vehicles,
  final List<VehicleRequest> _vehicles;
//  required List<VehicleModel> vehicles,
  @override
  List<VehicleRequest> get vehicles {
    if (_vehicles is EqualUnmodifiableListView) return _vehicles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vehicles);
  }

  @override
  final int totalPages;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'VehicleState.loaded(vehicles: $vehicles, totalPages: $totalPages, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleLoadedImpl &&
            const DeepCollectionEquality().equals(other._vehicles, _vehicles) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_vehicles), totalPages, currentPage);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleLoadedImplCopyWith<_$VehicleLoadedImpl> get copyWith =>
      __$$VehicleLoadedImplCopyWithImpl<_$VehicleLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) vehicleAddedSuccess,
    required TResult Function() updated,
    required TResult Function() deleted,
  }) {
    return loaded(vehicles, totalPages, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? vehicleAddedSuccess,
    TResult? Function()? updated,
    TResult? Function()? deleted,
  }) {
    return loaded?.call(vehicles, totalPages, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? vehicleAddedSuccess,
    TResult Function()? updated,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(vehicles, totalPages, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VehicleInitial value) initial,
    required TResult Function(VehicleLoading value) loading,
    required TResult Function(VehicleLoaded value) loaded,
    required TResult Function(VehicleError value) error,
    required TResult Function(VehicleAddedSuccess value) vehicleAddedSuccess,
    required TResult Function(VehicleUpdated value) updated,
    required TResult Function(VehicleDeleted value) deleted,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VehicleInitial value)? initial,
    TResult? Function(VehicleLoading value)? loading,
    TResult? Function(VehicleLoaded value)? loaded,
    TResult? Function(VehicleError value)? error,
    TResult? Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult? Function(VehicleUpdated value)? updated,
    TResult? Function(VehicleDeleted value)? deleted,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VehicleInitial value)? initial,
    TResult Function(VehicleLoading value)? loading,
    TResult Function(VehicleLoaded value)? loaded,
    TResult Function(VehicleError value)? error,
    TResult Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult Function(VehicleUpdated value)? updated,
    TResult Function(VehicleDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class VehicleLoaded implements VehicleState {
  const factory VehicleLoaded(
      {required final List<VehicleRequest> vehicles,
      required final int totalPages,
      required final int currentPage}) = _$VehicleLoadedImpl;

//  required List<VehicleModel> vehicles,
  List<VehicleRequest> get vehicles;
  int get totalPages;
  int get currentPage;

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleLoadedImplCopyWith<_$VehicleLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VehicleErrorImplCopyWith<$Res> {
  factory _$$VehicleErrorImplCopyWith(
          _$VehicleErrorImpl value, $Res Function(_$VehicleErrorImpl) then) =
      __$$VehicleErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$VehicleErrorImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleErrorImpl>
    implements _$$VehicleErrorImplCopyWith<$Res> {
  __$$VehicleErrorImplCopyWithImpl(
      _$VehicleErrorImpl _value, $Res Function(_$VehicleErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$VehicleErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VehicleErrorImpl implements VehicleError {
  const _$VehicleErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VehicleState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleErrorImplCopyWith<_$VehicleErrorImpl> get copyWith =>
      __$$VehicleErrorImplCopyWithImpl<_$VehicleErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) vehicleAddedSuccess,
    required TResult Function() updated,
    required TResult Function() deleted,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? vehicleAddedSuccess,
    TResult? Function()? updated,
    TResult? Function()? deleted,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? vehicleAddedSuccess,
    TResult Function()? updated,
    TResult Function()? deleted,
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
    required TResult Function(VehicleInitial value) initial,
    required TResult Function(VehicleLoading value) loading,
    required TResult Function(VehicleLoaded value) loaded,
    required TResult Function(VehicleError value) error,
    required TResult Function(VehicleAddedSuccess value) vehicleAddedSuccess,
    required TResult Function(VehicleUpdated value) updated,
    required TResult Function(VehicleDeleted value) deleted,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VehicleInitial value)? initial,
    TResult? Function(VehicleLoading value)? loading,
    TResult? Function(VehicleLoaded value)? loaded,
    TResult? Function(VehicleError value)? error,
    TResult? Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult? Function(VehicleUpdated value)? updated,
    TResult? Function(VehicleDeleted value)? deleted,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VehicleInitial value)? initial,
    TResult Function(VehicleLoading value)? loading,
    TResult Function(VehicleLoaded value)? loaded,
    TResult Function(VehicleError value)? error,
    TResult Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult Function(VehicleUpdated value)? updated,
    TResult Function(VehicleDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class VehicleError implements VehicleState {
  const factory VehicleError(final String message) = _$VehicleErrorImpl;

  String get message;

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleErrorImplCopyWith<_$VehicleErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VehicleAddedSuccessImplCopyWith<$Res> {
  factory _$$VehicleAddedSuccessImplCopyWith(_$VehicleAddedSuccessImpl value,
          $Res Function(_$VehicleAddedSuccessImpl) then) =
      __$$VehicleAddedSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$VehicleAddedSuccessImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleAddedSuccessImpl>
    implements _$$VehicleAddedSuccessImplCopyWith<$Res> {
  __$$VehicleAddedSuccessImplCopyWithImpl(_$VehicleAddedSuccessImpl _value,
      $Res Function(_$VehicleAddedSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$VehicleAddedSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VehicleAddedSuccessImpl implements VehicleAddedSuccess {
  const _$VehicleAddedSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VehicleState.vehicleAddedSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleAddedSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleAddedSuccessImplCopyWith<_$VehicleAddedSuccessImpl> get copyWith =>
      __$$VehicleAddedSuccessImplCopyWithImpl<_$VehicleAddedSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) vehicleAddedSuccess,
    required TResult Function() updated,
    required TResult Function() deleted,
  }) {
    return vehicleAddedSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? vehicleAddedSuccess,
    TResult? Function()? updated,
    TResult? Function()? deleted,
  }) {
    return vehicleAddedSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? vehicleAddedSuccess,
    TResult Function()? updated,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (vehicleAddedSuccess != null) {
      return vehicleAddedSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VehicleInitial value) initial,
    required TResult Function(VehicleLoading value) loading,
    required TResult Function(VehicleLoaded value) loaded,
    required TResult Function(VehicleError value) error,
    required TResult Function(VehicleAddedSuccess value) vehicleAddedSuccess,
    required TResult Function(VehicleUpdated value) updated,
    required TResult Function(VehicleDeleted value) deleted,
  }) {
    return vehicleAddedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VehicleInitial value)? initial,
    TResult? Function(VehicleLoading value)? loading,
    TResult? Function(VehicleLoaded value)? loaded,
    TResult? Function(VehicleError value)? error,
    TResult? Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult? Function(VehicleUpdated value)? updated,
    TResult? Function(VehicleDeleted value)? deleted,
  }) {
    return vehicleAddedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VehicleInitial value)? initial,
    TResult Function(VehicleLoading value)? loading,
    TResult Function(VehicleLoaded value)? loaded,
    TResult Function(VehicleError value)? error,
    TResult Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult Function(VehicleUpdated value)? updated,
    TResult Function(VehicleDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (vehicleAddedSuccess != null) {
      return vehicleAddedSuccess(this);
    }
    return orElse();
  }
}

abstract class VehicleAddedSuccess implements VehicleState {
  const factory VehicleAddedSuccess(final String message) =
      _$VehicleAddedSuccessImpl;

  String get message;

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleAddedSuccessImplCopyWith<_$VehicleAddedSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VehicleUpdatedImplCopyWith<$Res> {
  factory _$$VehicleUpdatedImplCopyWith(_$VehicleUpdatedImpl value,
          $Res Function(_$VehicleUpdatedImpl) then) =
      __$$VehicleUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VehicleUpdatedImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleUpdatedImpl>
    implements _$$VehicleUpdatedImplCopyWith<$Res> {
  __$$VehicleUpdatedImplCopyWithImpl(
      _$VehicleUpdatedImpl _value, $Res Function(_$VehicleUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VehicleUpdatedImpl implements VehicleUpdated {
  const _$VehicleUpdatedImpl();

  @override
  String toString() {
    return 'VehicleState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VehicleUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) vehicleAddedSuccess,
    required TResult Function() updated,
    required TResult Function() deleted,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? vehicleAddedSuccess,
    TResult? Function()? updated,
    TResult? Function()? deleted,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? vehicleAddedSuccess,
    TResult Function()? updated,
    TResult Function()? deleted,
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
    required TResult Function(VehicleInitial value) initial,
    required TResult Function(VehicleLoading value) loading,
    required TResult Function(VehicleLoaded value) loaded,
    required TResult Function(VehicleError value) error,
    required TResult Function(VehicleAddedSuccess value) vehicleAddedSuccess,
    required TResult Function(VehicleUpdated value) updated,
    required TResult Function(VehicleDeleted value) deleted,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VehicleInitial value)? initial,
    TResult? Function(VehicleLoading value)? loading,
    TResult? Function(VehicleLoaded value)? loaded,
    TResult? Function(VehicleError value)? error,
    TResult? Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult? Function(VehicleUpdated value)? updated,
    TResult? Function(VehicleDeleted value)? deleted,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VehicleInitial value)? initial,
    TResult Function(VehicleLoading value)? loading,
    TResult Function(VehicleLoaded value)? loaded,
    TResult Function(VehicleError value)? error,
    TResult Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult Function(VehicleUpdated value)? updated,
    TResult Function(VehicleDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class VehicleUpdated implements VehicleState {
  const factory VehicleUpdated() = _$VehicleUpdatedImpl;
}

/// @nodoc
abstract class _$$VehicleDeletedImplCopyWith<$Res> {
  factory _$$VehicleDeletedImplCopyWith(_$VehicleDeletedImpl value,
          $Res Function(_$VehicleDeletedImpl) then) =
      __$$VehicleDeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VehicleDeletedImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleDeletedImpl>
    implements _$$VehicleDeletedImplCopyWith<$Res> {
  __$$VehicleDeletedImplCopyWithImpl(
      _$VehicleDeletedImpl _value, $Res Function(_$VehicleDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VehicleDeletedImpl implements VehicleDeleted {
  const _$VehicleDeletedImpl();

  @override
  String toString() {
    return 'VehicleState.deleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VehicleDeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)
        loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) vehicleAddedSuccess,
    required TResult Function() updated,
    required TResult Function() deleted,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? vehicleAddedSuccess,
    TResult? Function()? updated,
    TResult? Function()? deleted,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<VehicleRequest> vehicles, int totalPages, int currentPage)?
        loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? vehicleAddedSuccess,
    TResult Function()? updated,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VehicleInitial value) initial,
    required TResult Function(VehicleLoading value) loading,
    required TResult Function(VehicleLoaded value) loaded,
    required TResult Function(VehicleError value) error,
    required TResult Function(VehicleAddedSuccess value) vehicleAddedSuccess,
    required TResult Function(VehicleUpdated value) updated,
    required TResult Function(VehicleDeleted value) deleted,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VehicleInitial value)? initial,
    TResult? Function(VehicleLoading value)? loading,
    TResult? Function(VehicleLoaded value)? loaded,
    TResult? Function(VehicleError value)? error,
    TResult? Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult? Function(VehicleUpdated value)? updated,
    TResult? Function(VehicleDeleted value)? deleted,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VehicleInitial value)? initial,
    TResult Function(VehicleLoading value)? loading,
    TResult Function(VehicleLoaded value)? loaded,
    TResult Function(VehicleError value)? error,
    TResult Function(VehicleAddedSuccess value)? vehicleAddedSuccess,
    TResult Function(VehicleUpdated value)? updated,
    TResult Function(VehicleDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class VehicleDeleted implements VehicleState {
  const factory VehicleDeleted() = _$VehicleDeletedImpl;
}
