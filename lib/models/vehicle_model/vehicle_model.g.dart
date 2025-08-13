// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleModelImpl _$$VehicleModelImplFromJson(Map<String, dynamic> json) =>
    _$VehicleModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      manufacturer: VehicleManufacturer.fromJson(
          json['manufacturer'] as Map<String, dynamic>),
      vehicleType: json['vehicleType'] as String,
      description: json['description'] as String?,
      launchYear: (json['launchYear'] as num?)?.toInt(),
      segment: json['segment'] as String?,
      bodyType: json['bodyType'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      brochureUrl: json['brochureUrl'] as String?,
      isActive: json['isActive'] as bool?,
      variantCount: (json['variantCount'] as num?)?.toInt(),
      priceRange: json['priceRange'] == null
          ? null
          : PriceRange.fromJson(json['priceRange'] as Map<String, dynamic>),
      availableFuelTypes: (json['availableFuelTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availableTransmissionTypes:
          (json['availableTransmissionTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      isCommercialVehicle: json['isCommercialVehicle'] as bool?,
      commercialVehicleType: json['commercialVehicleType'] as String?,
      commercialBodyType: json['commercialBodyType'] as String?,
      defaultPayloadCapacity: (json['defaultPayloadCapacity'] as num?)?.toInt(),
      defaultPayloadUnit: json['defaultPayloadUnit'] as String?,
      defaultAxleCount: (json['defaultAxleCount'] as num?)?.toInt(),
      defaultSeatingCapacity: (json['defaultSeatingCapacity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VehicleModelImplToJson(_$VehicleModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'manufacturer': instance.manufacturer.toJson(),
      'vehicleType': instance.vehicleType,
      'description': instance.description,
      'launchYear': instance.launchYear,
      'segment': instance.segment,
      'bodyType': instance.bodyType,
      'images': instance.images,
      'brochureUrl': instance.brochureUrl,
      'isActive': instance.isActive,
      'variantCount': instance.variantCount,
      'priceRange': instance.priceRange?.toJson(),
      'availableFuelTypes': instance.availableFuelTypes,
      'availableTransmissionTypes': instance.availableTransmissionTypes,
      'isCommercialVehicle': instance.isCommercialVehicle,
      'commercialVehicleType': instance.commercialVehicleType,
      'commercialBodyType': instance.commercialBodyType,
      'defaultPayloadCapacity': instance.defaultPayloadCapacity,
      'defaultPayloadUnit': instance.defaultPayloadUnit,
      'defaultAxleCount': instance.defaultAxleCount,
      'defaultSeatingCapacity': instance.defaultSeatingCapacity,
    };

_$VehicleModelResponseImpl _$$VehicleModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleModelResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
      hasPrev: json['hasPrev'] as bool,
    );

Map<String, dynamic> _$$VehicleModelResponseImplToJson(
        _$VehicleModelResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'hasNext': instance.hasNext,
      'hasPrev': instance.hasPrev,
    };

_$PriceRangeImpl _$$PriceRangeImplFromJson(Map<String, dynamic> json) =>
    _$PriceRangeImpl(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PriceRangeImplToJson(_$PriceRangeImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };
