import 'package:flutter/material.dart';

class SearchBarController extends StatefulWidget {
  final void Function(String query) onSearch;
  final void Function() onCreate;

  const SearchBarController({
    super.key,
    required this.onSearch,
    required this.onCreate,
  });

  @override
  State<SearchBarController> createState() => _SearchBarControllerState();
}

class _SearchBarControllerState extends State<SearchBarController> {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch() {
    widget.onSearch(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(30), // Match padding with PaginationControls
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Search Field
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none, // No border for consistency
                    prefixIcon: Icon(Icons.search),
                  ),
                  onSubmitted: (_) => _performSearch(),
                  style: const TextStyle(fontSize: 16), // Adjusted font size
                ),
              ),
              const SizedBox(width: 10),
              // Create Button
              GestureDetector(
                onTap: widget.onCreate,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        offset: const Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 6,
                        offset: const Offset(-4, -4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
