// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VariantModel _$VariantModelFromJson(Map<String, dynamic> json) {
  return _VariantModel.fromJson(json);
}

/// @nodoc
mixin _$VariantModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  VehicleModel get vehicleModel => throw _privateConstructorUsedError;
  FuelType? get fuelType => throw _privateConstructorUsedError;
  TransmissionType? get transmissionType => throw _privateConstructorUsedError;
  String? get featurePackage => throw _privateConstructorUsedError;
  EngineSpecs? get engineSpecs => throw _privateConstructorUsedError;
  PerformanceSpecs? get performanceSpecs => throw _privateConstructorUsedError;
  int? get seatingCapacity => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this VariantModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariantModelCopyWith<VariantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantModelCopyWith<$Res> {
  factory $VariantModelCopyWith(
          VariantModel value, $Res Function(VariantModel) then) =
      _$VariantModelCopyWithImpl<$Res, VariantModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String displayName,
      VehicleModel vehicleModel,
      FuelType? fuelType,
      TransmissionType? transmissionType,
      String? featurePackage,
      EngineSpecs? engineSpecs,
      PerformanceSpecs? performanceSpecs,
      int? seatingCapacity,
      int? price,
      bool isActive,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt});

  $VehicleModelCopyWith<$Res> get vehicleModel;
  $FuelTypeCopyWith<$Res>? get fuelType;
  $TransmissionTypeCopyWith<$Res>? get transmissionType;
  $EngineSpecsCopyWith<$Res>? get engineSpecs;
  $PerformanceSpecsCopyWith<$Res>? get performanceSpecs;
}

/// @nodoc
class _$VariantModelCopyWithImpl<$Res, $Val extends VariantModel>
    implements $VariantModelCopyWith<$Res> {
  _$VariantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? displayName = null,
    Object? vehicleModel = null,
    Object? fuelType = freezed,
    Object? transmissionType = freezed,
    Object? featurePackage = freezed,
    Object? engineSpecs = freezed,
    Object? performanceSpecs = freezed,
    Object? seatingCapacity = freezed,
    Object? price = freezed,
    Object? isActive = null,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as VehicleModel,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as FuelType?,
      transmissionType: freezed == transmissionType
          ? _value.transmissionType
          : transmissionType // ignore: cast_nullable_to_non_nullable
              as TransmissionType?,
      featurePackage: freezed == featurePackage
          ? _value.featurePackage
          : featurePackage // ignore: cast_nullable_to_non_nullable
              as String?,
      engineSpecs: freezed == engineSpecs
          ? _value.engineSpecs
          : engineSpecs // ignore: cast_nullable_to_non_nullable
              as EngineSpecs?,
      performanceSpecs: freezed == performanceSpecs
          ? _value.performanceSpecs
          : performanceSpecs // ignore: cast_nullable_to_non_nullable
              as PerformanceSpecs?,
      seatingCapacity: freezed == seatingCapacity
          ? _value.seatingCapacity
          : seatingCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleModelCopyWith<$Res> get vehicleModel {
    return $VehicleModelCopyWith<$Res>(_value.vehicleModel, (value) {
      return _then(_value.copyWith(vehicleModel: value) as $Val);
    });
  }

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FuelTypeCopyWith<$Res>? get fuelType {
    if (_value.fuelType == null) {
      return null;
    }

    return $FuelTypeCopyWith<$Res>(_value.fuelType!, (value) {
      return _then(_value.copyWith(fuelType: value) as $Val);
    });
  }

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransmissionTypeCopyWith<$Res>? get transmissionType {
    if (_value.transmissionType == null) {
      return null;
    }

    return $TransmissionTypeCopyWith<$Res>(_value.transmissionType!, (value) {
      return _then(_value.copyWith(transmissionType: value) as $Val);
    });
  }

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EngineSpecsCopyWith<$Res>? get engineSpecs {
    if (_value.engineSpecs == null) {
      return null;
    }

    return $EngineSpecsCopyWith<$Res>(_value.engineSpecs!, (value) {
      return _then(_value.copyWith(engineSpecs: value) as $Val);
    });
  }

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PerformanceSpecsCopyWith<$Res>? get performanceSpecs {
    if (_value.performanceSpecs == null) {
      return null;
    }

    return $PerformanceSpecsCopyWith<$Res>(_value.performanceSpecs!, (value) {
      return _then(_value.copyWith(performanceSpecs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VariantModelImplCopyWith<$Res>
    implements $VariantModelCopyWith<$Res> {
  factory _$$VariantModelImplCopyWith(
          _$VariantModelImpl value, $Res Function(_$VariantModelImpl) then) =
      __$$VariantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String displayName,
      VehicleModel vehicleModel,
      FuelType? fuelType,
      TransmissionType? transmissionType,
      String? featurePackage,
      EngineSpecs? engineSpecs,
      PerformanceSpecs? performanceSpecs,
      int? seatingCapacity,
      int? price,
      bool isActive,
      bool? isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $VehicleModelCopyWith<$Res> get vehicleModel;
  @override
  $FuelTypeCopyWith<$Res>? get fuelType;
  @override
  $TransmissionTypeCopyWith<$Res>? get transmissionType;
  @override
  $EngineSpecsCopyWith<$Res>? get engineSpecs;
  @override
  $PerformanceSpecsCopyWith<$Res>? get performanceSpecs;
}

/// @nodoc
class __$$VariantModelImplCopyWithImpl<$Res>
    extends _$VariantModelCopyWithImpl<$Res, _$VariantModelImpl>
    implements _$$VariantModelImplCopyWith<$Res> {
  __$$VariantModelImplCopyWithImpl(
      _$VariantModelImpl _value, $Res Function(_$VariantModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? displayName = null,
    Object? vehicleModel = null,
    Object? fuelType = freezed,
    Object? transmissionType = freezed,
    Object? featurePackage = freezed,
    Object? engineSpecs = freezed,
    Object? performanceSpecs = freezed,
    Object? seatingCapacity = freezed,
    Object? price = freezed,
    Object? isActive = null,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$VariantModelImpl(
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
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as VehicleModel,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as FuelType?,
      transmissionType: freezed == transmissionType
          ? _value.transmissionType
          : transmissionType // ignore: cast_nullable_to_non_nullable
              as TransmissionType?,
      featurePackage: freezed == featurePackage
          ? _value.featurePackage
          : featurePackage // ignore: cast_nullable_to_non_nullable
              as String?,
      engineSpecs: freezed == engineSpecs
          ? _value.engineSpecs
          : engineSpecs // ignore: cast_nullable_to_non_nullable
              as EngineSpecs?,
      performanceSpecs: freezed == performanceSpecs
          ? _value.performanceSpecs
          : performanceSpecs // ignore: cast_nullable_to_non_nullable
              as PerformanceSpecs?,
      seatingCapacity: freezed == seatingCapacity
          ? _value.seatingCapacity
          : seatingCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariantModelImpl implements _VariantModel {
  const _$VariantModelImpl(
      {@JsonKey(name: '_id') this.id,
      required this.name,
      required this.displayName,
      required this.vehicleModel,
      this.fuelType,
      this.transmissionType,
      this.featurePackage,
      this.engineSpecs,
      this.performanceSpecs,
      this.seatingCapacity,
      this.price,
      required this.isActive,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  factory _$VariantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String name;
  @override
  final String displayName;
  @override
  final VehicleModel vehicleModel;
  @override
  final FuelType? fuelType;
  @override
  final TransmissionType? transmissionType;
  @override
  final String? featurePackage;
  @override
  final EngineSpecs? engineSpecs;
  @override
  final PerformanceSpecs? performanceSpecs;
  @override
  final int? seatingCapacity;
  @override
  final int? price;
  @override
  final bool isActive;
  @override
  final bool? isDeleted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'VariantModel(id: $id, name: $name, displayName: $displayName, vehicleModel: $vehicleModel, fuelType: $fuelType, transmissionType: $transmissionType, featurePackage: $featurePackage, engineSpecs: $engineSpecs, performanceSpecs: $performanceSpecs, seatingCapacity: $seatingCapacity, price: $price, isActive: $isActive, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.vehicleModel, vehicleModel) ||
                other.vehicleModel == vehicleModel) &&
            (identical(other.fuelType, fuelType) ||
                other.fuelType == fuelType) &&
            (identical(other.transmissionType, transmissionType) ||
                other.transmissionType == transmissionType) &&
            (identical(other.featurePackage, featurePackage) ||
                other.featurePackage == featurePackage) &&
            (identical(other.engineSpecs, engineSpecs) ||
                other.engineSpecs == engineSpecs) &&
            (identical(other.performanceSpecs, performanceSpecs) ||
                other.performanceSpecs == performanceSpecs) &&
            (identical(other.seatingCapacity, seatingCapacity) ||
                other.seatingCapacity == seatingCapacity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      displayName,
      vehicleModel,
      fuelType,
      transmissionType,
      featurePackage,
      engineSpecs,
      performanceSpecs,
      seatingCapacity,
      price,
      isActive,
      isDeleted,
      createdAt,
      updatedAt);

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantModelImplCopyWith<_$VariantModelImpl> get copyWith =>
      __$$VariantModelImplCopyWithImpl<_$VariantModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantModelImplToJson(
      this,
    );
  }
}

abstract class _VariantModel implements VariantModel {
  const factory _VariantModel(
      {@JsonKey(name: '_id') final String? id,
      required final String name,
      required final String displayName,
      required final VehicleModel vehicleModel,
      final FuelType? fuelType,
      final TransmissionType? transmissionType,
      final String? featurePackage,
      final EngineSpecs? engineSpecs,
      final PerformanceSpecs? performanceSpecs,
      final int? seatingCapacity,
      final int? price,
      required final bool isActive,
      final bool? isDeleted,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$VariantModelImpl;

  factory _VariantModel.fromJson(Map<String, dynamic> json) =
      _$VariantModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get name;
  @override
  String get displayName;
  @override
  VehicleModel get vehicleModel;
  @override
  FuelType? get fuelType;
  @override
  TransmissionType? get transmissionType;
  @override
  String? get featurePackage;
  @override
  EngineSpecs? get engineSpecs;
  @override
  PerformanceSpecs? get performanceSpecs;
  @override
  int? get seatingCapacity;
  @override
  int? get price;
  @override
  bool get isActive;
  @override
  bool? get isDeleted;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariantModelImplCopyWith<_$VariantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FuelType _$FuelTypeFromJson(Map<String, dynamic> json) {
  return _FuelType.fromJson(json);
}

/// @nodoc
mixin _$FuelType {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  /// Serializes this FuelType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FuelType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FuelTypeCopyWith<FuelType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FuelTypeCopyWith<$Res> {
  factory $FuelTypeCopyWith(FuelType value, $Res Function(FuelType) then) =
      _$FuelTypeCopyWithImpl<$Res, FuelType>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name, String displayName});
}

/// @nodoc
class _$FuelTypeCopyWithImpl<$Res, $Val extends FuelType>
    implements $FuelTypeCopyWith<$Res> {
  _$FuelTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FuelType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FuelTypeImplCopyWith<$Res>
    implements $FuelTypeCopyWith<$Res> {
  factory _$$FuelTypeImplCopyWith(
          _$FuelTypeImpl value, $Res Function(_$FuelTypeImpl) then) =
      __$$FuelTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name, String displayName});
}

/// @nodoc
class __$$FuelTypeImplCopyWithImpl<$Res>
    extends _$FuelTypeCopyWithImpl<$Res, _$FuelTypeImpl>
    implements _$$FuelTypeImplCopyWith<$Res> {
  __$$FuelTypeImplCopyWithImpl(
      _$FuelTypeImpl _value, $Res Function(_$FuelTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of FuelType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_$FuelTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FuelTypeImpl implements _FuelType {
  const _$FuelTypeImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.displayName});

  factory _$FuelTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$FuelTypeImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String displayName;

  @override
  String toString() {
    return 'FuelType(id: $id, name: $name, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuelTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName);

  /// Create a copy of FuelType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FuelTypeImplCopyWith<_$FuelTypeImpl> get copyWith =>
      __$$FuelTypeImplCopyWithImpl<_$FuelTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FuelTypeImplToJson(
      this,
    );
  }
}

abstract class _FuelType implements FuelType {
  const factory _FuelType(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String displayName}) = _$FuelTypeImpl;

  factory _FuelType.fromJson(Map<String, dynamic> json) =
      _$FuelTypeImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get displayName;

  /// Create a copy of FuelType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FuelTypeImplCopyWith<_$FuelTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransmissionType _$TransmissionTypeFromJson(Map<String, dynamic> json) {
  return _TransmissionType.fromJson(json);
}

/// @nodoc
mixin _$TransmissionType {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  /// Serializes this TransmissionType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransmissionType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransmissionTypeCopyWith<TransmissionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransmissionTypeCopyWith<$Res> {
  factory $TransmissionTypeCopyWith(
          TransmissionType value, $Res Function(TransmissionType) then) =
      _$TransmissionTypeCopyWithImpl<$Res, TransmissionType>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name, String displayName});
}

/// @nodoc
class _$TransmissionTypeCopyWithImpl<$Res, $Val extends TransmissionType>
    implements $TransmissionTypeCopyWith<$Res> {
  _$TransmissionTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransmissionType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransmissionTypeImplCopyWith<$Res>
    implements $TransmissionTypeCopyWith<$Res> {
  factory _$$TransmissionTypeImplCopyWith(_$TransmissionTypeImpl value,
          $Res Function(_$TransmissionTypeImpl) then) =
      __$$TransmissionTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name, String displayName});
}

/// @nodoc
class __$$TransmissionTypeImplCopyWithImpl<$Res>
    extends _$TransmissionTypeCopyWithImpl<$Res, _$TransmissionTypeImpl>
    implements _$$TransmissionTypeImplCopyWith<$Res> {
  __$$TransmissionTypeImplCopyWithImpl(_$TransmissionTypeImpl _value,
      $Res Function(_$TransmissionTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransmissionType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_$TransmissionTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransmissionTypeImpl implements _TransmissionType {
  const _$TransmissionTypeImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.displayName});

  factory _$TransmissionTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransmissionTypeImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String displayName;

  @override
  String toString() {
    return 'TransmissionType(id: $id, name: $name, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransmissionTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName);

  /// Create a copy of TransmissionType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransmissionTypeImplCopyWith<_$TransmissionTypeImpl> get copyWith =>
      __$$TransmissionTypeImplCopyWithImpl<_$TransmissionTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransmissionTypeImplToJson(
      this,
    );
  }
}

abstract class _TransmissionType implements TransmissionType {
  const factory _TransmissionType(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String displayName}) = _$TransmissionTypeImpl;

  factory _TransmissionType.fromJson(Map<String, dynamic> json) =
      _$TransmissionTypeImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get displayName;

  /// Create a copy of TransmissionType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransmissionTypeImplCopyWith<_$TransmissionTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VariantResponse _$VariantResponseFromJson(Map<String, dynamic> json) {
  return _VariantResponse.fromJson(json);
}

/// @nodoc
mixin _$VariantResponse {
  List<VariantModel> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  bool get hasPrev => throw _privateConstructorUsedError;

  /// Serializes this VariantResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VariantResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariantResponseCopyWith<VariantResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantResponseCopyWith<$Res> {
  factory $VariantResponseCopyWith(
          VariantResponse value, $Res Function(VariantResponse) then) =
      _$VariantResponseCopyWithImpl<$Res, VariantResponse>;
  @useResult
  $Res call(
      {List<VariantModel> data,
      int total,
      int page,
      int limit,
      int totalPages,
      bool hasNext,
      bool hasPrev});
}

/// @nodoc
class _$VariantResponseCopyWithImpl<$Res, $Val extends VariantResponse>
    implements $VariantResponseCopyWith<$Res> {
  _$VariantResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VariantResponse
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
              as List<VariantModel>,
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
abstract class _$$VariantResponseImplCopyWith<$Res>
    implements $VariantResponseCopyWith<$Res> {
  factory _$$VariantResponseImplCopyWith(_$VariantResponseImpl value,
          $Res Function(_$VariantResponseImpl) then) =
      __$$VariantResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<VariantModel> data,
      int total,
      int page,
      int limit,
      int totalPages,
      bool hasNext,
      bool hasPrev});
}

/// @nodoc
class __$$VariantResponseImplCopyWithImpl<$Res>
    extends _$VariantResponseCopyWithImpl<$Res, _$VariantResponseImpl>
    implements _$$VariantResponseImplCopyWith<$Res> {
  __$$VariantResponseImplCopyWithImpl(
      _$VariantResponseImpl _value, $Res Function(_$VariantResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VariantResponse
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
    return _then(_$VariantResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VariantModel>,
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
@JsonSerializable()
class _$VariantResponseImpl implements _VariantResponse {
  const _$VariantResponseImpl(
      {required final List<VariantModel> data,
      required this.total,
      required this.page,
      required this.limit,
      required this.totalPages,
      required this.hasNext,
      required this.hasPrev})
      : _data = data;

  factory _$VariantResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantResponseImplFromJson(json);

  final List<VariantModel> _data;
  @override
  List<VariantModel> get data {
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
    return 'VariantResponse(data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantResponseImpl &&
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

  /// Create a copy of VariantResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantResponseImplCopyWith<_$VariantResponseImpl> get copyWith =>
      __$$VariantResponseImplCopyWithImpl<_$VariantResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantResponseImplToJson(
      this,
    );
  }
}

abstract class _VariantResponse implements VariantResponse {
  const factory _VariantResponse(
      {required final List<VariantModel> data,
      required final int total,
      required final int page,
      required final int limit,
      required final int totalPages,
      required final bool hasNext,
      required final bool hasPrev}) = _$VariantResponseImpl;

  factory _VariantResponse.fromJson(Map<String, dynamic> json) =
      _$VariantResponseImpl.fromJson;

  @override
  List<VariantModel> get data;
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

  /// Create a copy of VariantResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariantResponseImplCopyWith<_$VariantResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EngineSpecs _$EngineSpecsFromJson(Map<String, dynamic> json) {
  return _EngineSpecs.fromJson(json);
}

/// @nodoc
mixin _$EngineSpecs {
  int get capacity => throw _privateConstructorUsedError;
  int get maxPower => throw _privateConstructorUsedError;
  int get maxTorque => throw _privateConstructorUsedError;

  /// Serializes this EngineSpecs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EngineSpecs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EngineSpecsCopyWith<EngineSpecs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EngineSpecsCopyWith<$Res> {
  factory $EngineSpecsCopyWith(
          EngineSpecs value, $Res Function(EngineSpecs) then) =
      _$EngineSpecsCopyWithImpl<$Res, EngineSpecs>;
  @useResult
  $Res call({int capacity, int maxPower, int maxTorque});
}

/// @nodoc
class _$EngineSpecsCopyWithImpl<$Res, $Val extends EngineSpecs>
    implements $EngineSpecsCopyWith<$Res> {
  _$EngineSpecsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EngineSpecs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capacity = null,
    Object? maxPower = null,
    Object? maxTorque = null,
  }) {
    return _then(_value.copyWith(
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      maxPower: null == maxPower
          ? _value.maxPower
          : maxPower // ignore: cast_nullable_to_non_nullable
              as int,
      maxTorque: null == maxTorque
          ? _value.maxTorque
          : maxTorque // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EngineSpecsImplCopyWith<$Res>
    implements $EngineSpecsCopyWith<$Res> {
  factory _$$EngineSpecsImplCopyWith(
          _$EngineSpecsImpl value, $Res Function(_$EngineSpecsImpl) then) =
      __$$EngineSpecsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int capacity, int maxPower, int maxTorque});
}

/// @nodoc
class __$$EngineSpecsImplCopyWithImpl<$Res>
    extends _$EngineSpecsCopyWithImpl<$Res, _$EngineSpecsImpl>
    implements _$$EngineSpecsImplCopyWith<$Res> {
  __$$EngineSpecsImplCopyWithImpl(
      _$EngineSpecsImpl _value, $Res Function(_$EngineSpecsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EngineSpecs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capacity = null,
    Object? maxPower = null,
    Object? maxTorque = null,
  }) {
    return _then(_$EngineSpecsImpl(
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      maxPower: null == maxPower
          ? _value.maxPower
          : maxPower // ignore: cast_nullable_to_non_nullable
              as int,
      maxTorque: null == maxTorque
          ? _value.maxTorque
          : maxTorque // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EngineSpecsImpl implements _EngineSpecs {
  const _$EngineSpecsImpl(
      {required this.capacity,
      required this.maxPower,
      required this.maxTorque});

  factory _$EngineSpecsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EngineSpecsImplFromJson(json);

  @override
  final int capacity;
  @override
  final int maxPower;
  @override
  final int maxTorque;

  @override
  String toString() {
    return 'EngineSpecs(capacity: $capacity, maxPower: $maxPower, maxTorque: $maxTorque)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EngineSpecsImpl &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.maxPower, maxPower) ||
                other.maxPower == maxPower) &&
            (identical(other.maxTorque, maxTorque) ||
                other.maxTorque == maxTorque));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, capacity, maxPower, maxTorque);

  /// Create a copy of EngineSpecs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EngineSpecsImplCopyWith<_$EngineSpecsImpl> get copyWith =>
      __$$EngineSpecsImplCopyWithImpl<_$EngineSpecsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EngineSpecsImplToJson(
      this,
    );
  }
}

abstract class _EngineSpecs implements EngineSpecs {
  const factory _EngineSpecs(
      {required final int capacity,
      required final int maxPower,
      required final int maxTorque}) = _$EngineSpecsImpl;

  factory _EngineSpecs.fromJson(Map<String, dynamic> json) =
      _$EngineSpecsImpl.fromJson;

  @override
  int get capacity;
  @override
  int get maxPower;
  @override
  int get maxTorque;

  /// Create a copy of EngineSpecs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EngineSpecsImplCopyWith<_$EngineSpecsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformanceSpecs _$PerformanceSpecsFromJson(Map<String, dynamic> json) {
  return _PerformanceSpecs.fromJson(json);
}

/// @nodoc
mixin _$PerformanceSpecs {
  double get mileage => throw _privateConstructorUsedError;

  /// Serializes this PerformanceSpecs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceSpecs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceSpecsCopyWith<PerformanceSpecs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceSpecsCopyWith<$Res> {
  factory $PerformanceSpecsCopyWith(
          PerformanceSpecs value, $Res Function(PerformanceSpecs) then) =
      _$PerformanceSpecsCopyWithImpl<$Res, PerformanceSpecs>;
  @useResult
  $Res call({double mileage});
}

/// @nodoc
class _$PerformanceSpecsCopyWithImpl<$Res, $Val extends PerformanceSpecs>
    implements $PerformanceSpecsCopyWith<$Res> {
  _$PerformanceSpecsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceSpecs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mileage = null,
  }) {
    return _then(_value.copyWith(
      mileage: null == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceSpecsImplCopyWith<$Res>
    implements $PerformanceSpecsCopyWith<$Res> {
  factory _$$PerformanceSpecsImplCopyWith(_$PerformanceSpecsImpl value,
          $Res Function(_$PerformanceSpecsImpl) then) =
      __$$PerformanceSpecsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double mileage});
}

/// @nodoc
class __$$PerformanceSpecsImplCopyWithImpl<$Res>
    extends _$PerformanceSpecsCopyWithImpl<$Res, _$PerformanceSpecsImpl>
    implements _$$PerformanceSpecsImplCopyWith<$Res> {
  __$$PerformanceSpecsImplCopyWithImpl(_$PerformanceSpecsImpl _value,
      $Res Function(_$PerformanceSpecsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PerformanceSpecs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mileage = null,
  }) {
    return _then(_$PerformanceSpecsImpl(
      mileage: null == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceSpecsImpl implements _PerformanceSpecs {
  const _$PerformanceSpecsImpl({required this.mileage});

  factory _$PerformanceSpecsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceSpecsImplFromJson(json);

  @override
  final double mileage;

  @override
  String toString() {
    return 'PerformanceSpecs(mileage: $mileage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceSpecsImpl &&
            (identical(other.mileage, mileage) || other.mileage == mileage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mileage);

  /// Create a copy of PerformanceSpecs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceSpecsImplCopyWith<_$PerformanceSpecsImpl> get copyWith =>
      __$$PerformanceSpecsImplCopyWithImpl<_$PerformanceSpecsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceSpecsImplToJson(
      this,
    );
  }
}

abstract class _PerformanceSpecs implements PerformanceSpecs {
  const factory _PerformanceSpecs({required final double mileage}) =
      _$PerformanceSpecsImpl;

  factory _PerformanceSpecs.fromJson(Map<String, dynamic> json) =
      _$PerformanceSpecsImpl.fromJson;

  @override
  double get mileage;

  /// Create a copy of PerformanceSpecs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceSpecsImplCopyWith<_$PerformanceSpecsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
