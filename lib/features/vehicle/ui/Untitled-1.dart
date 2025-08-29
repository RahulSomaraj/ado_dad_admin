// import 'package:ado_dad_admin/common/app_colors.dart';
// import 'package:ado_dad_admin/features/vehicle/bloc/vehicle_bloc.dart';
// import 'package:ado_dad_admin/features/vehicle_company/bloc/vehicle_company_bloc.dart';
// import 'package:ado_dad_admin/models/vehicle_request_model.dart'; // Update to new model
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class VehicleList extends StatefulWidget {
//   const VehicleList({super.key});

//   @override
//   State<VehicleList> createState() => _VehicleListState();
// }

// class _VehicleListState extends State<VehicleList> {
//   final TextEditingController _searchController = TextEditingController();
//   int rowsPerPage = 10;

//   @override
//   void initState() {
//     super.initState();
//     context.read<VehicleBloc>().add(const FetchAllVehicles());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 20),
//         _buildHeaderSection(),
//         const SizedBox(height: 20),
//         _buildVehicleList(),
//       ],
//     );
//   }

//   Widget _buildHeaderSection() {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "Vehicles Management",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Spacer(),
//             _buildSearchBar(),
//             const SizedBox(width: 15),
//             _buildAddButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchBar() {
//     return Container(
//       width: 200,
//       height: 50,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           const SizedBox(width: 8),
//           const Icon(Icons.search, color: Colors.black, size: 20),
//           const SizedBox(width: 8),
//           Expanded(
//             child: TextField(
//               controller: _searchController,
//               decoration: const InputDecoration(
//                 hintText: "Search...",
//                 border: InputBorder.none,
//                 hintStyle: TextStyle(fontSize: 14),
//               ),
//               style: const TextStyle(fontSize: 14),
//               onChanged: (query) {
//                 context.read<VehicleBloc>().add(
//                       FetchAllVehicles(
//                         page: 1,
//                         limit: 10,
//                         searchQuery: query.isNotEmpty ? query : '',
//                       ),
//                     );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAddButton() {
//     return SizedBox(
//       width: 160,
//       height: 50,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//           textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         onPressed: () => context.push('/add-vehicle'),
//         child: const Row(
//           children: [
//             Icon(Icons.add, color: Colors.black, size: 20),
//             SizedBox(width: 8),
//             Text('Add Vehicle'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildVehicleList() {
//     return BlocBuilder<VehicleBloc, VehicleState>(
//       builder: (context, state) {
//         if (state is VehicleLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is VehicleLoaded) {
//           return Column(
//             children: [
//               _buildVehicleTable(state.vehicles, state.currentPage),
//               const SizedBox(height: 30),
//               _buildPaginationBar(state.currentPage, state.totalPages),
//             ],
//           );
//         } else if (state is VehicleError) {
//           return Center(
//             child:
//                 Text(state.message, style: const TextStyle(color: Colors.red)),
//           );
//         }
//         return const Center(child: Text("No Vehicles Found"));
//       },
//     );
//   }

//   Widget _buildVehicleTable(List<VehicleRequest> vehicles, int currentPage) {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: Container(
//         width: double.infinity,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Card(
//             elevation: 3,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: DataTable(
//                 columnSpacing: 105,
//                 headingRowColor: WidgetStateColor.resolveWith(
//                     (states) => AppColors.greyColor2),
//                 dataRowMinHeight: 55,
//                 dataRowMaxHeight: 55,
//                 columns: _buildTableColumns(),
//                 rows: vehicles
//                     .asMap()
//                     .entries
//                     .map(
//                       (entry) =>
//                           _buildVehicleRow(entry.key, entry.value, currentPage),
//                     )
//                     .toList(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   List<DataColumn> _buildTableColumns() {
//     return const [
//       DataColumn(
//           label:
//               Padding(padding: EdgeInsets.only(left: 30), child: Text('ID'))),
//       DataColumn(label: Text('Vehicle Name & Model')),
//       DataColumn(label: Text('Model Type')),
//       DataColumn(label: Text('Wheeler Type')),
//       DataColumn(label: Text('Vendor')),
//       DataColumn(label: Text('Actions')),
//     ];
//   }

//   DataRow _buildVehicleRow(int index, VehicleRequest vehicle, int currentPage) {
//     int rowNumber = ((currentPage - 1) * rowsPerPage) + index + 1;
//     return DataRow(
//       cells: [
//         DataCell(Padding(
//             padding: const EdgeInsets.only(left: 30),
//             child: Text('$rowNumber'))),
//         DataCell(Text(
//           '${vehicle.name} - ${vehicle.modelName}',
//           overflow: TextOverflow.ellipsis,
//         )),
//         DataCell(Text(vehicle.modelType)),
//         DataCell(Text(vehicle.wheelerType)),
//         DataCell(Text(vehicle.vendor)),
//         DataCell(
//           Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.edit, color: Colors.black),
//                 onPressed: () {
//                   context.push('/edit-vehicle', extra: vehicle);
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.remove_red_eye_outlined,
//                     color: Colors.black),
//                 onPressed: () {
//                   context.push('/view-vehicle', extra: vehicle);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPaginationBar(int currentPage, int totalPages) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         const Text("Rows per page: "),
//         DropdownButton<int>(
//           value: rowsPerPage,
//           items: [10, 20]
//               .map((e) => DropdownMenuItem(value: e, child: Text(e.toString())))
//               .toList(),
//           onChanged: (value) => setState(() => rowsPerPage = value!),
//         ),
//         IconButton(
//             icon: const Icon(Icons.chevron_left),
//             onPressed: currentPage > 1 ? () {} : null),
//         Text("Page $currentPage of $totalPages"),
//         IconButton(
//             icon: const Icon(Icons.chevron_right),
//             onPressed: currentPage < totalPages ? () {} : null),
//       ],
//     );
//   }
// }
