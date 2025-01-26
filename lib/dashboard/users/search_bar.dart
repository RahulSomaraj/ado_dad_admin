import 'package:flutter/material.dart';
import 'create_buton.dart';
import 'search_bar_isolate.dart';

class SearchBarController extends StatefulWidget {
  final void Function(String query) onSearch;
  final void Function(int pageIndex) onCreate;

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
  bool _isProcessing = false;

  void _performCreate() {
    if (!_isProcessing) {
      try {
        FocusScope.of(context).unfocus(); // Unfocus any active element
      } catch (e, stackTrace) {
        debugPrint('Error while unfocusing: $e');
        debugPrint(stackTrace.toString());
      }

      setState(() => _isProcessing = true);

      try {
        widget.onCreate(6); // Trigger the create callback
      } catch (e, stackTrace) {
        debugPrint('Error during onCreate callback: $e');
        debugPrint(stackTrace.toString());
      }

      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          // Check if the widget is still mounted before calling setState
          setState(() => _isProcessing = false);
        }
      });
    }
  }

  @override
  void dispose() {
    try {
      _searchController.dispose(); // Dispose the controller safely
    } catch (e, stackTrace) {
      debugPrint('Error during TextEditingController dispose: $e');
      debugPrint(stackTrace.toString());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          FocusScope.of(context).unfocus(); // Unfocus any active input element
        } catch (e, stackTrace) {
          debugPrint('Error during unfocus in GestureDetector: $e');
          debugPrint(stackTrace.toString());
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchBarIso(
                controller: _searchController,
                onSearch: widget.onSearch,
              ),
              const SizedBox(width: 10),
              CreateButton(
                isProcessing: _isProcessing,
                onCreate: _performCreate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
