class VehicleDetails {
  final int? modelYear;
  final String? month;

  VehicleDetails({
    required this.modelYear,
    required this.month,
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) {
    return VehicleDetails(
      modelYear: json['modelYear'] ?? 0,
      month: json['month'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'modelYear': modelYear,
      'month': month,
    };
  }
}
