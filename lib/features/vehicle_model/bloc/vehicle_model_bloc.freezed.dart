// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VehicleModelEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int page, int limit, String? searchQuery)
        fetchAllModels,
    required TResult Function(VehicleModel model, List<PlatformFile> rawImages)
        createVehicleModel,
    required TResult Function(String manufacturerId, int page, int limit)
        fetchByManufacturer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult? Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult? Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllVehicleModels value) fetchAllModels,
    required TResult Function(CreateVehicleModel value) createVehicleModel,
    required TResult Function(FetchVehicleModelsByManufacturer value)
        fetchByManufacturer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult? Function(CreateVehicleModel value)? createVehicleModel,
    TResult? Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult Function(CreateVehicleModel value)? createVehicleModel,
    TResult Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelEventCopyWith<$Res> {
  factory $VehicleModelEventCopyWith(
          VehicleModelEvent value, $Res Function(VehicleModelEvent) then) =
      _$VehicleModelEventCopyWithImpl<$Res, VehicleModelEvent>;
}

/// @nodoc
class _$VehicleModelEventCopyWithImpl<$Res, $Val extends VehicleModelEvent>
    implements $VehicleModelEventCopyWith<$Res> {
  _$VehicleModelEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleModelEvent
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
    extends _$VehicleModelEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'VehicleModelEvent.started()';
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
    required TResult Function(int page, int limit, String? searchQuery)
        fetchAllModels,
    required TResult Function(VehicleModel model, List<PlatformFile> rawImages)
        createVehicleModel,
    required TResult Function(String manufacturerId, int page, int limit)
        fetchByManufacturer,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult? Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult? Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
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
    required TResult Function(FetchAllVehicleModels value) fetchAllModels,
    required TResult Function(CreateVehicleModel value) createVehicleModel,
    required TResult Function(FetchVehicleModelsByManufacturer value)
        fetchByManufacturer,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult? Function(CreateVehicleModel value)? createVehicleModel,
    TResult? Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult Function(CreateVehicleModel value)? createVehicleModel,
    TResult Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VehicleModelEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchAllVehicleModelsImplCopyWith<$Res> {
  factory _$$FetchAllVehicleModelsImplCopyWith(
          _$FetchAllVehicleModelsImpl value,
          $Res Function(_$FetchAllVehicleModelsImpl) then) =
      __$$FetchAllVehicleModelsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit, String? searchQuery});
}

/// @nodoc
class __$$FetchAllVehicleModelsImplCopyWithImpl<$Res>
    extends _$VehicleModelEventCopyWithImpl<$Res, _$FetchAllVehicleModelsImpl>
    implements _$$FetchAllVehicleModelsImplCopyWith<$Res> {
  __$$FetchAllVehicleModelsImplCopyWithImpl(_$FetchAllVehicleModelsImpl _value,
      $Res Function(_$FetchAllVehicleModelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? searchQuery = freezed,
  }) {
    return _then(_$FetchAllVehicleModelsImpl(
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

class _$FetchAllVehicleModelsImpl implements FetchAllVehicleModels {
  const _$FetchAllVehicleModelsImpl(
      {this.page = 1, this.limit = 10, this.searchQuery = ''});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final String? searchQuery;

  @override
  String toString() {
    return 'VehicleModelEvent.fetchAllModels(page: $page, limit: $limit, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllVehicleModelsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, searchQuery);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllVehicleModelsImplCopyWith<_$FetchAllVehicleModelsImpl>
      get copyWith => __$$FetchAllVehicleModelsImplCopyWithImpl<
          _$FetchAllVehicleModelsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int page, int limit, String? searchQuery)
        fetchAllModels,
    required TResult Function(VehicleModel model, List<PlatformFile> rawImages)
        createVehicleModel,
    required TResult Function(String manufacturerId, int page, int limit)
        fetchByManufacturer,
  }) {
    return fetchAllModels(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult? Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult? Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
  }) {
    return fetchAllModels?.call(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
    required TResult orElse(),
  }) {
    if (fetchAllModels != null) {
      return fetchAllModels(page, limit, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllVehicleModels value) fetchAllModels,
    required TResult Function(CreateVehicleModel value) createVehicleModel,
    required TResult Function(FetchVehicleModelsByManufacturer value)
        fetchByManufacturer,
  }) {
    return fetchAllModels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult? Function(CreateVehicleModel value)? createVehicleModel,
    TResult? Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
  }) {
    return fetchAllModels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult Function(CreateVehicleModel value)? createVehicleModel,
    TResult Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    required TResult orElse(),
  }) {
    if (fetchAllModels != null) {
      return fetchAllModels(this);
    }
    return orElse();
  }
}

abstract class FetchAllVehicleModels implements VehicleModelEvent {
  const factory FetchAllVehicleModels(
      {final int page,
      final int limit,
      final String? searchQuery}) = _$FetchAllVehicleModelsImpl;

  int get page;
  int get limit;
  String? get searchQuery;

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllVehicleModelsImplCopyWith<_$FetchAllVehicleModelsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateVehicleModelImplCopyWith<$Res> {
  factory _$$CreateVehicleModelImplCopyWith(_$CreateVehicleModelImpl value,
          $Res Function(_$CreateVehicleModelImpl) then) =
      __$$CreateVehicleModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleModel model, List<PlatformFile> rawImages});

  $VehicleModelCopyWith<$Res> get model;
}

/// @nodoc
class __$$CreateVehicleModelImplCopyWithImpl<$Res>
    extends _$VehicleModelEventCopyWithImpl<$Res, _$CreateVehicleModelImpl>
    implements _$$CreateVehicleModelImplCopyWith<$Res> {
  __$$CreateVehicleModelImplCopyWithImpl(_$CreateVehicleModelImpl _value,
      $Res Function(_$CreateVehicleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? rawImages = null,
  }) {
    return _then(_$CreateVehicleModelImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as VehicleModel,
      rawImages: null == rawImages
          ? _value._rawImages
          : rawImages // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ));
  }

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleModelCopyWith<$Res> get model {
    return $VehicleModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value));
    });
  }
}

/// @nodoc

class _$CreateVehicleModelImpl implements CreateVehicleModel {
  const _$CreateVehicleModelImpl(
      {required this.model, required final List<PlatformFile> rawImages})
      : _rawImages = rawImages;

  @override
  final VehicleModel model;
  final List<PlatformFile> _rawImages;
  @override
  List<PlatformFile> get rawImages {
    if (_rawImages is EqualUnmodifiableListView) return _rawImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawImages);
  }

  @override
  String toString() {
    return 'VehicleModelEvent.createVehicleModel(model: $model, rawImages: $rawImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVehicleModelImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality()
                .equals(other._rawImages, _rawImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, model, const DeepCollectionEquality().hash(_rawImages));

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVehicleModelImplCopyWith<_$CreateVehicleModelImpl> get copyWith =>
      __$$CreateVehicleModelImplCopyWithImpl<_$CreateVehicleModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int page, int limit, String? searchQuery)
        fetchAllModels,
    required TResult Function(VehicleModel model, List<PlatformFile> rawImages)
        createVehicleModel,
    required TResult Function(String manufacturerId, int page, int limit)
        fetchByManufacturer,
  }) {
    return createVehicleModel(model, rawImages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult? Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult? Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
  }) {
    return createVehicleModel?.call(model, rawImages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
    required TResult orElse(),
  }) {
    if (createVehicleModel != null) {
      return createVehicleModel(model, rawImages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllVehicleModels value) fetchAllModels,
    required TResult Function(CreateVehicleModel value) createVehicleModel,
    required TResult Function(FetchVehicleModelsByManufacturer value)
        fetchByManufacturer,
  }) {
    return createVehicleModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult? Function(CreateVehicleModel value)? createVehicleModel,
    TResult? Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
  }) {
    return createVehicleModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult Function(CreateVehicleModel value)? createVehicleModel,
    TResult Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    required TResult orElse(),
  }) {
    if (createVehicleModel != null) {
      return createVehicleModel(this);
    }
    return orElse();
  }
}

abstract class CreateVehicleModel implements VehicleModelEvent {
  const factory CreateVehicleModel(
      {required final VehicleModel model,
      required final List<PlatformFile> rawImages}) = _$CreateVehicleModelImpl;

  VehicleModel get model;
  List<PlatformFile> get rawImages;

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateVehicleModelImplCopyWith<_$CreateVehicleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchVehicleModelsByManufacturerImplCopyWith<$Res> {
  factory _$$FetchVehicleModelsByManufacturerImplCopyWith(
          _$FetchVehicleModelsByManufacturerImpl value,
          $Res Function(_$FetchVehicleModelsByManufacturerImpl) then) =
      __$$FetchVehicleModelsByManufacturerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String manufacturerId, int page, int limit});
}

/// @nodoc
class __$$FetchVehicleModelsByManufacturerImplCopyWithImpl<$Res>
    extends _$VehicleModelEventCopyWithImpl<$Res,
        _$FetchVehicleModelsByManufacturerImpl>
    implements _$$FetchVehicleModelsByManufacturerImplCopyWith<$Res> {
  __$$FetchVehicleModelsByManufacturerImplCopyWithImpl(
      _$FetchVehicleModelsByManufacturerImpl _value,
      $Res Function(_$FetchVehicleModelsByManufacturerImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manufacturerId = null,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$FetchVehicleModelsByManufacturerImpl(
      null == manufacturerId
          ? _value.manufacturerId
          : manufacturerId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$FetchVehicleModelsByManufacturerImpl
    implements FetchVehicleModelsByManufacturer {
  const _$FetchVehicleModelsByManufacturerImpl(this.manufacturerId,
      {this.page = 1, this.limit = 10});

  @override
  final String manufacturerId;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'VehicleModelEvent.fetchByManufacturer(manufacturerId: $manufacturerId, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchVehicleModelsByManufacturerImpl &&
            (identical(other.manufacturerId, manufacturerId) ||
                other.manufacturerId == manufacturerId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, manufacturerId, page, limit);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchVehicleModelsByManufacturerImplCopyWith<
          _$FetchVehicleModelsByManufacturerImpl>
      get copyWith => __$$FetchVehicleModelsByManufacturerImplCopyWithImpl<
          _$FetchVehicleModelsByManufacturerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int page, int limit, String? searchQuery)
        fetchAllModels,
    required TResult Function(VehicleModel model, List<PlatformFile> rawImages)
        createVehicleModel,
    required TResult Function(String manufacturerId, int page, int limit)
        fetchByManufacturer,
  }) {
    return fetchByManufacturer(manufacturerId, page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult? Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult? Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
  }) {
    return fetchByManufacturer?.call(manufacturerId, page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int page, int limit, String? searchQuery)? fetchAllModels,
    TResult Function(VehicleModel model, List<PlatformFile> rawImages)?
        createVehicleModel,
    TResult Function(String manufacturerId, int page, int limit)?
        fetchByManufacturer,
    required TResult orElse(),
  }) {
    if (fetchByManufacturer != null) {
      return fetchByManufacturer(manufacturerId, page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllVehicleModels value) fetchAllModels,
    required TResult Function(CreateVehicleModel value) createVehicleModel,
    required TResult Function(FetchVehicleModelsByManufacturer value)
        fetchByManufacturer,
  }) {
    return fetchByManufacturer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult? Function(CreateVehicleModel value)? createVehicleModel,
    TResult? Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
  }) {
    return fetchByManufacturer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult Function(CreateVehicleModel value)? createVehicleModel,
    TResult Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    required TResult orElse(),
  }) {
    if (fetchByManufacturer != null) {
      return fetchByManufacturer(this);
    }
    return orElse();
  }
}

abstract class FetchVehicleModelsByManufacturer implements VehicleModelEvent {
  const factory FetchVehicleModelsByManufacturer(final String manufacturerId,
      {final int page,
      final int limit}) = _$FetchVehicleModelsByManufacturerImpl;

  String get manufacturerId;
  int get page;
  int get limit;

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchVehicleModelsByManufacturerImplCopyWith<
          _$FetchVehicleModelsByManufacturerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VehicleModelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VehicleModelResponse response) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelStateCopyWith<$Res> {
  factory $VehicleModelStateCopyWith(
          VehicleModelState value, $Res Function(VehicleModelState) then) =
      _$VehicleModelStateCopyWithImpl<$Res, VehicleModelState>;
}

/// @nodoc
class _$VehicleModelStateCopyWithImpl<$Res, $Val extends VehicleModelState>
    implements $VehicleModelStateCopyWith<$Res> {
  _$VehicleModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleModelState
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
    extends _$VehicleModelStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'VehicleModelState.initial()';
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
    required TResult Function(VehicleModelResponse response) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
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
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VehicleModelState {
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
    extends _$VehicleModelStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'VehicleModelState.loading()';
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
    required TResult Function(VehicleModelResponse response) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
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
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VehicleModelState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleModelResponse response});

  $VehicleModelResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$VehicleModelStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$LoadedImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as VehicleModelResponse,
    ));
  }

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleModelResponseCopyWith<$Res> get response {
    return $VehicleModelResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.response);

  @override
  final VehicleModelResponse response;

  @override
  String toString() {
    return 'VehicleModelState.loaded(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of VehicleModelState
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
    required TResult Function(VehicleModelResponse response) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(response);
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
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements VehicleModelState {
  const factory _Loaded(final VehicleModelResponse response) = _$LoadedImpl;

  VehicleModelResponse get response;

  /// Create a copy of VehicleModelState
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
    extends _$VehicleModelStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VehicleModelState.error(message: $message)';
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

  /// Create a copy of VehicleModelState
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
    required TResult Function(VehicleModelResponse response) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
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
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VehicleModelState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
