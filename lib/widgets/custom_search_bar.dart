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
    const inputBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));
    const textStyle = TextStyle(color: Colors.white);
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        hintText: hintText,
        hintStyle: textStyle,
      ),
      style: textStyle,
      onChanged: onChanged,
    );
  }
}
