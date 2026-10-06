import 'package:flutter/material.dart';
import 'package:naik_level/core/theme/pixel_colors.dart';

abstract final class PixelFonts {
  static const heading = 'PressStart2P';
  static const body = 'PixelifySans';
}

ThemeData buildPixelTheme() {
  const colorScheme = ColorScheme.dark(
    primary: PixelColors.gold,
    onPrimary: PixelColors.background,
    secondary: PixelColors.green,
    onSecondary: PixelColors.background,
    tertiary: PixelColors.purple,
    error: PixelColors.red,
    surface: PixelColors.surface,
    onSurface: PixelColors.textPrimary,
    outline: PixelColors.border,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: PixelColors.background,
    fontFamily: PixelFonts.body,
    textTheme: _textTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: PixelColors.surface,
      foregroundColor: PixelColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: PixelFonts.heading,
        fontSize: 14,
        color: PixelColors.gold,
      ),
      shape: Border(bottom: BorderSide(color: PixelColors.border, width: 4)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: PixelColors.surface,
      indicatorColor: PixelColors.gold.withValues(alpha: 0.25),
      indicatorShape: const RoundedRectangleBorder(),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return TextStyle(
          fontFamily: PixelFonts.body,
          fontSize: 14,
          color: selected ? PixelColors.gold : PixelColors.textMuted,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? PixelColors.gold : PixelColors.textMuted,
        );
      }),
    ),
  );
}

TextTheme _textTheme() {
  // Press Start 2P lebar sekali, jadi ukurannya sengaja kecil.
  const heading = TextStyle(
    fontFamily: PixelFonts.heading,
    color: PixelColors.textPrimary,
  );
  const body = TextStyle(
    fontFamily: PixelFonts.body,
    color: PixelColors.textPrimary,
  );

  return TextTheme(
    displayLarge: heading.copyWith(fontSize: 28),
    displayMedium: heading.copyWith(fontSize: 24),
    displaySmall: heading.copyWith(fontSize: 20),
    headlineLarge: heading.copyWith(fontSize: 20),
    headlineMedium: heading.copyWith(fontSize: 16),
    headlineSmall: heading.copyWith(fontSize: 14),
    titleLarge: heading.copyWith(fontSize: 14),
    titleMedium: body.copyWith(fontSize: 18),
    titleSmall: body.copyWith(fontSize: 16),
    bodyLarge: body.copyWith(fontSize: 18),
    bodyMedium: body.copyWith(fontSize: 16),
    bodySmall: body.copyWith(fontSize: 14, color: PixelColors.textMuted),
    labelLarge: body.copyWith(fontSize: 16),
    labelMedium: body.copyWith(fontSize: 14),
    labelSmall: body.copyWith(fontSize: 12, color: PixelColors.textMuted),
  );
}
