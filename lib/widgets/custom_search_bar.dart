import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;
  const CustomSearchBar({
    super.key,
    this.onChanged,
    this.hintText = 'Search by name',
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: onChanged,
      hintText: hintText,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      elevation: const MaterialStatePropertyAll(0),
      shape: const MaterialStatePropertyAll(
          LinearBorder(bottom: LinearBorderEdge(size: 1))),
      side: const MaterialStatePropertyAll(BorderSide(color: Colors.black)),
    );
  }
}
