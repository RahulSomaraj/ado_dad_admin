class BannerUploadRequest {
  final String? id;
  final String title;
  final String desktopImage;
  final String tabletImage;
  final String phoneImage;
  final String link;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BannerUploadRequest({
    this.id,
    required this.title,
    required this.desktopImage,
    required this.tabletImage,
    required this.phoneImage,
    required this.link,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      if (id != null) "_id": id,
      "title": title,
      "desktopImage": desktopImage,
      "tabletImage": tabletImage,
      "phoneImage": phoneImage,
      "link": link,
      if (createdAt != null) "createdAt": createdAt!.toIso8601String(),
      if (updatedAt != null) "updatedAt": updatedAt!.toIso8601String(),
    };
  }

  // For update requests - excludes ID field since API doesn't want it in body
  Map<String, dynamic> toUpdateJson() {
    return {
      "title": title,
      "desktopImage": desktopImage,
      "tabletImage": tabletImage,
      "phoneImage": phoneImage,
      "link": link,
      if (createdAt != null) "createdAt": createdAt!.toIso8601String(),
      if (updatedAt != null) "updatedAt": updatedAt!.toIso8601String(),
    };
  }

  // factory BannerUploadRequest.fromJson(Map<String, dynamic> json) {
  //   return BannerUploadRequest(
  //     title: json["title"] as String,
  //     desktopImage: json["desktopImage"] as String,
  //     tabletImage: json["tabletImage"] as String,
  //     phoneImage: json["phoneImage"] as String,
  //     link: json["link"] as String,
  //   );
  // }

  factory BannerUploadRequest.fromJson(Map<String, dynamic> json) {
    return BannerUploadRequest(
      id: json['_id'],
      title: json["title"] ?? "",
      desktopImage: json["desktopImage"] ?? json["image"] ?? "",
      tabletImage: json["tabletImage"] ?? json["image"] ?? "",
      phoneImage: json["phoneImage"] ?? json["image"] ?? "",
      link: json["link"] ?? "",
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
      updatedAt: json["updatedAt"] != null
          ? DateTime.tryParse(json["updatedAt"])
          : null,
    );
  }
}

class BannerResponse {
  final List<BannerUploadRequest> banners;
  final int totalPages;
  final int currentPage;

  BannerResponse({
    required this.banners,
    required this.totalPages,
    required this.currentPage,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    // Handle different response formats
    List<dynamic> bannersList;

    if (json.containsKey('banners') && json['banners'] is List) {
      bannersList = json['banners'] as List;
    } else if (json.containsKey('data') && json['data'] is List) {
      bannersList = json['data'] as List;
    } else {
      // Try to find any list field
      bannersList = [];
      for (var key in json.keys) {
        if (json[key] is List) {
          bannersList = json[key] as List;
          break;
        }
      }
    }

    // Helper function to safely convert to int
    int safeInt(dynamic value, int defaultValue) {
      if (value == null) return defaultValue;
      if (value is int) return value;
      if (value is String) {
        return int.tryParse(value) ?? defaultValue;
      }
      return defaultValue;
    }

    return BannerResponse(
      banners: bannersList
          .map((banner) =>
              BannerUploadRequest.fromJson(banner as Map<String, dynamic>))
          .toList(),
      totalPages: safeInt(
        json['totalPages'] ?? json['totalpages'] ?? json['totalPages'],
        1,
      ),
      currentPage: safeInt(
        json['currentPage'] ?? json['currentpage'] ?? json['page'],
        1,
      ),
    );
  }
}
