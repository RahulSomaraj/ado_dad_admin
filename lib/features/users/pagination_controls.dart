import 'package:flutter/material.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int lastPage;
  final int rowsPerPage;
  final bool isLoading; // Add isLoading to control button states
  final void Function(int page) onPageChange;
  final void Function(int rows) onRowsPerPageChange;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.lastPage,
    required this.rowsPerPage,
    required this.isLoading,
    required this.onPageChange,
    required this.onRowsPerPageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Page $currentPage of $lastPage'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: (!isLoading && currentPage > 1)
                        ? () => onPageChange(currentPage - 1)
                        : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: (!isLoading && currentPage < lastPage)
                        ? () => onPageChange(currentPage + 1)
                        : null,
                  ),
                ],
              ),
              DropdownButton<int>(
                value: rowsPerPage,
                items: [5, 10, 20]
                    .map((value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text('Rows: $value'),
                        ))
                    .toList(),
                onChanged: isLoading
                    ? null
                    : (value) {
                        if (value != null) {
                          onRowsPerPageChange(value);
                        }
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
