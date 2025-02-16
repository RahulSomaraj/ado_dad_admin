import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class SearchBarIso extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String query) onSearch;

  const SearchBarIso({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  State<SearchBarIso> createState() => _SearchBarIsoState();
}

class _SearchBarIsoState extends State<SearchBarIso> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose of the FocusNode when the widget is removed
    super.dispose();
  }

  void _performSearch() {
    try {
      FocusScope.of(context).unfocus(); // Unfocus the TextField
      widget.onSearch(widget.controller.text); // Trigger the search callback
    } catch (e, stackTrace) {
      // Handle any errors gracefully
      debugPrint('Error during search: $e');
      debugPrint(stackTrace.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode, // Use the locally managed FocusNode
        decoration: const InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
        onTap: () {
          try {
            // Request focus when the TextField is tapped
            if (!_focusNode.hasFocus) {
              _focusNode.requestFocus();
            }
            if (_focusNode.hasFocus) {
              print(_focusNode);
              // _focusNode.requestFocus();
            }
          } catch (e, stackTrace) {
            // Handle focus-related errors
            debugPrint('Error during focus: $e');
            debugPrint(stackTrace.toString());
          }
        },
        onSubmitted: (_) => _performSearch(), // Trigger search on "Enter" key
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
