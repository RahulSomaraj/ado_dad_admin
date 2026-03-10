class AdminBroadcastNotificationModel {
  final String title;
  final String body;
  final String? targetType;
  final String? priority;
  final NotificationMedia? media;
  final Map<String, dynamic>? data;

  AdminBroadcastNotificationModel({
    required this.title,
    required this.body,
    this.targetType,
    this.priority,
    this.media,
    this.data,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      "title": title,
      "body": body,
    };

    if (targetType != null && targetType!.isNotEmpty) {
      json["targetType"] = targetType;
    }

    if (priority != null && priority!.isNotEmpty) {
      json["priority"] = priority;
    }

    if (media != null) {
      json["media"] = media!.toJson();
    }

    if (data != null && data!.isNotEmpty) {
      json["data"] = data;
    }

    return json;
  }
}

class NotificationMedia {
  final String type;
  final String url;

  NotificationMedia({
    required this.type,
    required this.url,
  });

  factory NotificationMedia.fromJson(Map<String, dynamic> json) {
    return NotificationMedia(
      type: json["type"]?.toString() ?? "",
      url: json["url"]?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "url": url,
    };
  }
}

class NotificationListResponse {
  final List<NotificationListItem> data;
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  NotificationListResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) {
    final list = (json["data"] as List<dynamic>? ?? [])
        .whereType<Map<String, dynamic>>()
        .map(NotificationListItem.fromJson)
        .toList();

    return NotificationListResponse(
      data: list,
      total: json["total"] ?? 0,
      page: json["page"] ?? 1,
      limit: json["limit"] ?? 10,
      totalPages: json["totalPages"] ?? 1,
      hasNext: json["hasNext"] ?? false,
      hasPrev: json["hasPrev"] ?? false,
    );
  }
}

class NotificationListItem {
  final String id;
  final String title;
  final String body;
  final String? targetType;
  final String? priority;
  final NotificationMedia? media;
  final Map<String, dynamic>? data;
  final String? response;
  final DateTime? createdAt;

  NotificationListItem({
    required this.id,
    required this.title,
    required this.body,
    this.targetType,
    this.priority,
    this.media,
    this.data,
    this.response,
    this.createdAt,
  });

  factory NotificationListItem.fromJson(Map<String, dynamic> json) {
    final data = json["data"];
    final dataMap = data is Map<String, dynamic> ? data : null;
    final mediaJson = dataMap?["media"];
    final media = mediaJson is Map<String, dynamic>
        ? NotificationMedia.fromJson(mediaJson)
        : null;

    final responseValue = json["response"];
    String? responseText;
    if (responseValue is String) {
      responseText = responseValue;
    } else if (responseValue is Map<String, dynamic>) {
      responseText = responseValue["error"]?.toString();
    }

    return NotificationListItem(
      id: json["_id"]?.toString() ?? "",
      title: json["title"]?.toString() ?? "",
      body: json["body"]?.toString() ?? "",
      targetType: dataMap?["targetType"]?.toString(),
      priority: dataMap?["priority"]?.toString(),
      media: media,
      data: dataMap,
      response: responseText,
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"].toString())
          : null,
    );
  }
}
