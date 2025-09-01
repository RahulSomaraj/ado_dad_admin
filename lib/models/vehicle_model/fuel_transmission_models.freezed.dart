// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuel_transmission_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FuelType _$FuelTypeFromJson(Map<String, dynamic> json) {
  return _FuelType.fromJson(json);
}

/// @nodoc
mixin _$FuelType {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get abbreviation => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String? displayName,
      String? abbreviation,
      bool? isActive,
      int? sortOrder});
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
    Object? displayName = freezed,
    Object? abbreviation = freezed,
    Object? isActive = freezed,
    Object? sortOrder = freezed,
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
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String? displayName,
      String? abbreviation,
      bool? isActive,
      int? sortOrder});
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
    Object? displayName = freezed,
    Object? abbreviation = freezed,
    Object? isActive = freezed,
    Object? sortOrder = freezed,
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
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FuelTypeImpl implements _FuelType {
  const _$FuelTypeImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      this.displayName,
      this.abbreviation,
      this.isActive,
      this.sortOrder});

  factory _$FuelTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$FuelTypeImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String? displayName;
  @override
  final String? abbreviation;
  @override
  final bool? isActive;
  @override
  final int? sortOrder;

  @override
  String toString() {
    return 'FuelType(id: $id, name: $name, displayName: $displayName, abbreviation: $abbreviation, isActive: $isActive, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuelTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.abbreviation, abbreviation) ||
                other.abbreviation == abbreviation) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, displayName, abbreviation, isActive, sortOrder);

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
      final String? displayName,
      final String? abbreviation,
      final bool? isActive,
      final int? sortOrder}) = _$FuelTypeImpl;

  factory _FuelType.fromJson(Map<String, dynamic> json) =
      _$FuelTypeImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String? get displayName;
  @override
  String? get abbreviation;
  @override
  bool? get isActive;
  @override
  int? get sortOrder;

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
  String? get displayName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get abbreviation => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String? displayName,
      String? description,
      String? icon,
      String? abbreviation,
      bool? isActive,
      int? sortOrder});
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
    Object? displayName = freezed,
    Object? description = freezed,
    Object? icon = freezed,
    Object? abbreviation = freezed,
    Object? isActive = freezed,
    Object? sortOrder = freezed,
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
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String? displayName,
      String? description,
      String? icon,
      String? abbreviation,
      bool? isActive,
      int? sortOrder});
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
    Object? displayName = freezed,
    Object? description = freezed,
    Object? icon = freezed,
    Object? abbreviation = freezed,
    Object? isActive = freezed,
    Object? sortOrder = freezed,
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
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransmissionTypeImpl implements _TransmissionType {
  const _$TransmissionTypeImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      this.displayName,
      this.description,
      this.icon,
      this.abbreviation,
      this.isActive,
      this.sortOrder});

  factory _$TransmissionTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransmissionTypeImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String? displayName;
  @override
  final String? description;
  @override
  final String? icon;
  @override
  final String? abbreviation;
  @override
  final bool? isActive;
  @override
  final int? sortOrder;

  @override
  String toString() {
    return 'TransmissionType(id: $id, name: $name, displayName: $displayName, description: $description, icon: $icon, abbreviation: $abbreviation, isActive: $isActive, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransmissionTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.abbreviation, abbreviation) ||
                other.abbreviation == abbreviation) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName,
      description, icon, abbreviation, isActive, sortOrder);

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
      final String? displayName,
      final String? description,
      final String? icon,
      final String? abbreviation,
      final bool? isActive,
      final int? sortOrder}) = _$TransmissionTypeImpl;

  factory _TransmissionType.fromJson(Map<String, dynamic> json) =
      _$TransmissionTypeImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String? get displayName;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  String? get abbreviation;
  @override
  bool? get isActive;
  @override
  int? get sortOrder;

  /// Create a copy of TransmissionType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransmissionTypeImplCopyWith<_$TransmissionTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
