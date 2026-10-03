import 'package:ado_dad_admin/common/app_colors.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/features/showroom/bloc/showroom_bloc.dart';
import 'package:ado_dad_admin/features/widgets/list_page.dart';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Showroom extends StatefulWidget {
  const Showroom({super.key});

  @override
  State<Showroom> createState() => _ShowroomState();
}

class _ShowroomState extends State<Showroom> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _horizontalScrollController = ScrollController();
  int rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchShowrooms();
    });
  }

  Future<void> _fetchShowrooms() async {
    final userType = await getUserType();
    if (mounted) {
      if (userType == 'SR') {
        context.read<ShowroomBloc>().add(const FetchCurrentUserShowroom());
      } else {
        context.read<ShowroomBloc>().add(const FetchAllShowrooms());
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListPageHeader(
            breadcrumb: "Home / Showrooms",
            title: "Showrooms",
            subtitle: "Manage showrooms",
            searchHint: "Search showrooms…",
            searchController: _searchController,
            onSearch: (query) {
              context.read<ShowroomBloc>().add(
                    FetchAllShowrooms(
                      page: 1,
                      limit: 10,
                      searchQuery: query.isNotEmpty ? query : '',
                    ),
                  );
            },
            addLabel: "Add showroom",
            onAdd: () => context.push('/add-showroom'),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: listCardDecoration(),
            clipBehavior: Clip.antiAlias,
            child: _buildShowroomList(),
          ),
        ],
      ),
    );
  }

  Widget _buildShowroomList() {
    return BlocBuilder<ShowroomBloc, ShowroomState>(
      builder: (context, state) {
        if (state is ShowroomLoading) {
          return _statusBox(const CircularProgressIndicator());
        } else if (state is ShowroomLoaded) {
          if (state.showroomusers.isEmpty) {
            return _statusBox(Text("No showrooms found",
                style: GoogleFonts.inter(color: AppColors.textSecondary)));
          }
          return Column(
            children: [
              FillWidthDataTable(
                controller: _horizontalScrollController,
                minWidth: 820,
                columns: [
                  listColumn('#'),
                  listColumn('Name'),
                  listColumn('Email'),
                  listColumn('Phone'),
                  listColumn('Actions'),
                ],
                rows: state.showroomusers
                    .asMap()
                    .entries
                    .map((e) => _buildShowroomRow(e.key, e.value))
                    .toList(),
              ),
              ListPagination(
                currentPage: state.currentPage,
                totalPages: state.totalPages,
                rowsPerPage: rowsPerPage,
                onRowsPerPageChanged: (v) {
                  setState(() => rowsPerPage = v);
                  context
                      .read<ShowroomBloc>()
                      .add(FetchAllShowrooms(page: 1, limit: rowsPerPage));
                },
                onPageChanged: (p) {
                  context
                      .read<ShowroomBloc>()
                      .add(FetchAllShowrooms(page: p, limit: rowsPerPage));
                },
              ),
            ],
          );
        } else if (state is ShowroomError) {
          return _statusBox(Text(state.message,
              style: GoogleFonts.inter(color: AppColors.danger)));
        }
        return _statusBox(Text("No showrooms found",
            style: GoogleFonts.inter(color: AppColors.textSecondary)));
      },
    );
  }

  Widget _statusBox(Widget child) => Padding(
        padding: const EdgeInsets.all(48),
        child: Center(child: child),
      );

  DataRow _buildShowroomRow(int index, UserModel user) {
    final cellStyle =
        GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary);
    return DataRow(cells: [
      DataCell(Text('${index + 1}',
          style: GoogleFonts.inter(
              fontSize: 13, color: AppColors.textSecondary))),
      DataCell(SizedBox(
        width: 180,
        child: Text(user.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: cellStyle.copyWith(fontWeight: FontWeight.w500)),
      )),
      DataCell(SizedBox(
        width: 220,
        child: Text(user.email,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.inter(
                fontSize: 13, color: AppColors.textSecondary)),
      )),
      DataCell(Text(user.phoneNumber, style: cellStyle)),
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListRowAction(
            icon: Icons.edit_outlined,
            tooltip: "Edit",
            onTap: () => context.push('/edit-showroom', extra: user),
          ),
          ListRowAction(
            icon: Icons.visibility_outlined,
            tooltip: "View",
            onTap: () => context.push('/view-showroom', extra: user),
          ),
        ],
      )),
    ]);
  }
}
