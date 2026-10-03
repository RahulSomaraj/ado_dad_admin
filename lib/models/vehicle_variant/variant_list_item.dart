import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart';

/// A defensively-parsed row for the standalone Variants list.
///
/// The `/vehicle-inventory/variants` list endpoint populates `vehicleModel`
/// with `{ _id, name, displayName }`, plus fuel/transmission and specs. This
/// wrapper reuses the null-tolerant [VehicleVariantResponseModel] for the spec
/// data and additionally carries the parent model name + a [VehicleModel]
/// object so rows can navigate to the variant view/edit screens.
class VariantListItem {
  final VehicleVariantResponseModel variant;
  final String modelName;
  final VehicleModel model;

  VariantListItem({
    required this.variant,
    required this.modelName,
    required this.model,
  });

  factory VariantListItem.fromJson(Map<String, dynamic> json) {
    final variant = VehicleVariantResponseModel.fromJson(json);

    String modelName = '—';
    VehicleModel model = const VehicleModel(
      id: null,
      name: '',
      displayName: '',
      vehicleType: '',
    );

    final raw = json['vehicleModel'];
    if (raw is Map<String, dynamic>) {
      try {
        model = VehicleModel.fromJson(raw);
      } catch (_) {
        // keep fallback model
      }
      final dn = (raw['displayName'] ?? '').toString();
      final nm = (raw['name'] ?? '').toString();
      modelName = dn.isNotEmpty ? dn : (nm.isNotEmpty ? nm : '—');
    }

    return VariantListItem(
      variant: variant,
      modelName: modelName,
      model: model,
    );
  }
}

class VariantListPage {
  final List<VariantListItem> items;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  VariantListPage({
    required this.items,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory VariantListPage.fromJson(Map<String, dynamic> json) {
    final list = (json['data'] as List?) ?? const [];
    return VariantListPage(
      items: list
          .whereType<Map<String, dynamic>>()
          .map(VariantListItem.fromJson)
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
    );
  }
}
