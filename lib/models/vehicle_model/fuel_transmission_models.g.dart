// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_transmission_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FuelTypeImpl _$$FuelTypeImplFromJson(Map<String, dynamic> json) =>
    _$FuelTypeImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String?,
      abbreviation: json['abbreviation'] as String?,
      isActive: json['isActive'] as bool?,
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FuelTypeImplToJson(_$FuelTypeImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'abbreviation': instance.abbreviation,
      'isActive': instance.isActive,
      'sortOrder': instance.sortOrder,
    };

_$TransmissionTypeImpl _$$TransmissionTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$TransmissionTypeImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      abbreviation: json['abbreviation'] as String?,
      isActive: json['isActive'] as bool?,
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TransmissionTypeImplToJson(
        _$TransmissionTypeImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'description': instance.description,
      'icon': instance.icon,
      'abbreviation': instance.abbreviation,
      'isActive': instance.isActive,
      'sortOrder': instance.sortOrder,
    };
