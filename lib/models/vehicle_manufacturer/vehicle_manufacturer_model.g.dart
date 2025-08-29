// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_manufacturer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleManufacturerImpl _$$VehicleManufacturerImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleManufacturerImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      originCountry: json['originCountry'] as String,
      description: json['description'] as String,
      logo: json['logo'] as String,
      website: json['website'] as String,
      foundedYear: (json['foundedYear'] as num).toInt(),
      headquarters: json['headquarters'] as String,
      isActive: json['isActive'] as bool,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['v'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$VehicleManufacturerImplToJson(
        _$VehicleManufacturerImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'originCountry': instance.originCountry,
      'description': instance.description,
      'logo': instance.logo,
      'website': instance.website,
      'foundedYear': instance.foundedYear,
      'headquarters': instance.headquarters,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
    };

_$VehicleManufacturerResponseImpl _$$VehicleManufacturerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleManufacturerResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => VehicleManufacturer.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
      hasPrev: json['hasPrev'] as bool,
    );

Map<String, dynamic> _$$VehicleManufacturerResponseImplToJson(
        _$VehicleManufacturerResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'hasNext': instance.hasNext,
      'hasPrev': instance.hasPrev,
    };
