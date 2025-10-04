// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VariantModelImpl _$$VariantModelImplFromJson(Map<String, dynamic> json) =>
    _$VariantModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      vehicleModel:
          VehicleModel.fromJson(json['vehicleModel'] as Map<String, dynamic>),
      fuelType: json['fuelType'] == null
          ? null
          : FuelType.fromJson(json['fuelType'] as Map<String, dynamic>),
      transmissionType: json['transmissionType'] == null
          ? null
          : TransmissionType.fromJson(
              json['transmissionType'] as Map<String, dynamic>),
      featurePackage: json['featurePackage'] as String?,
      engineSpecs: json['engineSpecs'] == null
          ? null
          : EngineSpecs.fromJson(json['engineSpecs'] as Map<String, dynamic>),
      performanceSpecs: json['performanceSpecs'] == null
          ? null
          : PerformanceSpecs.fromJson(
              json['performanceSpecs'] as Map<String, dynamic>),
      seatingCapacity: (json['seatingCapacity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      isActive: json['isActive'] as bool,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$VariantModelImplToJson(_$VariantModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'vehicleModel': instance.vehicleModel,
      'fuelType': instance.fuelType,
      'transmissionType': instance.transmissionType,
      'featurePackage': instance.featurePackage,
      'engineSpecs': instance.engineSpecs,
      'performanceSpecs': instance.performanceSpecs,
      'seatingCapacity': instance.seatingCapacity,
      'price': instance.price,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$FuelTypeImpl _$$FuelTypeImplFromJson(Map<String, dynamic> json) =>
    _$FuelTypeImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$$FuelTypeImplToJson(_$FuelTypeImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
    };

_$TransmissionTypeImpl _$$TransmissionTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$TransmissionTypeImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$$TransmissionTypeImplToJson(
        _$TransmissionTypeImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
    };

_$VariantResponseImpl _$$VariantResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VariantResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => VariantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
      hasPrev: json['hasPrev'] as bool,
    );

Map<String, dynamic> _$$VariantResponseImplToJson(
        _$VariantResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'hasNext': instance.hasNext,
      'hasPrev': instance.hasPrev,
    };

_$EngineSpecsImpl _$$EngineSpecsImplFromJson(Map<String, dynamic> json) =>
    _$EngineSpecsImpl(
      capacity: (json['capacity'] as num).toInt(),
      maxPower: (json['maxPower'] as num).toInt(),
      maxTorque: (json['maxTorque'] as num).toInt(),
    );

Map<String, dynamic> _$$EngineSpecsImplToJson(_$EngineSpecsImpl instance) =>
    <String, dynamic>{
      'capacity': instance.capacity,
      'maxPower': instance.maxPower,
      'maxTorque': instance.maxTorque,
    };

_$PerformanceSpecsImpl _$$PerformanceSpecsImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceSpecsImpl(
      mileage: (json['mileage'] as num).toDouble(),
    );

Map<String, dynamic> _$$PerformanceSpecsImplToJson(
        _$PerformanceSpecsImpl instance) =>
    <String, dynamic>{
      'mileage': instance.mileage,
    };
