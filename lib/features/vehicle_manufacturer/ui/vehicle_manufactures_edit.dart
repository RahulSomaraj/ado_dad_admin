import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/vehicle_categories.dart';
import 'package:ado_dad_admin/features/vehicle_manufacturer/bloc/bloc/vehicle_manufacturer_bloc.dart';
import 'package:ado_dad_admin/features/widgets/form_kit.dart';
import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VehicleManufacturesEdit extends StatefulWidget {
  final VehicleManufacturer vehiclemanufacturer;
  const VehicleManufacturesEdit({super.key, required this.vehiclemanufacturer});

  @override
  State<VehicleManufacturesEdit> createState() =>
      _VehicleManufacturesEditState();
}

class _VehicleManufacturesEditState extends State<VehicleManufacturesEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name;
  late String _displayname;
  late String _description;
  late String _logo;
  late String _website;
  late String _foundedYear;
  late String _headquarters;
  late String _originCountry;
  late bool _isActive;
  late bool _isPremium;
  String? _vehicleCategory;
  List<String> _countryList = [];

  @override
  void initState() {
    super.initState();
    final m = widget.vehiclemanufacturer;
    _name = m.name;
    _displayname = m.displayName;
    _description = m.description!;
    _logo = m.logo!;
    _website = m.website!;
    _foundedYear = m.foundedYear.toString();
    _headquarters = m.headquarters!;
    _originCountry = m.originCountry;
    _isActive = m.isActive;
    _isPremium = m.isPremium;
    _vehicleCategory = m.vehicleCategory;
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    List<String> countries =
        CountryService().getAll().map((country) => country.name).toList();

    setState(() {
      _countryList = countries;
    });
  }

  void _updateVehicleManufacturer() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_vehicleCategory == null || _vehicleCategory!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a vehicle category")),
        );
        return;
      }

      final updated = VehicleManufacturer(
        id: widget.vehiclemanufacturer.id,
        name: _name,
        displayName: _displayname,
        originCountry: _originCountry,
        description: _description,
        logo: _logo,
        website: _website,
        foundedYear: int.tryParse(_foundedYear) ?? 0,
        headquarters: _headquarters,
        isActive: _isActive,
        isPremium: _isPremium,
        vehicleCategory: _vehicleCategory!,
      );

      context.read<VehicleManufacturerBloc>().add(
            VehicleManufacturerEvent.updateManufacturer(updated),
          );
    }
  }

  void _showSuccessPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/vehicle-manufactures');
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VehicleManufacturerBloc, VehicleManufacturerState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (response) {
            _showSuccessPopup(context, "Manufacturer updated successfully.");
          },
          error: (message) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<VehicleManufacturerBloc, VehicleManufacturerState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  FormHeaderBar(
                    breadcrumb: "Manufacturers / Edit",
                    title: "Edit Manufacturer",
                    onBack: () {
                      context.pop();
                      context
                          .read<VehicleManufacturerBloc>()
                          .add(FetchAllVehicleManufacturers());
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildUpdateForm(state),
                ],
              ),
          );
        },
      ),
    );
  }

  // ignore: unused_element
  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: AppColors.blackColor),
              onPressed: () {
                context.pop();
                context
                    .read<VehicleManufacturerBloc>()
                    .add(FetchAllVehicleManufacturers());
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Edit Vehicle Manufacturer",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateForm(VehicleManufacturerState state) {
    final isLoading = state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Container(
          decoration: formCardDecoration(),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderStrip(
                icon: Icons.factory_outlined,
                initials: _displayname.isNotEmpty
                    ? _displayname.characters.first.toUpperCase()
                    : null,
                image: (_logo.isNotEmpty &&
                        (_logo.startsWith('http')))
                    ? NetworkImage(_logo)
                    : null,
                title: _displayname.isNotEmpty ? _displayname : "Manufacturer",
                subtitle: "Edit brand details",
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormSectionTitle("Brand details"),
                      _buildFormRow([
                        _buildFormField(
                            "Manufacturer Name", _name, (v) => _name = v!),
                        _buildFormField("Display Name", _displayname,
                            (v) => _displayname = v!),
                      ]),
                      const SizedBox(height: 15),
                  _buildFormRow([
                    LabeledField(
                      label: "Origin country",
                      child: DropdownButtonFormField<String>(
                        value: _originCountry,
                        isExpanded: true,
                        decoration: formInputDecoration("Select country"),
                        items: _countryList
                            .map((country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(
                                    country,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        onChanged: (v) =>
                            setState(() => _originCountry = v ?? ''),
                        validator: (v) => (v == null || v.isEmpty)
                            ? 'Country is required'
                            : null,
                      ),
                    ),
                    _buildFormField(
                        "Description", _description, (v) => _description = v!),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    _buildFormField("Logo URL", _logo, (v) => _logo = v!),
                    _buildFormField("Website", _website, (v) => _website = v!),
                  ]),
                  const SizedBox(height: 15),
                  _buildFormRow([
                    _buildFormField(
                        "Founded Year", _foundedYear, (v) => _foundedYear = v!),
                    _buildFormField("Headquarters", _headquarters,
                        (v) => _headquarters = v!),
                  ]),
                  const SizedBox(height: 20),
                  const FormSectionTitle("Classification & status"),
                  LabeledField(
                    label: "Vehicle category",
                    child: DropdownButtonFormField<String>(
                      value: _vehicleCategory,
                      isExpanded: true,
                      decoration: formInputDecoration("Select category"),
                      items: kVehicleCategories
                          .map((category) => DropdownMenuItem(
                                value: category.value,
                                child: Text(category.label),
                              ))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          _vehicleCategory = v;
                        });
                      },
                      onSaved: (v) {
                        _vehicleCategory = v;
                      },
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Vehicle Category is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 14),
                  _toggleRow(),
                  const SizedBox(height: 22),
                  PrimaryFormButton(
                    label: "Update Manufacturer",
                    loading: isLoading,
                    onPressed: _updateVehicleManufacturer,
                  ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toggleRow() {
    return Wrap(
      spacing: 24,
      runSpacing: 8,
      children: [
        _switchTile("Active", _isActive, (v) => setState(() => _isActive = v)),
        _switchTile(
            "Premium", _isPremium, (v) => setState(() => _isPremium = v)),
      ],
    );
  }

  Widget _switchTile(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: value,
          activeColor: AppColors.accent,
          onChanged: onChanged,
        ),
        const SizedBox(width: 4),
        Text(label,
            style:
                const TextStyle(fontSize: 14, color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildFormRow(List<Widget> children) => TwoColGrid(children);

  Widget _buildFormField(
    String label,
    String initialValue,
    Function(String?) onSaved,
  ) {
    return LabeledField(
      label: label,
      child: TextFormField(
        initialValue: initialValue,
        decoration: formInputDecoration("Enter ${label.toLowerCase()}"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$label is required";
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
