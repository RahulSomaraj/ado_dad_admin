import 'package:ado_dad_admin/models/vehicle_additional_info_model.dart';
import 'package:ado_dad_admin/models/vehicle_company_model.dart';
import 'package:ado_dad_admin/models/vehicle_detail_model.dart';
import 'package:ado_dad_admin/models/vehicle_variant_model.dart';

class VehicleModel {
  final String id;
  final String name;
  final String modelName;
  final String modelType;
  final String wheelerType;
  final VehicleCompanyModel vendor;
  // final String vendorId;
  // String? vendorName;
  final List<String> colors;
  final VehicleDetails details;
  final List<VehicleVariant> vehicleVariants;
  final AdditionalInfo? additionalInfo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VehicleModel({
    required this.id,
    required this.name,
    required this.modelName,
    required this.modelType,
    required this.wheelerType,
    required this.vendor,
    // required this.vendorId,
    // this.vendorName,
    required this.colors,
    required this.details,
    required this.vehicleVariants,
    required this.additionalInfo,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      modelName: json['modelName'] ?? '',
      modelType: json['modelType'] ?? '',
      wheelerType: json['wheelerType'] ?? '',
      vendor: VehicleCompanyModel.fromJson(json['vendor'] ?? {}),
      // vendorId: json['vendor'] ?? '',
      // vendorName: json['vendorName'] ?? 'Unknown Vendor',
      colors: List<String>.from(json['color'] ?? []),
      details: VehicleDetails.fromJson(json['details'] ?? {}),
      vehicleVariants: (json['vehicleModels'] as List?)
              ?.map((variant) => VehicleVariant.fromJson(variant))
              .toList() ??
          [],
      additionalInfo: AdditionalInfo.fromJson(json['additionalInfo'] ?? {}),
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'modelName': modelName,
      'modelType': modelType,
      'wheelerType': wheelerType,
      'vendor': vendor.toJson(),
      // 'vendor': vendorId,
      // 'vendorName': vendorName,
      'color': colors,
      'details': details.toJson(),
      'vehicleModels':
          vehicleVariants.map((variant) => variant.toJson()).toList(),
      'additionalInfo': additionalInfo!.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
