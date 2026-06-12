/// Canonical list of vehicle categories used by manufacturers.
///
/// Single source of truth so the list filter, add form, edit form and detail
/// view all use the same values (sent to the backend) and human labels. The
/// `value` strings MUST match the backend `vehicleCategory` enum:
/// passenger_car | two_wheeler | commercial_vehicle | luxury | suv
class VehicleCategory {
  final String value;
  final String label;
  const VehicleCategory(this.value, this.label);
}

const List<VehicleCategory> kVehicleCategories = [
  VehicleCategory('passenger_car', 'Passenger Car'),
  VehicleCategory('two_wheeler', 'Two Wheeler'),
  VehicleCategory('commercial_vehicle', 'Commercial Vehicle'),
  VehicleCategory('luxury', 'Luxury'),
  VehicleCategory('suv', 'SUV'),
];

/// Human-readable label for a raw category value. Falls back to a title-cased
/// version of the raw string (so unknown/new backend values still render
/// sensibly), or an em dash when empty/null.
String prettyVehicleCategory(String? raw) {
  if (raw == null || raw.trim().isEmpty) return '—';
  for (final c in kVehicleCategories) {
    if (c.value == raw) return c.label;
  }
  return raw
      .split('_')
      .where((w) => w.isNotEmpty)
      .map((w) => w[0].toUpperCase() + w.substring(1))
      .join(' ');
}
