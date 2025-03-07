class VehicleRequest {
  String name;
  String modelName;
  String modelType;
  String wheelerType; // "TWO_WHEELER" or "FOUR_WHEELER"
  Details details;
  String vendor;
  List<VehicleModel1> vehicleModels;
  List<String> color;

  VehicleRequest({
    required this.name,
    required this.modelName,
    required this.modelType,
    required this.wheelerType,
    required this.details,
    required this.vendor,
    required this.vehicleModels,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "modelName": modelName,
      "modelType": modelType,
      "wheelerType": wheelerType,
      "details": details.toJson(),
      "vendor": vendor,
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
  String modelDetails;
  List<String> images;
  String fuelType;
  String transmissionType;
  int mileage;
  List<String>? color;

  // Fields only for Four-Wheelers
  int? engineCapacity;
  int? fuelCapacity;
  int? maxPower;
  AdditionalInfo? additionalInfo;

  VehicleModel1({
    required this.name,
    required this.modelName,
    required this.modelDetails,
    required this.images,
    required this.fuelType,
    required this.transmissionType,
    required this.mileage,
    this.color,

    // These fields are only required for Four-Wheelers
    this.engineCapacity,
    this.fuelCapacity,
    this.maxPower,
    this.additionalInfo,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "name": name,
      "modelName": modelName,
      "modelDetails": modelDetails,
      "images": images,
      "fuelType": fuelType,
      "transmissionType": transmissionType,
      "mileage": mileage,
      "color": color,
    };

    // Only add Four-Wheeler fields if available
    if (engineCapacity != null) data["engineCapacity"] = engineCapacity;
    if (fuelCapacity != null) data["fuelCapacity"] = fuelCapacity;
    if (maxPower != null) data["maxPower"] = maxPower;
    if (additionalInfo != null)
      data["additionalInfo"] = additionalInfo!.toJson();

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
