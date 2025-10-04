class AdModel {
  final String id;
  final String description;
  final int price;
  final List<String> images;
  final String location;
  final String category;
  final bool isActive;
  final bool soldOut;
  final DateTime postedAt;
  final DateTime updatedAt;
  final String postedBy;
  final AdUser user;
  final VehicleDetails? vehicleDetails;
  final List<dynamic> commercialVehicleDetails;
  final List<dynamic> propertyDetails;
  final int? year;

  AdModel({
    required this.id,
    required this.description,
    required this.price,
    required this.images,
    required this.location,
    required this.category,
    required this.isActive,
    required this.soldOut,
    required this.postedAt,
    required this.updatedAt,
    required this.postedBy,
    required this.user,
    this.vehicleDetails,
    required this.commercialVehicleDetails,
    required this.propertyDetails,
    this.year,
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
            : int.tryParse(json['year']?.toString() ?? ''),
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
      'description': description,
      'price': price,
      'images': images,
      'location': location,
      'category': category,
      'isActive': isActive,
      'soldOut': soldOut,
      'postedAt': postedAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'postedBy': postedBy,
      'user': user.toJson(),
      'vehicleDetails': vehicleDetails?.toJson(),
      'commercialVehicleDetails': commercialVehicleDetails,
      'propertyDetails': propertyDetails,
      'year': year,
    };
  }
}

class AdUser {
  final String id;
  final String name;
  final String email;

  AdUser({
    required this.id,
    required this.name,
    required this.email,
  });

  factory AdUser.fromJson(Map<String, dynamic> json) {
    try {
      return AdUser(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
        email: json['email']?.toString() ?? '',
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
            : int.tryParse(json['year']?.toString() ?? '0') ?? 0,
        mileage: (json['mileage'] is int)
            ? json['mileage']
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
