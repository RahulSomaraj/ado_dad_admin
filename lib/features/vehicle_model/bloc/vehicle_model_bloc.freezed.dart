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
    required TResult Function() fetchOptions,
    required TResult Function(String id) fetchOne,
    required TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)
        updateVehicleModel,
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
    TResult? Function()? fetchOptions,
    TResult? Function(String id)? fetchOne,
    TResult? Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    TResult Function()? fetchOptions,
    TResult Function(String id)? fetchOne,
    TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    required TResult Function(FetchVehicleOptions value) fetchOptions,
    required TResult Function(FetchOneVehicleModel value) fetchOne,
    required TResult Function(UpdateVehicleModel value) updateVehicleModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult? Function(CreateVehicleModel value)? createVehicleModel,
    TResult? Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    TResult? Function(FetchVehicleOptions value)? fetchOptions,
    TResult? Function(FetchOneVehicleModel value)? fetchOne,
    TResult? Function(UpdateVehicleModel value)? updateVehicleModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult Function(CreateVehicleModel value)? createVehicleModel,
    TResult Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    TResult Function(FetchVehicleOptions value)? fetchOptions,
    TResult Function(FetchOneVehicleModel value)? fetchOne,
    TResult Function(UpdateVehicleModel value)? updateVehicleModel,
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
    required TResult Function() fetchOptions,
    required TResult Function(String id) fetchOne,
    required TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)
        updateVehicleModel,
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
    TResult? Function()? fetchOptions,
    TResult? Function(String id)? fetchOne,
    TResult? Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    TResult Function()? fetchOptions,
    TResult Function(String id)? fetchOne,
    TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    required TResult Function(FetchVehicleOptions value) fetchOptions,
    required TResult Function(FetchOneVehicleModel value) fetchOne,
    required TResult Function(UpdateVehicleModel value) updateVehicleModel,
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
    TResult? Function(FetchVehicleOptions value)? fetchOptions,
    TResult? Function(FetchOneVehicleModel value)? fetchOne,
    TResult? Function(UpdateVehicleModel value)? updateVehicleModel,
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
    TResult Function(FetchVehicleOptions value)? fetchOptions,
    TResult Function(FetchOneVehicleModel value)? fetchOne,
    TResult Function(UpdateVehicleModel value)? updateVehicleModel,
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
    required TResult Function() fetchOptions,
    required TResult Function(String id) fetchOne,
    required TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)
        updateVehicleModel,
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
    TResult? Function()? fetchOptions,
    TResult? Function(String id)? fetchOne,
    TResult? Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    TResult Function()? fetchOptions,
    TResult Function(String id)? fetchOne,
    TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    required TResult Function(FetchVehicleOptions value) fetchOptions,
    required TResult Function(FetchOneVehicleModel value) fetchOne,
    required TResult Function(UpdateVehicleModel value) updateVehicleModel,
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
    TResult? Function(FetchVehicleOptions value)? fetchOptions,
    TResult? Function(FetchOneVehicleModel value)? fetchOne,
    TResult? Function(UpdateVehicleModel value)? updateVehicleModel,
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
    TResult Function(FetchVehicleOptions value)? fetchOptions,
    TResult Function(FetchOneVehicleModel value)? fetchOne,
    TResult Function(UpdateVehicleModel value)? updateVehicleModel,
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
    required TResult Function() fetchOptions,
    required TResult Function(String id) fetchOne,
    required TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)
        updateVehicleModel,
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
    TResult? Function()? fetchOptions,
    TResult? Function(String id)? fetchOne,
    TResult? Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    TResult Function()? fetchOptions,
    TResult Function(String id)? fetchOne,
    TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    required TResult Function(FetchVehicleOptions value) fetchOptions,
    required TResult Function(FetchOneVehicleModel value) fetchOne,
    required TResult Function(UpdateVehicleModel value) updateVehicleModel,
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
    TResult? Function(FetchVehicleOptions value)? fetchOptions,
    TResult? Function(FetchOneVehicleModel value)? fetchOne,
    TResult? Function(UpdateVehicleModel value)? updateVehicleModel,
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
    TResult Function(FetchVehicleOptions value)? fetchOptions,
    TResult Function(FetchOneVehicleModel value)? fetchOne,
    TResult Function(UpdateVehicleModel value)? updateVehicleModel,
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
    required TResult Function() fetchOptions,
    required TResult Function(String id) fetchOne,
    required TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)
        updateVehicleModel,
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
    TResult? Function()? fetchOptions,
    TResult? Function(String id)? fetchOne,
    TResult? Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    TResult Function()? fetchOptions,
    TResult Function(String id)? fetchOne,
    TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
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
    required TResult Function(FetchVehicleOptions value) fetchOptions,
    required TResult Function(FetchOneVehicleModel value) fetchOne,
    required TResult Function(UpdateVehicleModel value) updateVehicleModel,
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
    TResult? Function(FetchVehicleOptions value)? fetchOptions,
    TResult? Function(FetchOneVehicleModel value)? fetchOne,
    TResult? Function(UpdateVehicleModel value)? updateVehicleModel,
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
    TResult Function(FetchVehicleOptions value)? fetchOptions,
    TResult Function(FetchOneVehicleModel value)? fetchOne,
    TResult Function(UpdateVehicleModel value)? updateVehicleModel,
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
abstract class _$$FetchVehicleOptionsImplCopyWith<$Res> {
  factory _$$FetchVehicleOptionsImplCopyWith(_$FetchVehicleOptionsImpl value,
          $Res Function(_$FetchVehicleOptionsImpl) then) =
      __$$FetchVehicleOptionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchVehicleOptionsImplCopyWithImpl<$Res>
    extends _$VehicleModelEventCopyWithImpl<$Res, _$FetchVehicleOptionsImpl>
    implements _$$FetchVehicleOptionsImplCopyWith<$Res> {
  __$$FetchVehicleOptionsImplCopyWithImpl(_$FetchVehicleOptionsImpl _value,
      $Res Function(_$FetchVehicleOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchVehicleOptionsImpl implements FetchVehicleOptions {
  const _$FetchVehicleOptionsImpl();

  @override
  String toString() {
    return 'VehicleModelEvent.fetchOptions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchVehicleOptionsImpl);
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
    required TResult Function() fetchOptions,
    required TResult Function(String id) fetchOne,
    required TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)
        updateVehicleModel,
  }) {
    return fetchOptions();
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
    TResult? Function()? fetchOptions,
    TResult? Function(String id)? fetchOne,
    TResult? Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
  }) {
    return fetchOptions?.call();
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
    TResult Function()? fetchOptions,
    TResult Function(String id)? fetchOne,
    TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
    required TResult orElse(),
  }) {
    if (fetchOptions != null) {
      return fetchOptions();
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
    required TResult Function(FetchVehicleOptions value) fetchOptions,
    required TResult Function(FetchOneVehicleModel value) fetchOne,
    required TResult Function(UpdateVehicleModel value) updateVehicleModel,
  }) {
    return fetchOptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult? Function(CreateVehicleModel value)? createVehicleModel,
    TResult? Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    TResult? Function(FetchVehicleOptions value)? fetchOptions,
    TResult? Function(FetchOneVehicleModel value)? fetchOne,
    TResult? Function(UpdateVehicleModel value)? updateVehicleModel,
  }) {
    return fetchOptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult Function(CreateVehicleModel value)? createVehicleModel,
    TResult Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    TResult Function(FetchVehicleOptions value)? fetchOptions,
    TResult Function(FetchOneVehicleModel value)? fetchOne,
    TResult Function(UpdateVehicleModel value)? updateVehicleModel,
    required TResult orElse(),
  }) {
    if (fetchOptions != null) {
      return fetchOptions(this);
    }
    return orElse();
  }
}

abstract class FetchVehicleOptions implements VehicleModelEvent {
  const factory FetchVehicleOptions() = _$FetchVehicleOptionsImpl;
}

/// @nodoc
abstract class _$$FetchOneVehicleModelImplCopyWith<$Res> {
  factory _$$FetchOneVehicleModelImplCopyWith(_$FetchOneVehicleModelImpl value,
          $Res Function(_$FetchOneVehicleModelImpl) then) =
      __$$FetchOneVehicleModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$FetchOneVehicleModelImplCopyWithImpl<$Res>
    extends _$VehicleModelEventCopyWithImpl<$Res, _$FetchOneVehicleModelImpl>
    implements _$$FetchOneVehicleModelImplCopyWith<$Res> {
  __$$FetchOneVehicleModelImplCopyWithImpl(_$FetchOneVehicleModelImpl _value,
      $Res Function(_$FetchOneVehicleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchOneVehicleModelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchOneVehicleModelImpl implements FetchOneVehicleModel {
  const _$FetchOneVehicleModelImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'VehicleModelEvent.fetchOne(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchOneVehicleModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchOneVehicleModelImplCopyWith<_$FetchOneVehicleModelImpl>
      get copyWith =>
          __$$FetchOneVehicleModelImplCopyWithImpl<_$FetchOneVehicleModelImpl>(
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
    required TResult Function() fetchOptions,
    required TResult Function(String id) fetchOne,
    required TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)
        updateVehicleModel,
  }) {
    return fetchOne(id);
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
    TResult? Function()? fetchOptions,
    TResult? Function(String id)? fetchOne,
    TResult? Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
  }) {
    return fetchOne?.call(id);
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
    TResult Function()? fetchOptions,
    TResult Function(String id)? fetchOne,
    TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
    required TResult orElse(),
  }) {
    if (fetchOne != null) {
      return fetchOne(id);
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
    required TResult Function(FetchVehicleOptions value) fetchOptions,
    required TResult Function(FetchOneVehicleModel value) fetchOne,
    required TResult Function(UpdateVehicleModel value) updateVehicleModel,
  }) {
    return fetchOne(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult? Function(CreateVehicleModel value)? createVehicleModel,
    TResult? Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    TResult? Function(FetchVehicleOptions value)? fetchOptions,
    TResult? Function(FetchOneVehicleModel value)? fetchOne,
    TResult? Function(UpdateVehicleModel value)? updateVehicleModel,
  }) {
    return fetchOne?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult Function(CreateVehicleModel value)? createVehicleModel,
    TResult Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    TResult Function(FetchVehicleOptions value)? fetchOptions,
    TResult Function(FetchOneVehicleModel value)? fetchOne,
    TResult Function(UpdateVehicleModel value)? updateVehicleModel,
    required TResult orElse(),
  }) {
    if (fetchOne != null) {
      return fetchOne(this);
    }
    return orElse();
  }
}

abstract class FetchOneVehicleModel implements VehicleModelEvent {
  const factory FetchOneVehicleModel(final String id) =
      _$FetchOneVehicleModelImpl;

  String get id;

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchOneVehicleModelImplCopyWith<_$FetchOneVehicleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateVehicleModelImplCopyWith<$Res> {
  factory _$$UpdateVehicleModelImplCopyWith(_$UpdateVehicleModelImpl value,
          $Res Function(_$UpdateVehicleModelImpl) then) =
      __$$UpdateVehicleModelImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {VehicleModel model,
      List<String> keepImageUrls,
      List<PlatformFile> newRawImages});

  $VehicleModelCopyWith<$Res> get model;
}

/// @nodoc
class __$$UpdateVehicleModelImplCopyWithImpl<$Res>
    extends _$VehicleModelEventCopyWithImpl<$Res, _$UpdateVehicleModelImpl>
    implements _$$UpdateVehicleModelImplCopyWith<$Res> {
  __$$UpdateVehicleModelImplCopyWithImpl(_$UpdateVehicleModelImpl _value,
      $Res Function(_$UpdateVehicleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? keepImageUrls = null,
    Object? newRawImages = null,
  }) {
    return _then(_$UpdateVehicleModelImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as VehicleModel,
      keepImageUrls: null == keepImageUrls
          ? _value._keepImageUrls
          : keepImageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      newRawImages: null == newRawImages
          ? _value._newRawImages
          : newRawImages // ignore: cast_nullable_to_non_nullable
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

class _$UpdateVehicleModelImpl implements UpdateVehicleModel {
  const _$UpdateVehicleModelImpl(
      {required this.model,
      final List<String> keepImageUrls = const <String>[],
      final List<PlatformFile> newRawImages = const <PlatformFile>[]})
      : _keepImageUrls = keepImageUrls,
        _newRawImages = newRawImages;

  @override
  final VehicleModel model;
  final List<String> _keepImageUrls;
  @override
  @JsonKey()
  List<String> get keepImageUrls {
    if (_keepImageUrls is EqualUnmodifiableListView) return _keepImageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keepImageUrls);
  }

  final List<PlatformFile> _newRawImages;
  @override
  @JsonKey()
  List<PlatformFile> get newRawImages {
    if (_newRawImages is EqualUnmodifiableListView) return _newRawImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newRawImages);
  }

  @override
  String toString() {
    return 'VehicleModelEvent.updateVehicleModel(model: $model, keepImageUrls: $keepImageUrls, newRawImages: $newRawImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateVehicleModelImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality()
                .equals(other._keepImageUrls, _keepImageUrls) &&
            const DeepCollectionEquality()
                .equals(other._newRawImages, _newRawImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      const DeepCollectionEquality().hash(_keepImageUrls),
      const DeepCollectionEquality().hash(_newRawImages));

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateVehicleModelImplCopyWith<_$UpdateVehicleModelImpl> get copyWith =>
      __$$UpdateVehicleModelImplCopyWithImpl<_$UpdateVehicleModelImpl>(
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
    required TResult Function() fetchOptions,
    required TResult Function(String id) fetchOne,
    required TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)
        updateVehicleModel,
  }) {
    return updateVehicleModel(model, keepImageUrls, newRawImages);
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
    TResult? Function()? fetchOptions,
    TResult? Function(String id)? fetchOne,
    TResult? Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
  }) {
    return updateVehicleModel?.call(model, keepImageUrls, newRawImages);
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
    TResult Function()? fetchOptions,
    TResult Function(String id)? fetchOne,
    TResult Function(VehicleModel model, List<String> keepImageUrls,
            List<PlatformFile> newRawImages)?
        updateVehicleModel,
    required TResult orElse(),
  }) {
    if (updateVehicleModel != null) {
      return updateVehicleModel(model, keepImageUrls, newRawImages);
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
    required TResult Function(FetchVehicleOptions value) fetchOptions,
    required TResult Function(FetchOneVehicleModel value) fetchOne,
    required TResult Function(UpdateVehicleModel value) updateVehicleModel,
  }) {
    return updateVehicleModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult? Function(CreateVehicleModel value)? createVehicleModel,
    TResult? Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    TResult? Function(FetchVehicleOptions value)? fetchOptions,
    TResult? Function(FetchOneVehicleModel value)? fetchOne,
    TResult? Function(UpdateVehicleModel value)? updateVehicleModel,
  }) {
    return updateVehicleModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllVehicleModels value)? fetchAllModels,
    TResult Function(CreateVehicleModel value)? createVehicleModel,
    TResult Function(FetchVehicleModelsByManufacturer value)?
        fetchByManufacturer,
    TResult Function(FetchVehicleOptions value)? fetchOptions,
    TResult Function(FetchOneVehicleModel value)? fetchOne,
    TResult Function(UpdateVehicleModel value)? updateVehicleModel,
    required TResult orElse(),
  }) {
    if (updateVehicleModel != null) {
      return updateVehicleModel(this);
    }
    return orElse();
  }
}

abstract class UpdateVehicleModel implements VehicleModelEvent {
  const factory UpdateVehicleModel(
      {required final VehicleModel model,
      final List<String> keepImageUrls,
      final List<PlatformFile> newRawImages}) = _$UpdateVehicleModelImpl;

  VehicleModel get model;
  List<String> get keepImageUrls;
  List<PlatformFile> get newRawImages;

  /// Create a copy of VehicleModelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateVehicleModelImplCopyWith<_$UpdateVehicleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VehicleModelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VehicleModelResponse response) loaded,
    required TResult Function(String message) error,
    required TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)
        optionsLoaded,
    required TResult Function(VehicleModel model) oneLoaded,
    required TResult Function() created,
    required TResult Function() updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult? Function(VehicleModel model)? oneLoaded,
    TResult? Function()? created,
    TResult? Function()? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
    TResult Function(String message)? error,
    TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult Function(VehicleModel model)? oneLoaded,
    TResult Function()? created,
    TResult Function()? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_OptionsLoaded value) optionsLoaded,
    required TResult Function(_OneLoaded value) oneLoaded,
    required TResult Function(_Created value) created,
    required TResult Function(_Updated value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_OptionsLoaded value)? optionsLoaded,
    TResult? Function(_OneLoaded value)? oneLoaded,
    TResult? Function(_Created value)? created,
    TResult? Function(_Updated value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_OptionsLoaded value)? optionsLoaded,
    TResult Function(_OneLoaded value)? oneLoaded,
    TResult Function(_Created value)? created,
    TResult Function(_Updated value)? updated,
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
    required TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)
        optionsLoaded,
    required TResult Function(VehicleModel model) oneLoaded,
    required TResult Function() created,
    required TResult Function() updated,
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
    TResult? Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult? Function(VehicleModel model)? oneLoaded,
    TResult? Function()? created,
    TResult? Function()? updated,
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
    TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult Function(VehicleModel model)? oneLoaded,
    TResult Function()? created,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_OptionsLoaded value) optionsLoaded,
    required TResult Function(_OneLoaded value) oneLoaded,
    required TResult Function(_Created value) created,
    required TResult Function(_Updated value) updated,
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
    TResult? Function(_OptionsLoaded value)? optionsLoaded,
    TResult? Function(_OneLoaded value)? oneLoaded,
    TResult? Function(_Created value)? created,
    TResult? Function(_Updated value)? updated,
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
    TResult Function(_OptionsLoaded value)? optionsLoaded,
    TResult Function(_OneLoaded value)? oneLoaded,
    TResult Function(_Created value)? created,
    TResult Function(_Updated value)? updated,
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
    required TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)
        optionsLoaded,
    required TResult Function(VehicleModel model) oneLoaded,
    required TResult Function() created,
    required TResult Function() updated,
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
    TResult? Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult? Function(VehicleModel model)? oneLoaded,
    TResult? Function()? created,
    TResult? Function()? updated,
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
    TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult Function(VehicleModel model)? oneLoaded,
    TResult Function()? created,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_OptionsLoaded value) optionsLoaded,
    required TResult Function(_OneLoaded value) oneLoaded,
    required TResult Function(_Created value) created,
    required TResult Function(_Updated value) updated,
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
    TResult? Function(_OptionsLoaded value)? optionsLoaded,
    TResult? Function(_OneLoaded value)? oneLoaded,
    TResult? Function(_Created value)? created,
    TResult? Function(_Updated value)? updated,
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
    TResult Function(_OptionsLoaded value)? optionsLoaded,
    TResult Function(_OneLoaded value)? oneLoaded,
    TResult Function(_Created value)? created,
    TResult Function(_Updated value)? updated,
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
    required TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)
        optionsLoaded,
    required TResult Function(VehicleModel model) oneLoaded,
    required TResult Function() created,
    required TResult Function() updated,
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
    TResult? Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult? Function(VehicleModel model)? oneLoaded,
    TResult? Function()? created,
    TResult? Function()? updated,
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
    TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult Function(VehicleModel model)? oneLoaded,
    TResult Function()? created,
    TResult Function()? updated,
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
    required TResult Function(_OptionsLoaded value) optionsLoaded,
    required TResult Function(_OneLoaded value) oneLoaded,
    required TResult Function(_Created value) created,
    required TResult Function(_Updated value) updated,
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
    TResult? Function(_OptionsLoaded value)? optionsLoaded,
    TResult? Function(_OneLoaded value)? oneLoaded,
    TResult? Function(_Created value)? created,
    TResult? Function(_Updated value)? updated,
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
    TResult Function(_OptionsLoaded value)? optionsLoaded,
    TResult Function(_OneLoaded value)? oneLoaded,
    TResult Function(_Created value)? created,
    TResult Function(_Updated value)? updated,
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
    required TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)
        optionsLoaded,
    required TResult Function(VehicleModel model) oneLoaded,
    required TResult Function() created,
    required TResult Function() updated,
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
    TResult? Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult? Function(VehicleModel model)? oneLoaded,
    TResult? Function()? created,
    TResult? Function()? updated,
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
    TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult Function(VehicleModel model)? oneLoaded,
    TResult Function()? created,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_OptionsLoaded value) optionsLoaded,
    required TResult Function(_OneLoaded value) oneLoaded,
    required TResult Function(_Created value) created,
    required TResult Function(_Updated value) updated,
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
    TResult? Function(_OptionsLoaded value)? optionsLoaded,
    TResult? Function(_OneLoaded value)? oneLoaded,
    TResult? Function(_Created value)? created,
    TResult? Function(_Updated value)? updated,
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
    TResult Function(_OptionsLoaded value)? optionsLoaded,
    TResult Function(_OneLoaded value)? oneLoaded,
    TResult Function(_Created value)? created,
    TResult Function(_Updated value)? updated,
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

/// @nodoc
abstract class _$$OptionsLoadedImplCopyWith<$Res> {
  factory _$$OptionsLoadedImplCopyWith(
          _$OptionsLoadedImpl value, $Res Function(_$OptionsLoadedImpl) then) =
      __$$OptionsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes});
}

/// @nodoc
class __$$OptionsLoadedImplCopyWithImpl<$Res>
    extends _$VehicleModelStateCopyWithImpl<$Res, _$OptionsLoadedImpl>
    implements _$$OptionsLoadedImplCopyWith<$Res> {
  __$$OptionsLoadedImplCopyWithImpl(
      _$OptionsLoadedImpl _value, $Res Function(_$OptionsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fuelTypes = null,
    Object? transmissionTypes = null,
  }) {
    return _then(_$OptionsLoadedImpl(
      fuelTypes: null == fuelTypes
          ? _value._fuelTypes
          : fuelTypes // ignore: cast_nullable_to_non_nullable
              as List<FuelType>,
      transmissionTypes: null == transmissionTypes
          ? _value._transmissionTypes
          : transmissionTypes // ignore: cast_nullable_to_non_nullable
              as List<TransmissionType>,
    ));
  }
}

/// @nodoc

class _$OptionsLoadedImpl implements _OptionsLoaded {
  const _$OptionsLoadedImpl(
      {required final List<FuelType> fuelTypes,
      required final List<TransmissionType> transmissionTypes})
      : _fuelTypes = fuelTypes,
        _transmissionTypes = transmissionTypes;

  final List<FuelType> _fuelTypes;
  @override
  List<FuelType> get fuelTypes {
    if (_fuelTypes is EqualUnmodifiableListView) return _fuelTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fuelTypes);
  }

  final List<TransmissionType> _transmissionTypes;
  @override
  List<TransmissionType> get transmissionTypes {
    if (_transmissionTypes is EqualUnmodifiableListView)
      return _transmissionTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transmissionTypes);
  }

  @override
  String toString() {
    return 'VehicleModelState.optionsLoaded(fuelTypes: $fuelTypes, transmissionTypes: $transmissionTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionsLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._fuelTypes, _fuelTypes) &&
            const DeepCollectionEquality()
                .equals(other._transmissionTypes, _transmissionTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_fuelTypes),
      const DeepCollectionEquality().hash(_transmissionTypes));

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionsLoadedImplCopyWith<_$OptionsLoadedImpl> get copyWith =>
      __$$OptionsLoadedImplCopyWithImpl<_$OptionsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VehicleModelResponse response) loaded,
    required TResult Function(String message) error,
    required TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)
        optionsLoaded,
    required TResult Function(VehicleModel model) oneLoaded,
    required TResult Function() created,
    required TResult Function() updated,
  }) {
    return optionsLoaded(fuelTypes, transmissionTypes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult? Function(VehicleModel model)? oneLoaded,
    TResult? Function()? created,
    TResult? Function()? updated,
  }) {
    return optionsLoaded?.call(fuelTypes, transmissionTypes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
    TResult Function(String message)? error,
    TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult Function(VehicleModel model)? oneLoaded,
    TResult Function()? created,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (optionsLoaded != null) {
      return optionsLoaded(fuelTypes, transmissionTypes);
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
    required TResult Function(_OptionsLoaded value) optionsLoaded,
    required TResult Function(_OneLoaded value) oneLoaded,
    required TResult Function(_Created value) created,
    required TResult Function(_Updated value) updated,
  }) {
    return optionsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_OptionsLoaded value)? optionsLoaded,
    TResult? Function(_OneLoaded value)? oneLoaded,
    TResult? Function(_Created value)? created,
    TResult? Function(_Updated value)? updated,
  }) {
    return optionsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_OptionsLoaded value)? optionsLoaded,
    TResult Function(_OneLoaded value)? oneLoaded,
    TResult Function(_Created value)? created,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (optionsLoaded != null) {
      return optionsLoaded(this);
    }
    return orElse();
  }
}

abstract class _OptionsLoaded implements VehicleModelState {
  const factory _OptionsLoaded(
          {required final List<FuelType> fuelTypes,
          required final List<TransmissionType> transmissionTypes}) =
      _$OptionsLoadedImpl;

  List<FuelType> get fuelTypes;
  List<TransmissionType> get transmissionTypes;

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionsLoadedImplCopyWith<_$OptionsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OneLoadedImplCopyWith<$Res> {
  factory _$$OneLoadedImplCopyWith(
          _$OneLoadedImpl value, $Res Function(_$OneLoadedImpl) then) =
      __$$OneLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleModel model});

  $VehicleModelCopyWith<$Res> get model;
}

/// @nodoc
class __$$OneLoadedImplCopyWithImpl<$Res>
    extends _$VehicleModelStateCopyWithImpl<$Res, _$OneLoadedImpl>
    implements _$$OneLoadedImplCopyWith<$Res> {
  __$$OneLoadedImplCopyWithImpl(
      _$OneLoadedImpl _value, $Res Function(_$OneLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$OneLoadedImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as VehicleModel,
    ));
  }

  /// Create a copy of VehicleModelState
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

class _$OneLoadedImpl implements _OneLoaded {
  const _$OneLoadedImpl(this.model);

  @override
  final VehicleModel model;

  @override
  String toString() {
    return 'VehicleModelState.oneLoaded(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneLoadedImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OneLoadedImplCopyWith<_$OneLoadedImpl> get copyWith =>
      __$$OneLoadedImplCopyWithImpl<_$OneLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VehicleModelResponse response) loaded,
    required TResult Function(String message) error,
    required TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)
        optionsLoaded,
    required TResult Function(VehicleModel model) oneLoaded,
    required TResult Function() created,
    required TResult Function() updated,
  }) {
    return oneLoaded(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult? Function(VehicleModel model)? oneLoaded,
    TResult? Function()? created,
    TResult? Function()? updated,
  }) {
    return oneLoaded?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
    TResult Function(String message)? error,
    TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult Function(VehicleModel model)? oneLoaded,
    TResult Function()? created,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (oneLoaded != null) {
      return oneLoaded(model);
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
    required TResult Function(_OptionsLoaded value) optionsLoaded,
    required TResult Function(_OneLoaded value) oneLoaded,
    required TResult Function(_Created value) created,
    required TResult Function(_Updated value) updated,
  }) {
    return oneLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_OptionsLoaded value)? optionsLoaded,
    TResult? Function(_OneLoaded value)? oneLoaded,
    TResult? Function(_Created value)? created,
    TResult? Function(_Updated value)? updated,
  }) {
    return oneLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_OptionsLoaded value)? optionsLoaded,
    TResult Function(_OneLoaded value)? oneLoaded,
    TResult Function(_Created value)? created,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (oneLoaded != null) {
      return oneLoaded(this);
    }
    return orElse();
  }
}

abstract class _OneLoaded implements VehicleModelState {
  const factory _OneLoaded(final VehicleModel model) = _$OneLoadedImpl;

  VehicleModel get model;

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OneLoadedImplCopyWith<_$OneLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatedImplCopyWith<$Res> {
  factory _$$CreatedImplCopyWith(
          _$CreatedImpl value, $Res Function(_$CreatedImpl) then) =
      __$$CreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatedImplCopyWithImpl<$Res>
    extends _$VehicleModelStateCopyWithImpl<$Res, _$CreatedImpl>
    implements _$$CreatedImplCopyWith<$Res> {
  __$$CreatedImplCopyWithImpl(
      _$CreatedImpl _value, $Res Function(_$CreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreatedImpl implements _Created {
  const _$CreatedImpl();

  @override
  String toString() {
    return 'VehicleModelState.created()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatedImpl);
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
    required TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)
        optionsLoaded,
    required TResult Function(VehicleModel model) oneLoaded,
    required TResult Function() created,
    required TResult Function() updated,
  }) {
    return created();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult? Function(VehicleModel model)? oneLoaded,
    TResult? Function()? created,
    TResult? Function()? updated,
  }) {
    return created?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
    TResult Function(String message)? error,
    TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult Function(VehicleModel model)? oneLoaded,
    TResult Function()? created,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created();
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
    required TResult Function(_OptionsLoaded value) optionsLoaded,
    required TResult Function(_OneLoaded value) oneLoaded,
    required TResult Function(_Created value) created,
    required TResult Function(_Updated value) updated,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_OptionsLoaded value)? optionsLoaded,
    TResult? Function(_OneLoaded value)? oneLoaded,
    TResult? Function(_Created value)? created,
    TResult? Function(_Updated value)? updated,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_OptionsLoaded value)? optionsLoaded,
    TResult Function(_OneLoaded value)? oneLoaded,
    TResult Function(_Created value)? created,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class _Created implements VehicleModelState {
  const factory _Created() = _$CreatedImpl;
}

/// @nodoc
abstract class _$$UpdatedImplCopyWith<$Res> {
  factory _$$UpdatedImplCopyWith(
          _$UpdatedImpl value, $Res Function(_$UpdatedImpl) then) =
      __$$UpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatedImplCopyWithImpl<$Res>
    extends _$VehicleModelStateCopyWithImpl<$Res, _$UpdatedImpl>
    implements _$$UpdatedImplCopyWith<$Res> {
  __$$UpdatedImplCopyWithImpl(
      _$UpdatedImpl _value, $Res Function(_$UpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdatedImpl implements _Updated {
  const _$UpdatedImpl();

  @override
  String toString() {
    return 'VehicleModelState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdatedImpl);
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
    required TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)
        optionsLoaded,
    required TResult Function(VehicleModel model) oneLoaded,
    required TResult Function() created,
    required TResult Function() updated,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VehicleModelResponse response)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult? Function(VehicleModel model)? oneLoaded,
    TResult? Function()? created,
    TResult? Function()? updated,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VehicleModelResponse response)? loaded,
    TResult Function(String message)? error,
    TResult Function(
            List<FuelType> fuelTypes, List<TransmissionType> transmissionTypes)?
        optionsLoaded,
    TResult Function(VehicleModel model)? oneLoaded,
    TResult Function()? created,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_OptionsLoaded value) optionsLoaded,
    required TResult Function(_OneLoaded value) oneLoaded,
    required TResult Function(_Created value) created,
    required TResult Function(_Updated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_OptionsLoaded value)? optionsLoaded,
    TResult? Function(_OneLoaded value)? oneLoaded,
    TResult? Function(_Created value)? created,
    TResult? Function(_Updated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_OptionsLoaded value)? optionsLoaded,
    TResult Function(_OneLoaded value)? oneLoaded,
    TResult Function(_Created value)? created,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _Updated implements VehicleModelState {
  const factory _Updated() = _$UpdatedImpl;
}
