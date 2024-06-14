import 'package:flutter/material.dart';

import 'package:rick_and_morty/providers/theme_provider.dart';

import 'package:provider/provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(
              !Provider.of<ThemeProvider>(context, listen: false).isDarkMode);
        },
        icon: Icon(
          Provider.of<ThemeProvider>(context).isDarkMode
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined,
          size: 27,
        ));
  }
}
