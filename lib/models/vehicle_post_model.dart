class VehicleRequest {
  final String id;
  String name;
  String modelName;
  String modelType;
  String wheelerType;
  Details details;
  String vendor;
  // VehicleCompanyModel? vendorCompany;
  List<VehicleModel1> vehicleModels;
  List<String> color;

  VehicleRequest({
    required this.id,
    required this.name,
    required this.modelName,
    required this.modelType,
    required this.wheelerType,
    required this.details,
    required this.vendor,
    // required this.vendorCompany,
    required this.vehicleModels,
    required this.color,
  });

  factory VehicleRequest.fromJson(Map<String, dynamic> json) {
    return VehicleRequest(
      // id: json["id"] ?? "",
      id: json['id'] ?? json['_id'] ?? '',
      name: json["name"] ?? "",
      modelName: json["modelName"] ?? "",
      modelType: json["modelType"] ?? "",
      wheelerType: json["wheelerType"] ?? "",
      details: Details.fromJson(json["details"] ?? {}),
      // vendor: json["vendor"] ?? "",
      vendor: json["vendor"] is String
          ? json["vendor"]
          : json["vendor"]["name"] ?? "",
      // vendorCompany: json["vendor"] is Map<String, dynamic>
      //     ? VehicleCompanyModel.fromJson(json["vendor"])
      //     : null,

      color: List<String>.from(json["color"] ?? []),
      vehicleModels: (json["vehicleModels"] as List<dynamic>?)
              ?.map((e) => VehicleModel1.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "modelName": modelName,
      "modelType": modelType,
      "wheelerType": wheelerType,
      "details": details.toJson(),
      "vendor": vendor,
      // "vendor": vendorCompany?.toJson(),
      "vehicleModels": vehicleModels.map((e) => e.toJson()).toList(),
      "color": color,
    };
  }
}

class Details {
  int modelYear;
  String month;

  Details({
    required this.modelYear,
    required this.month,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      modelYear: json["modelYear"] ?? 0,
      month: json["month"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "modelYear": modelYear,
      "month": month,
    };
  }
}

class VehicleModel1 {
  String name;
  String modelName;
  String? modelDetails;
  List<String>? images;
  String fuelType;
  String transmissionType;
  int mileage;
  int engineCapacity;
  int fuelCapacity;
  int maxPower;
  // Fields only for Four-Wheelers
  AdditionalInfo? additionalInfo;

  VehicleModel1({
    required this.name,
    required this.modelName,
    this.modelDetails,
    this.images,
    required this.fuelType,
    required this.transmissionType,
    required this.mileage,
    required this.engineCapacity,
    required this.fuelCapacity,
    required this.maxPower,
    this.additionalInfo,
  });

  factory VehicleModel1.fromJson(Map<String, dynamic> json) {
    return VehicleModel1(
      name: json["name"] ?? "",
      modelName: json["modelName"] ?? "",
      modelDetails: json["modelDetails"],
      images:
          (json["images"] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      fuelType: json["fuelType"] ?? "",
      transmissionType: json["transmissionType"] ?? "",
      mileage: json["mileage"] ?? 0,
      engineCapacity: json["engineCapacity"] ?? 0,
      fuelCapacity: json["fuelCapacity"] ?? 0,
      maxPower: json["maxPower"] ?? 0,
      additionalInfo: json["additionalInfo"] != null
          ? AdditionalInfo.fromJson(json["additionalInfo"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "name": name,
      "modelName": modelName,
      "modelDetails": modelDetails,
      "images": images,
      "fuelType": fuelType,
      "transmissionType": transmissionType,
      "mileage": mileage,
      "engineCapacity": engineCapacity,
      "fuelCapacity": fuelCapacity,
      "maxPower": maxPower
    };

    if (additionalInfo != null) {
      data["additionalInfo"] = additionalInfo!.toJson();
    }

    return data;
  }
}

class AdditionalInfo {
  bool abs;
  bool accidental;
  bool adjustableExternalMirror;
  bool adjustableSteering;
  bool adjustableSeats;
  bool airConditioning;
  int numberOfAirbags;
  bool alloyWheels;
  bool auxCompatibility;
  String batteryCondition;
  bool bluetooth;
  bool vehicleCertified;
  List<String> color;
  bool cruiseControl;
  String insuranceType;
  bool lockSystem;
  String makeMonth;
  bool navigationSystem;
  bool parkingSensors;
  bool powerSteering;
  bool powerWindows;
  bool amFmRadio;
  bool rearParkingCamera;
  String registrationPlace;
  bool exchange;
  bool finance;
  bool serviceHistory;
  bool sunroof;
  String tyreCondition;
  bool usbCompatibility;
  bool seatWarmer;

  AdditionalInfo({
    required this.abs,
    required this.accidental,
    required this.adjustableExternalMirror,
    required this.adjustableSteering,
    required this.adjustableSeats,
    required this.airConditioning,
    required this.numberOfAirbags,
    required this.alloyWheels,
    required this.auxCompatibility,
    required this.batteryCondition,
    required this.bluetooth,
    required this.vehicleCertified,
    required this.color,
    required this.cruiseControl,
    required this.insuranceType,
    required this.lockSystem,
    required this.makeMonth,
    required this.navigationSystem,
    required this.parkingSensors,
    required this.powerSteering,
    required this.powerWindows,
    required this.amFmRadio,
    required this.rearParkingCamera,
    required this.registrationPlace,
    required this.exchange,
    required this.finance,
    required this.serviceHistory,
    required this.sunroof,
    required this.tyreCondition,
    required this.usbCompatibility,
    required this.seatWarmer,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) {
    return AdditionalInfo(
      abs: json["abs"] ?? false,
      accidental: json["accidental"] ?? false,
      adjustableExternalMirror: json["adjustableExternalMirror"] ?? false,
      adjustableSteering: json["adjustableSteering"] ?? false,
      adjustableSeats: json["adjustableSeats"] ?? false,
      airConditioning: json["airConditioning"] ?? false,
      numberOfAirbags: json["numberOfAirbags"] ?? 0,
      alloyWheels: json["alloyWheels"] ?? false,
      auxCompatibility: json["auxCompatibility"] ?? false,
      batteryCondition: json["batteryCondition"] ?? "",
      bluetooth: json["bluetooth"] ?? false,
      vehicleCertified: json["vehicleCertified"] ?? false,
      color: List<String>.from(json["color"] ?? []),
      cruiseControl: json["cruiseControl"] ?? false,
      insuranceType: json["insuranceType"] ?? "",
      lockSystem: json["lockSystem"] ?? false,
      makeMonth: json["makeMonth"] ?? "",
      navigationSystem: json["navigationSystem"] ?? false,
      parkingSensors: json["parkingSensors"] ?? false,
      powerSteering: json["powerSteering"] ?? false,
      powerWindows: json["powerWindows"] ?? false,
      amFmRadio: json["amFmRadio"] ?? false,
      rearParkingCamera: json["rearParkingCamera"] ?? false,
      registrationPlace: json["registrationPlace"] ?? "",
      exchange: json["exchange"] ?? false,
      finance: json["finance"] ?? false,
      serviceHistory: json["serviceHistory"] ?? false,
      sunroof: json["sunroof"] ?? false,
      tyreCondition: json["tyreCondition"] ?? "",
      usbCompatibility: json["usbCompatibility"] ?? false,
      seatWarmer: json["seatWarmer"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "abs": abs,
      "accidental": accidental,
      "adjustableExternalMirror": adjustableExternalMirror,
      "adjustableSteering": adjustableSteering,
      "adjustableSeats": adjustableSeats,
      "airConditioning": airConditioning,
      "numberOfAirbags": numberOfAirbags,
      "alloyWheels": alloyWheels,
      "auxCompatibility": auxCompatibility,
      "batteryCondition": batteryCondition,
      "bluetooth": bluetooth,
      "vehicleCertified": vehicleCertified,
      "color": color,
      "cruiseControl": cruiseControl,
      "insuranceType": insuranceType,
      "lockSystem": lockSystem,
      "makeMonth": makeMonth,
      "navigationSystem": navigationSystem,
      "parkingSensors": parkingSensors,
      "powerSteering": powerSteering,
      "powerWindows": powerWindows,
      "amFmRadio": amFmRadio,
      "rearParkingCamera": rearParkingCamera,
      "registrationPlace": registrationPlace,
      "exchange": exchange,
      "finance": finance,
      "serviceHistory": serviceHistory,
      "sunroof": sunroof,
      "tyreCondition": tyreCondition,
      "usbCompatibility": usbCompatibility,
      "seatWarmer": seatWarmer,
    };
  }
}
