import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/features/showroom/bloc/showroom_bloc.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShowroomDetailView extends StatefulWidget {
  final UserModel showroomuser;
  const ShowroomDetailView({super.key, required this.showroomuser});

  @override
  State<ShowroomDetailView> createState() => _ShowroomDetailViewState();
}

class _ShowroomDetailViewState extends State<ShowroomDetailView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          _buildShowroomDetailSection(),
          SizedBox(height: 30),
          _buildShowroomList(),
        ],
      ),
    );
  }

  Widget _buildShowroomDetailSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: AppColors.blackColor),
                  onPressed: () {
                    context.pop();
                    context.read<ShowroomBloc>().add(FetchAllShowrooms());
                  },
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    const Text('Showroom Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor)),
                    Text(
                      widget.showroomuser.name,
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const Text('Email',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor)),
                Text(
                  widget.showroomuser.email,
                  style: TextStyle(color: AppColors.blackColor),
                ),
              ],
            ),
            Column(
              children: [
                const Text('Phone Number',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor)),
                Text(
                  widget.showroomuser.phoneNumber,
                  style: TextStyle(color: AppColors.blackColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShowroomList() {
    return BlocBuilder<ShowroomBloc, ShowroomState>(
      builder: (context, state) {
        if (state is ShowroomLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ShowroomLoaded) {
          return Column(
            children: [
              _buildTable(state.showroomusers),
              const SizedBox(height: 30),
              // _buildPaginationBar(state.currentPage, state.totalPages),
            ],
          );
        } else if (state is ShowroomError) {
          return Center(
              child: Text(state.message,
                  style: const TextStyle(color: Colors.red)));
        }
        return const Center(child: Text("No Showroom Users Found"));
      },
    );
  }

  Widget _buildTable(List<UserModel> users) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SingleChildScrollView(
              child: DataTable(
                columnSpacing: 100,
                headingRowColor: WidgetStateColor.resolveWith(
                    (states) => Color.fromARGB(66, 144, 140, 140)),
                dataRowColor: WidgetStatePropertyAll(AppColors.primaryColor),
                dataRowMinHeight: 40,
                dataRowMaxHeight: 40,
                columns: const [
                  DataColumn(
                      label: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('ID',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )),
                  DataColumn(
                      label: Text('Name',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Email',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Phone Number',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Status',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: users.asMap().entries.map((entry) {
                  return _buildUserRow(entry.key, entry.value);
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DataRow _buildUserRow(int index, UserModel user) {
    return DataRow(cells: [
      DataCell(Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Text('${index + 1}'),
      )),
      DataCell(Text(user.name)),
      DataCell(Text(user.email)),
      DataCell(Text(user.phoneNumber)),
      DataCell(
        ElevatedButton(
          onPressed: () {},
          child: Text('Status'),
        ),
      ),
    ]);
  }
}
