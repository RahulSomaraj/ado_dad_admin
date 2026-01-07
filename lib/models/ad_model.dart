class AdModel {
  final String id;
  final String title;
  final String description;
  final int price;
  final List<String> images;
  final String location;
  final String category;
  final bool isActive;
  final bool soldOut;
  final bool isApproved;
  final String? approvedBy;
  final AdUser? approvedByUser;
  final DateTime postedAt;
  final DateTime updatedAt;
  final String postedBy;
  final AdUser user;
  final VehicleDetails? vehicleDetails;
  final List<dynamic> commercialVehicleDetails;
  final List<dynamic> propertyDetails;
  final int? year;
  final bool isFavorite;

  AdModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.location,
    required this.category,
    required this.isActive,
    required this.soldOut,
    required this.isApproved,
    this.approvedBy,
    this.approvedByUser,
    required this.postedAt,
    required this.updatedAt,
    required this.postedBy,
    required this.user,
    this.vehicleDetails,
    required this.commercialVehicleDetails,
    required this.propertyDetails,
    this.year,
    required this.isFavorite,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    try {
      print('🔄 Parsing AdModel for ID: ${json['id']}');
      print('📄 vehicleDetails type: ${json['vehicleDetails'].runtimeType}');
      print('📄 propertyDetails type: ${json['propertyDetails'].runtimeType}');
      print(
          '📄 commercialVehicleDetails type: ${json['commercialVehicleDetails'].runtimeType}');
      final result = AdModel(
        id: json['id']?.toString() ?? '',
        title: json['title']?.toString() ?? '',
        description: json['description']?.toString() ?? '',
        price: (json['price'] is int)
            ? json['price']
            : int.tryParse(json['price']?.toString() ?? '0') ?? 0,
        images: (json['images'] is List)
            ? List<String>.from(json['images'].map((e) => e?.toString() ?? ''))
            : [],
        location: json['location']?.toString() ?? '',
        category: json['category']?.toString() ?? '',
        isActive: json['isActive'] == true,
        soldOut: json['soldOut'] == true,
        isApproved: json['isApproved'] == true,
        approvedBy: json['approvedBy']?.toString(),
        approvedByUser: (json['approvedByUser'] != null &&
                json['approvedByUser'] is Map &&
                json['approvedByUser'].isNotEmpty)
            ? AdUser.fromJson(json['approvedByUser'])
            : null,
        postedAt: DateTime.tryParse(json['postedAt']?.toString() ?? '') ??
            DateTime.now(),
        updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
            DateTime.now(),
        postedBy: json['postedBy']?.toString() ?? '',
        user: AdUser.fromJson(json['user'] ?? {}),
        vehicleDetails: (json['vehicleDetails'] != null &&
                json['vehicleDetails'] is Map &&
                json['vehicleDetails'].isNotEmpty)
            ? VehicleDetails.fromJson(json['vehicleDetails'])
            : null,
        commercialVehicleDetails: (json['commercialVehicleDetails'] is List)
            ? json['commercialVehicleDetails']
            : [],
        propertyDetails:
            (json['propertyDetails'] is List) ? json['propertyDetails'] : [],
        year: (json['year'] is int)
            ? json['year']
            : (json['year'] is double)
                ? json['year'].toInt()
                : int.tryParse(json['year']?.toString() ?? ''),
        isFavorite: json['isFavorite'] == true,
      );
      print('✅ Successfully parsed AdModel for ID: ${json['id']}');
      return result;
    } catch (e) {
      print('❌ Error parsing AdModel: $e');
      print('📄 AdModel JSON: $json');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'images': images,
      'location': location,
      'category': category,
      'isActive': isActive,
      'soldOut': soldOut,
      'isApproved': isApproved,
      'approvedBy': approvedBy,
      'approvedByUser': approvedByUser?.toJson(),
      'postedAt': postedAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'postedBy': postedBy,
      'user': user.toJson(),
      'vehicleDetails': vehicleDetails?.toJson(),
      'commercialVehicleDetails': commercialVehicleDetails,
      'propertyDetails': propertyDetails,
      'year': year,
      'isFavorite': isFavorite,
    };
  }
}

class AdUser {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String profilePic;

  AdUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePic,
  });

  factory AdUser.fromJson(Map<String, dynamic> json) {
    try {
      return AdUser(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
        email: json['email']?.toString() ?? '',
        phone: json['phone']?.toString() ?? '',
        profilePic: json['profilePic']?.toString() ?? '',
      );
    } catch (e) {
      print('❌ Error parsing AdUser: $e');
      print('📄 AdUser JSON: $json');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePic': profilePic,
    };
  }
}

class Manufacturer {
  final String id;
  final String name;
  final String displayName;
  final String originCountry;
  final String description;
  final String logo;
  final String website;
  final int foundedYear;
  final String headquarters;
  final bool isActive;
  final bool isPremium;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  Manufacturer({
    required this.id,
    required this.name,
    required this.displayName,
    required this.originCountry,
    required this.description,
    required this.logo,
    required this.website,
    required this.foundedYear,
    required this.headquarters,
    required this.isActive,
    required this.isPremium,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return Manufacturer(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      displayName: json['displayName']?.toString() ?? '',
      originCountry: json['originCountry']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      logo: json['logo']?.toString() ?? '',
      website: json['website']?.toString() ?? '',
      foundedYear: (json['foundedYear'] is int)
          ? json['foundedYear']
          : (json['foundedYear'] is double)
              ? json['foundedYear'].toInt()
              : int.tryParse(json['foundedYear']?.toString() ?? '0') ?? 0,
      headquarters: json['headquarters']?.toString() ?? '',
      isActive: json['isActive'] == true,
      isPremium: json['isPremium'] == true,
      isDeleted: json['isDeleted'] == true,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'displayName': displayName,
      'originCountry': originCountry,
      'description': description,
      'logo': logo,
      'website': website,
      'foundedYear': foundedYear,
      'headquarters': headquarters,
      'isActive': isActive,
      'isPremium': isPremium,
      'isDeleted': isDeleted,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class VehicleModel {
  final String id;
  final String name;
  final String displayName;
  final Manufacturer manufacturer;
  final String vehicleType;
  final int launchYear;
  final String segment;
  final String bodyType;
  final List<String> images;
  final List<String> fuelTypes;
  final List<String> transmissionTypes;
  final bool isActive;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  VehicleModel({
    required this.id,
    required this.name,
    required this.displayName,
    required this.manufacturer,
    required this.vehicleType,
    required this.launchYear,
    required this.segment,
    required this.bodyType,
    required this.images,
    required this.fuelTypes,
    required this.transmissionTypes,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      displayName: json['displayName']?.toString() ?? '',
      manufacturer: Manufacturer.fromJson(json['manufacturer'] ?? {}),
      vehicleType: json['vehicleType']?.toString() ?? '',
      launchYear: (json['launchYear'] is int)
          ? json['launchYear']
          : (json['launchYear'] is double)
              ? json['launchYear'].toInt()
              : int.tryParse(json['launchYear']?.toString() ?? '0') ?? 0,
      segment: json['segment']?.toString() ?? '',
      bodyType: json['bodyType']?.toString() ?? '',
      images: (json['images'] is List) ? List<String>.from(json['images']) : [],
      fuelTypes: (json['fuelTypes'] is List)
          ? List<String>.from(json['fuelTypes'])
          : [],
      transmissionTypes: (json['transmissionTypes'] is List)
          ? List<String>.from(json['transmissionTypes'])
          : [],
      isActive: json['isActive'] == true,
      isDeleted: json['isDeleted'] == true,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'displayName': displayName,
      'manufacturer': manufacturer.toJson(),
      'vehicleType': vehicleType,
      'launchYear': launchYear,
      'segment': segment,
      'bodyType': bodyType,
      'images': images,
      'fuelTypes': fuelTypes,
      'transmissionTypes': transmissionTypes,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class VehicleVariant {
  final String id;
  final String name;
  final String displayName;
  final VehicleModelRef vehicleModel;
  final FuelType fuelType;
  final TransmissionType transmissionType;
  final String featurePackage;
  final EngineSpecs engineSpecs;
  final PerformanceSpecs performanceSpecs;
  final int seatingCapacity;
  final int price;
  final int exShowroomPrice;
  final int onRoadPrice;
  final List<String> colors;
  final List<String> images;
  final bool isActive;
  final bool isLaunched;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  VehicleVariant({
    required this.id,
    required this.name,
    required this.displayName,
    required this.vehicleModel,
    required this.fuelType,
    required this.transmissionType,
    required this.featurePackage,
    required this.engineSpecs,
    required this.performanceSpecs,
    required this.seatingCapacity,
    required this.price,
    required this.exShowroomPrice,
    required this.onRoadPrice,
    required this.colors,
    required this.images,
    required this.isActive,
    required this.isLaunched,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VehicleVariant.fromJson(Map<String, dynamic> json) {
    return VehicleVariant(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      displayName: json['displayName']?.toString() ?? '',
      vehicleModel: VehicleModelRef.fromJson(json['vehicleModel'] ?? {}),
      fuelType: FuelType.fromJson(json['fuelType'] ?? {}),
      transmissionType:
          TransmissionType.fromJson(json['transmissionType'] ?? {}),
      featurePackage: json['featurePackage']?.toString() ?? '',
      engineSpecs: EngineSpecs.fromJson(json['engineSpecs'] ?? {}),
      performanceSpecs:
          PerformanceSpecs.fromJson(json['performanceSpecs'] ?? {}),
      seatingCapacity: (json['seatingCapacity'] is int)
          ? json['seatingCapacity']
          : (json['seatingCapacity'] is double)
              ? json['seatingCapacity'].toInt()
              : int.tryParse(json['seatingCapacity']?.toString() ?? '0') ?? 0,
      price: (json['price'] is int)
          ? json['price']
          : (json['price'] is double)
              ? json['price'].toInt()
              : int.tryParse(json['price']?.toString() ?? '0') ?? 0,
      exShowroomPrice: (json['exShowroomPrice'] is int)
          ? json['exShowroomPrice']
          : (json['exShowroomPrice'] is double)
              ? json['exShowroomPrice'].toInt()
              : int.tryParse(json['exShowroomPrice']?.toString() ?? '0') ?? 0,
      onRoadPrice: (json['onRoadPrice'] is int)
          ? json['onRoadPrice']
          : (json['onRoadPrice'] is double)
              ? json['onRoadPrice'].toInt()
              : int.tryParse(json['onRoadPrice']?.toString() ?? '0') ?? 0,
      colors: (json['colors'] is List) ? List<String>.from(json['colors']) : [],
      images: (json['images'] is List) ? List<String>.from(json['images']) : [],
      isActive: json['isActive'] == true,
      isLaunched: json['isLaunched'] == true,
      isDeleted: json['isDeleted'] == true,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'displayName': displayName,
      'vehicleModel': vehicleModel.toJson(),
      'fuelType': fuelType.toJson(),
      'transmissionType': transmissionType.toJson(),
      'featurePackage': featurePackage,
      'engineSpecs': engineSpecs.toJson(),
      'performanceSpecs': performanceSpecs.toJson(),
      'seatingCapacity': seatingCapacity,
      'price': price,
      'exShowroomPrice': exShowroomPrice,
      'onRoadPrice': onRoadPrice,
      'colors': colors,
      'images': images,
      'isActive': isActive,
      'isLaunched': isLaunched,
      'isDeleted': isDeleted,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class VehicleModelRef {
  final String id;
  final String name;
  final String displayName;

  VehicleModelRef({
    required this.id,
    required this.name,
    required this.displayName,
  });

  factory VehicleModelRef.fromJson(Map<String, dynamic> json) {
    return VehicleModelRef(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      displayName: json['displayName']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'displayName': displayName,
    };
  }
}

class FuelType {
  final String id;
  final String name;
  final String displayName;
  final String description;
  final String category;
  final bool isActive;
  final int sortOrder;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  FuelType({
    required this.id,
    required this.name,
    required this.displayName,
    required this.description,
    required this.category,
    required this.isActive,
    required this.sortOrder,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FuelType.fromJson(Map<String, dynamic> json) {
    return FuelType(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      displayName: json['displayName']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      isActive: json['isActive'] == true,
      sortOrder: json['sortOrder'] ?? 0,
      isDeleted: json['isDeleted'] == true,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'displayName': displayName,
      'description': description,
      'category': category,
      'isActive': isActive,
      'sortOrder': sortOrder,
      'isDeleted': isDeleted,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class TransmissionType {
  final String id;
  final String name;
  final String displayName;
  final String description;
  final String type;
  final bool isActive;
  final int sortOrder;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  TransmissionType({
    required this.id,
    required this.name,
    required this.displayName,
    required this.description,
    required this.type,
    required this.isActive,
    required this.sortOrder,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TransmissionType.fromJson(Map<String, dynamic> json) {
    return TransmissionType(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      displayName: json['displayName']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      isActive: json['isActive'] == true,
      sortOrder: json['sortOrder'] ?? 0,
      isDeleted: json['isDeleted'] == true,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'displayName': displayName,
      'description': description,
      'type': type,
      'isActive': isActive,
      'sortOrder': sortOrder,
      'isDeleted': isDeleted,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class EngineSpecs {
  final int capacity;
  final int maxPower;
  final int maxTorque;
  final int cylinders;
  final bool turbocharged;

  EngineSpecs({
    required this.capacity,
    required this.maxPower,
    required this.maxTorque,
    required this.cylinders,
    required this.turbocharged,
  });

  factory EngineSpecs.fromJson(Map<String, dynamic> json) {
    return EngineSpecs(
      capacity: (json['capacity'] is int)
          ? json['capacity']
          : (json['capacity'] is double)
              ? json['capacity'].toInt()
              : int.tryParse(json['capacity']?.toString() ?? '0') ?? 0,
      maxPower: (json['maxPower'] is int)
          ? json['maxPower']
          : (json['maxPower'] is double)
              ? json['maxPower'].toInt()
              : int.tryParse(json['maxPower']?.toString() ?? '0') ?? 0,
      maxTorque: (json['maxTorque'] is int)
          ? json['maxTorque']
          : (json['maxTorque'] is double)
              ? json['maxTorque'].toInt()
              : int.tryParse(json['maxTorque']?.toString() ?? '0') ?? 0,
      cylinders: (json['cylinders'] is int)
          ? json['cylinders']
          : (json['cylinders'] is double)
              ? json['cylinders'].toInt()
              : int.tryParse(json['cylinders']?.toString() ?? '0') ?? 0,
      turbocharged: json['turbocharged'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'capacity': capacity,
      'maxPower': maxPower,
      'maxTorque': maxTorque,
      'cylinders': cylinders,
      'turbocharged': turbocharged,
    };
  }
}

class PerformanceSpecs {
  final int mileage;
  final double acceleration;
  final int topSpeed;
  final int fuelCapacity;

  PerformanceSpecs({
    required this.mileage,
    required this.acceleration,
    required this.topSpeed,
    required this.fuelCapacity,
  });

  factory PerformanceSpecs.fromJson(Map<String, dynamic> json) {
    return PerformanceSpecs(
      mileage: (json['mileage'] is int)
          ? json['mileage']
          : (json['mileage'] is double)
              ? json['mileage'].toInt()
              : int.tryParse(json['mileage']?.toString() ?? '0') ?? 0,
      acceleration: (json['acceleration'] is double)
          ? json['acceleration']
          : (json['acceleration'] ?? 0).toDouble(),
      topSpeed: (json['topSpeed'] is int)
          ? json['topSpeed']
          : (json['topSpeed'] is double)
              ? json['topSpeed'].toInt()
              : int.tryParse(json['topSpeed']?.toString() ?? '0') ?? 0,
      fuelCapacity: (json['fuelCapacity'] is int)
          ? json['fuelCapacity']
          : (json['fuelCapacity'] is double)
              ? json['fuelCapacity'].toInt()
              : int.tryParse(json['fuelCapacity']?.toString() ?? '0') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mileage': mileage,
      'acceleration': acceleration,
      'topSpeed': topSpeed,
      'fuelCapacity': fuelCapacity,
    };
  }
}

class VehicleDetails {
  final String id;
  final String ad;
  final String vehicleType;
  final String manufacturerId;
  final String modelId;
  final String variantId;
  final int year;
  final int mileage;
  final String transmissionTypeId;
  final String fuelTypeId;
  final String color;
  final bool isFirstOwner;
  final bool hasInsurance;
  final bool hasRcBook;
  final List<dynamic> additionalFeatures;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Manufacturer manufacturer;
  final VehicleModel model;
  final VehicleVariant variant;
  final FuelType fuelType;
  final TransmissionType transmissionType;

  VehicleDetails({
    required this.id,
    required this.ad,
    required this.vehicleType,
    required this.manufacturerId,
    required this.modelId,
    required this.variantId,
    required this.year,
    required this.mileage,
    required this.transmissionTypeId,
    required this.fuelTypeId,
    required this.color,
    required this.isFirstOwner,
    required this.hasInsurance,
    required this.hasRcBook,
    required this.additionalFeatures,
    required this.createdAt,
    required this.updatedAt,
    required this.manufacturer,
    required this.model,
    required this.variant,
    required this.fuelType,
    required this.transmissionType,
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) {
    try {
      return VehicleDetails(
        id: json['_id']?.toString() ?? '',
        ad: json['ad']?.toString() ?? '',
        vehicleType: json['vehicleType']?.toString() ?? '',
        manufacturerId: json['manufacturerId']?.toString() ?? '',
        modelId: json['modelId']?.toString() ?? '',
        variantId: json['variantId']?.toString() ?? '',
        year: (json['year'] is int)
            ? json['year']
            : (json['year'] is double)
                ? json['year'].toInt()
                : int.tryParse(json['year']?.toString() ?? '0') ?? 0,
        mileage: (json['mileage'] is int)
            ? json['mileage']
            : (json['mileage'] is double)
                ? json['mileage'].toInt()
                : int.tryParse(json['mileage']?.toString() ?? '0') ?? 0,
        transmissionTypeId: json['transmissionTypeId']?.toString() ?? '',
        fuelTypeId: json['fuelTypeId']?.toString() ?? '',
        color: json['color']?.toString() ?? '',
        isFirstOwner: json['isFirstOwner'] == true,
        hasInsurance: json['hasInsurance'] == true,
        hasRcBook: json['hasRcBook'] == true,
        additionalFeatures: json['additionalFeatures'] ?? [],
        createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
            DateTime.now(),
        updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
            DateTime.now(),
        manufacturer: Manufacturer.fromJson(json['manufacturer'] ?? {}),
        model: VehicleModel.fromJson(json['model'] ?? {}),
        variant: VehicleVariant.fromJson(json['variant'] ?? {}),
        fuelType: FuelType.fromJson(json['fuelType'] ?? {}),
        transmissionType:
            TransmissionType.fromJson(json['transmissionType'] ?? {}),
      );
    } catch (e) {
      print('❌ Error parsing VehicleDetails: $e');
      print('📄 VehicleDetails JSON: $json');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'ad': ad,
      'vehicleType': vehicleType,
      'manufacturerId': manufacturerId,
      'modelId': modelId,
      'variantId': variantId,
      'year': year,
      'mileage': mileage,
      'transmissionTypeId': transmissionTypeId,
      'fuelTypeId': fuelTypeId,
      'color': color,
      'isFirstOwner': isFirstOwner,
      'hasInsurance': hasInsurance,
      'hasRcBook': hasRcBook,
      'additionalFeatures': additionalFeatures,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'manufacturer': manufacturer.toJson(),
      'model': model.toJson(),
      'variant': variant.toJson(),
      'fuelType': fuelType.toJson(),
      'transmissionType': transmissionType.toJson(),
    };
  }
}

class UserAdsResponse {
  final List<AdModel> data;
  final int total;

  UserAdsResponse({
    required this.data,
    required this.total,
  });

  factory UserAdsResponse.fromJson(Map<String, dynamic> json) {
    try {
      print('🔄 Parsing UserAdsResponse...');
      print('📄 Data field type: ${json['data'].runtimeType}');
      print('📄 Data field value: ${json['data']}');

      List<AdModel> adsList = [];

      if (json['data'] != null) {
        if (json['data'] is List) {
          print(
              '📄 Data is a List with ${(json['data'] as List).length} items');
          adsList = (json['data'] as List)
              .map((ad) => AdModel.fromJson(ad as Map<String, dynamic>))
              .toList();
        } else {
          print('❌ Data is not a List, it is: ${json['data'].runtimeType}');
          throw Exception('Data field is not a List');
        }
      } else {
        print('⚠️ Data field is null');
      }

      print('✅ Successfully parsed ${adsList.length} ads');
      return UserAdsResponse(
        data: adsList,
        total: json['total'] ?? adsList.length,
      );
    } catch (e) {
      print('❌ Error parsing UserAdsResponse: $e');
      print('❌ Error type: ${e.runtimeType}');
      print('📄 Full JSON: $json');
      rethrow;
    }
  }
}
