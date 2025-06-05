class AdditionalInfo {
  final bool? abs;
  final bool? accidental;
  final bool? adjustableExternalMirror;
  final bool? adjustableSteering;
  final bool? adjustableSeats;
  final bool? airConditioning;
  final int? numberOfAirbags;
  final bool? alloyWheels;
  final bool? auxCompatibility;
  final String? batteryCondition;
  final bool? bluetooth;
  final bool? vehicleCertified;
  final List<String>? color;
  final bool? cruiseControl;
  final String? insuranceType;
  final bool? lockSystem;
  final String? makeMonth;
  final bool? navigationSystem;
  final bool? parkingSensors;
  final bool? powerSteering;
  final bool? powerWindows;
  final bool? amFmRadio;
  final bool? rearParkingCamera;
  final String? registrationPlace;
  final bool? exchange;
  final bool? finance;
  final bool? serviceHistory;
  final String? tyreCondition;
  final bool? sunroof;
  final bool? usbCompatibility;
  final bool? seatWarmer;

  AdditionalInfo({
    this.abs,
    this.accidental,
    this.adjustableExternalMirror,
    this.adjustableSteering,
    this.adjustableSeats,
    this.airConditioning,
    this.numberOfAirbags,
    this.alloyWheels,
    this.auxCompatibility,
    this.batteryCondition,
    this.bluetooth,
    this.vehicleCertified,
    this.color,
    this.cruiseControl,
    this.insuranceType,
    this.lockSystem,
    this.makeMonth,
    this.navigationSystem,
    this.parkingSensors,
    this.powerSteering,
    this.powerWindows,
    this.amFmRadio,
    this.rearParkingCamera,
    this.registrationPlace,
    this.exchange,
    this.finance,
    this.serviceHistory,
    this.tyreCondition,
    this.sunroof,
    this.usbCompatibility,
    this.seatWarmer,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) {
    return AdditionalInfo(
      abs: json['abs'] ?? false,
      accidental: json['accidental'] ?? false,
      adjustableExternalMirror: json['adjustableExternalMirror'] ?? false,
      adjustableSteering: json['adjustableSteering'] ?? false,
      adjustableSeats: json['adjustableSeats'] ?? false,
      airConditioning: json['airConditioning'] ?? false,
      numberOfAirbags: json['numberOfAirbags'] ?? 0,
      alloyWheels: json['alloyWheels'] ?? false,
      auxCompatibility: json['auxCompatibility'] ?? false,
      batteryCondition: json['batteryCondition'] ?? 'Unknown',
      bluetooth: json['bluetooth'] ?? false,
      vehicleCertified: json['vehicleCertified'] ?? false,
      color: List<String>.from(json['color'] ?? []),
      cruiseControl: json['cruiseControl'] ?? false,
      insuranceType: json['insuranceType'] ?? '',
      lockSystem: json['lockSystem'] ?? false,
      makeMonth: json['makeMonth'] ?? '',
      navigationSystem: json['navigationSystem'] ?? false,
      parkingSensors: json['parkingSensors'] ?? false,
      powerSteering: json['powerSteering'] ?? false,
      powerWindows: json['powerWindows'] ?? false,
      amFmRadio: json['amFmRadio'] ?? false,
      rearParkingCamera: json['rearParkingCamera'] ?? false,
      registrationPlace: json['registrationPlace'] ?? 'Unknown',
      exchange: json['exchange'] ?? false,
      finance: json['finance'] ?? false,
      serviceHistory: json['serviceHistory'] ?? false,
      tyreCondition: json['tyreCondition'] ?? 'Unknown',
      sunroof: json['sunroof'] ?? false,
      usbCompatibility: json['usbCompatibility'] ?? false,
      seatWarmer: json['seatWarmer'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'abs': abs,
      'accidental': accidental,
      'adjustableExternalMirror': adjustableExternalMirror,
      'adjustableSteering': adjustableSteering,
      'adjustableSeats': adjustableSeats,
      'airConditioning': airConditioning,
      'numberOfAirbags': numberOfAirbags,
      'alloyWheels': alloyWheels,
      'auxCompatibility': auxCompatibility,
      'batteryCondition': batteryCondition,
      'bluetooth': bluetooth,
      'vehicleCertified': vehicleCertified,
      'color': color,
      'cruiseControl': cruiseControl,
      'insuranceType': insuranceType,
      'lockSystem': lockSystem,
      'makeMonth': makeMonth,
      'navigationSystem': navigationSystem,
      'parkingSensors': parkingSensors,
      'powerSteering': powerSteering,
      'powerWindows': powerWindows,
      'amFmRadio': amFmRadio,
      'rearParkingCamera': rearParkingCamera,
      'registrationPlace': registrationPlace,
      'exchange': exchange,
      'finance': finance,
      'serviceHistory': serviceHistory,
      'tyreCondition': tyreCondition,
      'sunroof': sunroof,
      'usbCompatibility': usbCompatibility,
      'seatWarmer': seatWarmer,
    };
  }
}
