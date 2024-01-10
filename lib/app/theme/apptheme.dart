import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

class AppColorScheme {
  static ColorScheme get light => _getColorScheme(Brightness.light);
  static ColorScheme get dark => _getColorScheme(Brightness.dark);
}

ColorScheme _getColorScheme(Brightness brightness) {
  return SeedColorScheme.fromSeeds(
    brightness: brightness,
    primary: const Color.fromARGB(255, 67, 190, 48),
    primaryKey: const Color(0xFFC4E860),
    secondary: const Color(0xFF1B2121),
    tertiary: const Color(0xFFEEFCE3),
    background: const Color.fromARGB(255, 226, 229, 233),
    tones: FlexTones.vivid(brightness),
  );
}

const black = Color(0xFF020202);
const smoke = Color(0xFFF7ECC9);
const blue = Color(0xFF9AB5DC);
const green = Color(0xFFA8D672);
const orange = Color(0xFFEA7A54);
const yellow = Color(0xFFF5D14A);

class JobSenseTheme {
  static ThemeData get light => ThemeData(
        fontFamily: 'Gilroy',
        useMaterial3: true,
        colorScheme: AppColorScheme.light,
      );
  static ThemeData get dark => ThemeData(
        fontFamily: 'Gilroy',
        useMaterial3: true,
        colorScheme: AppColorScheme.dark,
      );
}
