// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) {
  return _VehicleModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleModel {
  @JsonKey(name: '_id')
  String? get id =>
      throw _privateConstructorUsedError; // These are required in your UI, but backend may send null on fresh create
  @JsonKey(defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;
  VehicleManufacturer get manufacturer => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get vehicleType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get launchYear => throw _privateConstructorUsedError;
  String? get segment => throw _privateConstructorUsedError;
  String? get bodyType =>
      throw _privateConstructorUsedError; // Sanitize possible nulls inside arrays
  @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
  List<String>? get images => throw _privateConstructorUsedError;
  String? get brochureUrl => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get variantCount => throw _privateConstructorUsedError;
  PriceRange? get priceRange => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
  List<String>? get availableFuelTypes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
  List<String>? get availableTransmissionTypes =>
      throw _privateConstructorUsedError;
  bool? get isCommercialVehicle => throw _privateConstructorUsedError;
  String? get commercialVehicleType => throw _privateConstructorUsedError;
  String? get commercialBodyType => throw _privateConstructorUsedError;
  int? get defaultPayloadCapacity => throw _privateConstructorUsedError;
  String? get defaultPayloadUnit => throw _privateConstructorUsedError;
  int? get defaultAxleCount => throw _privateConstructorUsedError;
  int? get defaultSeatingCapacity => throw _privateConstructorUsedError;

  /// Serializes this VehicleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleModelCopyWith<VehicleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelCopyWith<$Res> {
  factory $VehicleModelCopyWith(
          VehicleModel value, $Res Function(VehicleModel) then) =
      _$VehicleModelCopyWithImpl<$Res, VehicleModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(defaultValue: '') String name,
      @JsonKey(defaultValue: '') String displayName,
      VehicleManufacturer manufacturer,
      @JsonKey(defaultValue: '') String vehicleType,
      String? description,
      int? launchYear,
      String? segment,
      String? bodyType,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      List<String>? images,
      String? brochureUrl,
      bool? isActive,
      int? variantCount,
      PriceRange? priceRange,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      List<String>? availableFuelTypes,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      List<String>? availableTransmissionTypes,
      bool? isCommercialVehicle,
      String? commercialVehicleType,
      String? commercialBodyType,
      int? defaultPayloadCapacity,
      String? defaultPayloadUnit,
      int? defaultAxleCount,
      int? defaultSeatingCapacity});

  $VehicleManufacturerCopyWith<$Res> get manufacturer;
  $PriceRangeCopyWith<$Res>? get priceRange;
}

/// @nodoc
class _$VehicleModelCopyWithImpl<$Res, $Val extends VehicleModel>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? displayName = null,
    Object? manufacturer = null,
    Object? vehicleType = null,
    Object? description = freezed,
    Object? launchYear = freezed,
    Object? segment = freezed,
    Object? bodyType = freezed,
    Object? images = freezed,
    Object? brochureUrl = freezed,
    Object? isActive = freezed,
    Object? variantCount = freezed,
    Object? priceRange = freezed,
    Object? availableFuelTypes = freezed,
    Object? availableTransmissionTypes = freezed,
    Object? isCommercialVehicle = freezed,
    Object? commercialVehicleType = freezed,
    Object? commercialBodyType = freezed,
    Object? defaultPayloadCapacity = freezed,
    Object? defaultPayloadUnit = freezed,
    Object? defaultAxleCount = freezed,
    Object? defaultSeatingCapacity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as VehicleManufacturer,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      launchYear: freezed == launchYear
          ? _value.launchYear
          : launchYear // ignore: cast_nullable_to_non_nullable
              as int?,
      segment: freezed == segment
          ? _value.segment
          : segment // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      brochureUrl: freezed == brochureUrl
          ? _value.brochureUrl
          : brochureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      variantCount: freezed == variantCount
          ? _value.variantCount
          : variantCount // ignore: cast_nullable_to_non_nullable
              as int?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRange?,
      availableFuelTypes: freezed == availableFuelTypes
          ? _value.availableFuelTypes
          : availableFuelTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      availableTransmissionTypes: freezed == availableTransmissionTypes
          ? _value.availableTransmissionTypes
          : availableTransmissionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isCommercialVehicle: freezed == isCommercialVehicle
          ? _value.isCommercialVehicle
          : isCommercialVehicle // ignore: cast_nullable_to_non_nullable
              as bool?,
      commercialVehicleType: freezed == commercialVehicleType
          ? _value.commercialVehicleType
          : commercialVehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      commercialBodyType: freezed == commercialBodyType
          ? _value.commercialBodyType
          : commercialBodyType // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultPayloadCapacity: freezed == defaultPayloadCapacity
          ? _value.defaultPayloadCapacity
          : defaultPayloadCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultPayloadUnit: freezed == defaultPayloadUnit
          ? _value.defaultPayloadUnit
          : defaultPayloadUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAxleCount: freezed == defaultAxleCount
          ? _value.defaultAxleCount
          : defaultAxleCount // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultSeatingCapacity: freezed == defaultSeatingCapacity
          ? _value.defaultSeatingCapacity
          : defaultSeatingCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleManufacturerCopyWith<$Res> get manufacturer {
    return $VehicleManufacturerCopyWith<$Res>(_value.manufacturer, (value) {
      return _then(_value.copyWith(manufacturer: value) as $Val);
    });
  }

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PriceRangeCopyWith<$Res>? get priceRange {
    if (_value.priceRange == null) {
      return null;
    }

    return $PriceRangeCopyWith<$Res>(_value.priceRange!, (value) {
      return _then(_value.copyWith(priceRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleModelImplCopyWith<$Res>
    implements $VehicleModelCopyWith<$Res> {
  factory _$$VehicleModelImplCopyWith(
          _$VehicleModelImpl value, $Res Function(_$VehicleModelImpl) then) =
      __$$VehicleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(defaultValue: '') String name,
      @JsonKey(defaultValue: '') String displayName,
      VehicleManufacturer manufacturer,
      @JsonKey(defaultValue: '') String vehicleType,
      String? description,
      int? launchYear,
      String? segment,
      String? bodyType,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      List<String>? images,
      String? brochureUrl,
      bool? isActive,
      int? variantCount,
      PriceRange? priceRange,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      List<String>? availableFuelTypes,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      List<String>? availableTransmissionTypes,
      bool? isCommercialVehicle,
      String? commercialVehicleType,
      String? commercialBodyType,
      int? defaultPayloadCapacity,
      String? defaultPayloadUnit,
      int? defaultAxleCount,
      int? defaultSeatingCapacity});

  @override
  $VehicleManufacturerCopyWith<$Res> get manufacturer;
  @override
  $PriceRangeCopyWith<$Res>? get priceRange;
}

/// @nodoc
class __$$VehicleModelImplCopyWithImpl<$Res>
    extends _$VehicleModelCopyWithImpl<$Res, _$VehicleModelImpl>
    implements _$$VehicleModelImplCopyWith<$Res> {
  __$$VehicleModelImplCopyWithImpl(
      _$VehicleModelImpl _value, $Res Function(_$VehicleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? displayName = null,
    Object? manufacturer = null,
    Object? vehicleType = null,
    Object? description = freezed,
    Object? launchYear = freezed,
    Object? segment = freezed,
    Object? bodyType = freezed,
    Object? images = freezed,
    Object? brochureUrl = freezed,
    Object? isActive = freezed,
    Object? variantCount = freezed,
    Object? priceRange = freezed,
    Object? availableFuelTypes = freezed,
    Object? availableTransmissionTypes = freezed,
    Object? isCommercialVehicle = freezed,
    Object? commercialVehicleType = freezed,
    Object? commercialBodyType = freezed,
    Object? defaultPayloadCapacity = freezed,
    Object? defaultPayloadUnit = freezed,
    Object? defaultAxleCount = freezed,
    Object? defaultSeatingCapacity = freezed,
  }) {
    return _then(_$VehicleModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as VehicleManufacturer,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      launchYear: freezed == launchYear
          ? _value.launchYear
          : launchYear // ignore: cast_nullable_to_non_nullable
              as int?,
      segment: freezed == segment
          ? _value.segment
          : segment // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      brochureUrl: freezed == brochureUrl
          ? _value.brochureUrl
          : brochureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      variantCount: freezed == variantCount
          ? _value.variantCount
          : variantCount // ignore: cast_nullable_to_non_nullable
              as int?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRange?,
      availableFuelTypes: freezed == availableFuelTypes
          ? _value._availableFuelTypes
          : availableFuelTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      availableTransmissionTypes: freezed == availableTransmissionTypes
          ? _value._availableTransmissionTypes
          : availableTransmissionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isCommercialVehicle: freezed == isCommercialVehicle
          ? _value.isCommercialVehicle
          : isCommercialVehicle // ignore: cast_nullable_to_non_nullable
              as bool?,
      commercialVehicleType: freezed == commercialVehicleType
          ? _value.commercialVehicleType
          : commercialVehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      commercialBodyType: freezed == commercialBodyType
          ? _value.commercialBodyType
          : commercialBodyType // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultPayloadCapacity: freezed == defaultPayloadCapacity
          ? _value.defaultPayloadCapacity
          : defaultPayloadCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultPayloadUnit: freezed == defaultPayloadUnit
          ? _value.defaultPayloadUnit
          : defaultPayloadUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAxleCount: freezed == defaultAxleCount
          ? _value.defaultAxleCount
          : defaultAxleCount // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultSeatingCapacity: freezed == defaultSeatingCapacity
          ? _value.defaultSeatingCapacity
          : defaultSeatingCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$VehicleModelImpl implements _VehicleModel {
  const _$VehicleModelImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(defaultValue: '') required this.name,
      @JsonKey(defaultValue: '') required this.displayName,
      required this.manufacturer,
      @JsonKey(defaultValue: '') required this.vehicleType,
      this.description,
      this.launchYear,
      this.segment,
      this.bodyType,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      final List<String>? images,
      this.brochureUrl,
      this.isActive,
      this.variantCount,
      this.priceRange,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      final List<String>? availableFuelTypes,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      final List<String>? availableTransmissionTypes,
      this.isCommercialVehicle,
      this.commercialVehicleType,
      this.commercialBodyType,
      this.defaultPayloadCapacity,
      this.defaultPayloadUnit,
      this.defaultAxleCount,
      this.defaultSeatingCapacity})
      : _images = images,
        _availableFuelTypes = availableFuelTypes,
        _availableTransmissionTypes = availableTransmissionTypes;

  factory _$VehicleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
// These are required in your UI, but backend may send null on fresh create
  @override
  @JsonKey(defaultValue: '')
  final String name;
  @override
  @JsonKey(defaultValue: '')
  final String displayName;
  @override
  final VehicleManufacturer manufacturer;
  @override
  @JsonKey(defaultValue: '')
  final String vehicleType;
  @override
  final String? description;
  @override
  final int? launchYear;
  @override
  final String? segment;
  @override
  final String? bodyType;
// Sanitize possible nulls inside arrays
  final List<String>? _images;
// Sanitize possible nulls inside arrays
  @override
  @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? brochureUrl;
  @override
  final bool? isActive;
  @override
  final int? variantCount;
  @override
  final PriceRange? priceRange;
  final List<String>? _availableFuelTypes;
  @override
  @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
  List<String>? get availableFuelTypes {
    final value = _availableFuelTypes;
    if (value == null) return null;
    if (_availableFuelTypes is EqualUnmodifiableListView)
      return _availableFuelTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _availableTransmissionTypes;
  @override
  @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
  List<String>? get availableTransmissionTypes {
    final value = _availableTransmissionTypes;
    if (value == null) return null;
    if (_availableTransmissionTypes is EqualUnmodifiableListView)
      return _availableTransmissionTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isCommercialVehicle;
  @override
  final String? commercialVehicleType;
  @override
  final String? commercialBodyType;
  @override
  final int? defaultPayloadCapacity;
  @override
  final String? defaultPayloadUnit;
  @override
  final int? defaultAxleCount;
  @override
  final int? defaultSeatingCapacity;

  @override
  String toString() {
    return 'VehicleModel(id: $id, name: $name, displayName: $displayName, manufacturer: $manufacturer, vehicleType: $vehicleType, description: $description, launchYear: $launchYear, segment: $segment, bodyType: $bodyType, images: $images, brochureUrl: $brochureUrl, isActive: $isActive, variantCount: $variantCount, priceRange: $priceRange, availableFuelTypes: $availableFuelTypes, availableTransmissionTypes: $availableTransmissionTypes, isCommercialVehicle: $isCommercialVehicle, commercialVehicleType: $commercialVehicleType, commercialBodyType: $commercialBodyType, defaultPayloadCapacity: $defaultPayloadCapacity, defaultPayloadUnit: $defaultPayloadUnit, defaultAxleCount: $defaultAxleCount, defaultSeatingCapacity: $defaultSeatingCapacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.launchYear, launchYear) ||
                other.launchYear == launchYear) &&
            (identical(other.segment, segment) || other.segment == segment) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.brochureUrl, brochureUrl) ||
                other.brochureUrl == brochureUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.variantCount, variantCount) ||
                other.variantCount == variantCount) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            const DeepCollectionEquality()
                .equals(other._availableFuelTypes, _availableFuelTypes) &&
            const DeepCollectionEquality().equals(
                other._availableTransmissionTypes,
                _availableTransmissionTypes) &&
            (identical(other.isCommercialVehicle, isCommercialVehicle) ||
                other.isCommercialVehicle == isCommercialVehicle) &&
            (identical(other.commercialVehicleType, commercialVehicleType) ||
                other.commercialVehicleType == commercialVehicleType) &&
            (identical(other.commercialBodyType, commercialBodyType) ||
                other.commercialBodyType == commercialBodyType) &&
            (identical(other.defaultPayloadCapacity, defaultPayloadCapacity) ||
                other.defaultPayloadCapacity == defaultPayloadCapacity) &&
            (identical(other.defaultPayloadUnit, defaultPayloadUnit) ||
                other.defaultPayloadUnit == defaultPayloadUnit) &&
            (identical(other.defaultAxleCount, defaultAxleCount) ||
                other.defaultAxleCount == defaultAxleCount) &&
            (identical(other.defaultSeatingCapacity, defaultSeatingCapacity) ||
                other.defaultSeatingCapacity == defaultSeatingCapacity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        displayName,
        manufacturer,
        vehicleType,
        description,
        launchYear,
        segment,
        bodyType,
        const DeepCollectionEquality().hash(_images),
        brochureUrl,
        isActive,
        variantCount,
        priceRange,
        const DeepCollectionEquality().hash(_availableFuelTypes),
        const DeepCollectionEquality().hash(_availableTransmissionTypes),
        isCommercialVehicle,
        commercialVehicleType,
        commercialBodyType,
        defaultPayloadCapacity,
        defaultPayloadUnit,
        defaultAxleCount,
        defaultSeatingCapacity
      ]);

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleModelImplCopyWith<_$VehicleModelImpl> get copyWith =>
      __$$VehicleModelImplCopyWithImpl<_$VehicleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleModelImplToJson(
      this,
    );
  }
}

abstract class _VehicleModel implements VehicleModel {
  const factory _VehicleModel(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(defaultValue: '') required final String name,
      @JsonKey(defaultValue: '') required final String displayName,
      required final VehicleManufacturer manufacturer,
      @JsonKey(defaultValue: '') required final String vehicleType,
      final String? description,
      final int? launchYear,
      final String? segment,
      final String? bodyType,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      final List<String>? images,
      final String? brochureUrl,
      final bool? isActive,
      final int? variantCount,
      final PriceRange? priceRange,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      final List<String>? availableFuelTypes,
      @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
      final List<String>? availableTransmissionTypes,
      final bool? isCommercialVehicle,
      final String? commercialVehicleType,
      final String? commercialBodyType,
      final int? defaultPayloadCapacity,
      final String? defaultPayloadUnit,
      final int? defaultAxleCount,
      final int? defaultSeatingCapacity}) = _$VehicleModelImpl;

  factory _VehicleModel.fromJson(Map<String, dynamic> json) =
      _$VehicleModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String?
      get id; // These are required in your UI, but backend may send null on fresh create
  @override
  @JsonKey(defaultValue: '')
  String get name;
  @override
  @JsonKey(defaultValue: '')
  String get displayName;
  @override
  VehicleManufacturer get manufacturer;
  @override
  @JsonKey(defaultValue: '')
  String get vehicleType;
  @override
  String? get description;
  @override
  int? get launchYear;
  @override
  String? get segment;
  @override
  String? get bodyType; // Sanitize possible nulls inside arrays
  @override
  @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
  List<String>? get images;
  @override
  String? get brochureUrl;
  @override
  bool? get isActive;
  @override
  int? get variantCount;
  @override
  PriceRange? get priceRange;
  @override
  @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
  List<String>? get availableFuelTypes;
  @override
  @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
  List<String>? get availableTransmissionTypes;
  @override
  bool? get isCommercialVehicle;
  @override
  String? get commercialVehicleType;
  @override
  String? get commercialBodyType;
  @override
  int? get defaultPayloadCapacity;
  @override
  String? get defaultPayloadUnit;
  @override
  int? get defaultAxleCount;
  @override
  int? get defaultSeatingCapacity;

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleModelImplCopyWith<_$VehicleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VehicleModelResponse _$VehicleModelResponseFromJson(Map<String, dynamic> json) {
  return _VehicleModelResponse.fromJson(json);
}

/// @nodoc
mixin _$VehicleModelResponse {
  List<VehicleModel> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  bool get hasPrev => throw _privateConstructorUsedError;

  /// Serializes this VehicleModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleModelResponseCopyWith<VehicleModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelResponseCopyWith<$Res> {
  factory $VehicleModelResponseCopyWith(VehicleModelResponse value,
          $Res Function(VehicleModelResponse) then) =
      _$VehicleModelResponseCopyWithImpl<$Res, VehicleModelResponse>;
  @useResult
  $Res call(
      {List<VehicleModel> data,
      int total,
      int page,
      int limit,
      int totalPages,
      bool hasNext,
      bool hasPrev});
}

/// @nodoc
class _$VehicleModelResponseCopyWithImpl<$Res,
        $Val extends VehicleModelResponse>
    implements $VehicleModelResponseCopyWith<$Res> {
  _$VehicleModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrev = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VehicleModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrev: null == hasPrev
          ? _value.hasPrev
          : hasPrev // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleModelResponseImplCopyWith<$Res>
    implements $VehicleModelResponseCopyWith<$Res> {
  factory _$$VehicleModelResponseImplCopyWith(_$VehicleModelResponseImpl value,
          $Res Function(_$VehicleModelResponseImpl) then) =
      __$$VehicleModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<VehicleModel> data,
      int total,
      int page,
      int limit,
      int totalPages,
      bool hasNext,
      bool hasPrev});
}

/// @nodoc
class __$$VehicleModelResponseImplCopyWithImpl<$Res>
    extends _$VehicleModelResponseCopyWithImpl<$Res, _$VehicleModelResponseImpl>
    implements _$$VehicleModelResponseImplCopyWith<$Res> {
  __$$VehicleModelResponseImplCopyWithImpl(_$VehicleModelResponseImpl _value,
      $Res Function(_$VehicleModelResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrev = null,
  }) {
    return _then(_$VehicleModelResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VehicleModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrev: null == hasPrev
          ? _value.hasPrev
          : hasPrev // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$VehicleModelResponseImpl implements _VehicleModelResponse {
  const _$VehicleModelResponseImpl(
      {required final List<VehicleModel> data,
      required this.total,
      required this.page,
      required this.limit,
      required this.totalPages,
      required this.hasNext,
      required this.hasPrev})
      : _data = data;

  factory _$VehicleModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleModelResponseImplFromJson(json);

  final List<VehicleModel> _data;
  @override
  List<VehicleModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int limit;
  @override
  final int totalPages;
  @override
  final bool hasNext;
  @override
  final bool hasPrev;

  @override
  String toString() {
    return 'VehicleModelResponse(data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleModelResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      total,
      page,
      limit,
      totalPages,
      hasNext,
      hasPrev);

  /// Create a copy of VehicleModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleModelResponseImplCopyWith<_$VehicleModelResponseImpl>
      get copyWith =>
          __$$VehicleModelResponseImplCopyWithImpl<_$VehicleModelResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleModelResponseImplToJson(
      this,
    );
  }
}

abstract class _VehicleModelResponse implements VehicleModelResponse {
  const factory _VehicleModelResponse(
      {required final List<VehicleModel> data,
      required final int total,
      required final int page,
      required final int limit,
      required final int totalPages,
      required final bool hasNext,
      required final bool hasPrev}) = _$VehicleModelResponseImpl;

  factory _VehicleModelResponse.fromJson(Map<String, dynamic> json) =
      _$VehicleModelResponseImpl.fromJson;

  @override
  List<VehicleModel> get data;
  @override
  int get total;
  @override
  int get page;
  @override
  int get limit;
  @override
  int get totalPages;
  @override
  bool get hasNext;
  @override
  bool get hasPrev;

  /// Create a copy of VehicleModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleModelResponseImplCopyWith<_$VehicleModelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PriceRange _$PriceRangeFromJson(Map<String, dynamic> json) {
  return _PriceRange.fromJson(json);
}

/// @nodoc
mixin _$PriceRange {
  int? get min => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;

  /// Serializes this PriceRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceRangeCopyWith<PriceRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRangeCopyWith<$Res> {
  factory $PriceRangeCopyWith(
          PriceRange value, $Res Function(PriceRange) then) =
      _$PriceRangeCopyWithImpl<$Res, PriceRange>;
  @useResult
  $Res call({int? min, int? max});
}

/// @nodoc
class _$PriceRangeCopyWithImpl<$Res, $Val extends PriceRange>
    implements $PriceRangeCopyWith<$Res> {
  _$PriceRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_value.copyWith(
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceRangeImplCopyWith<$Res>
    implements $PriceRangeCopyWith<$Res> {
  factory _$$PriceRangeImplCopyWith(
          _$PriceRangeImpl value, $Res Function(_$PriceRangeImpl) then) =
      __$$PriceRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? min, int? max});
}

/// @nodoc
class __$$PriceRangeImplCopyWithImpl<$Res>
    extends _$PriceRangeCopyWithImpl<$Res, _$PriceRangeImpl>
    implements _$$PriceRangeImplCopyWith<$Res> {
  __$$PriceRangeImplCopyWithImpl(
      _$PriceRangeImpl _value, $Res Function(_$PriceRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_$PriceRangeImpl(
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceRangeImpl implements _PriceRange {
  const _$PriceRangeImpl({this.min, this.max});

  factory _$PriceRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceRangeImplFromJson(json);

  @override
  final int? min;
  @override
  final int? max;

  @override
  String toString() {
    return 'PriceRange(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceRangeImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceRangeImplCopyWith<_$PriceRangeImpl> get copyWith =>
      __$$PriceRangeImplCopyWithImpl<_$PriceRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceRangeImplToJson(
      this,
    );
  }
}

abstract class _PriceRange implements PriceRange {
  const factory _PriceRange({final int? min, final int? max}) =
      _$PriceRangeImpl;

  factory _PriceRange.fromJson(Map<String, dynamic> json) =
      _$PriceRangeImpl.fromJson;

  @override
  int? get min;
  @override
  int? get max;

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceRangeImplCopyWith<_$PriceRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
