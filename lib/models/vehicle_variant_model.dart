class VehicleVariant {
  final String name;
  final String modelName;
  final String modelDetails;
  final List<String> images;
  final String fuelType;
  final String transmissionType;
  final int? mileage;
  final int? engineCapacity;
  final int? fuelCapacity;
  final int? maxPower;

  VehicleVariant({
    required this.name,
    required this.modelName,
    required this.modelDetails,
    required this.images,
    required this.fuelType,
    required this.transmissionType,
    this.mileage,
    this.engineCapacity,
    this.fuelCapacity,
    this.maxPower,
  });

  factory VehicleVariant.fromJson(Map<String, dynamic> json) {
    return VehicleVariant(
      name: json['name'] ?? '',
      modelName: json['modelName'] ?? '',
      modelDetails: json['modelDetails'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      fuelType: json['fuelType'] ?? '',
      transmissionType: json['transmissionType'] ?? '',
      mileage: json['mileage'] ?? 0,
      engineCapacity: json['engineCapacity'] ?? 0,
      fuelCapacity: json['fuelCapacity'] ?? 0,
      maxPower: json['maxPower'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'modelName': modelName,
      'modelDetails': modelDetails,
      'images': images,
      'fuelType': fuelType,
      'transmissionType': transmissionType,
      'mileage': mileage,
      'engineCapacity': engineCapacity,
      'fuelCapacity': fuelCapacity,
      'maxPower': maxPower,
    };
  }
}
