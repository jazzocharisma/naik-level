import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naik_level/core/theme/pixel_colors.dart';
import 'package:naik_level/core/theme/pixel_theme.dart';

double contrastRatio(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final lighter = la > lb ? la : lb;
  final darker = la > lb ? lb : la;
  return (lighter + 0.05) / (darker + 0.05);
}

void main() {
  group('Kontras warna (WCAG AA >= 4.5)', () {
    final pairs = <String, (Color, Color)>{
      'teks utama di background':
          (PixelColors.textPrimary, PixelColors.background),
      'teks utama di surface': (PixelColors.textPrimary, PixelColors.surface),
      'teks redup di surface': (PixelColors.textMuted, PixelColors.surface),
      'emas di background': (PixelColors.gold, PixelColors.background),
      'emas di surface': (PixelColors.gold, PixelColors.surface),
      'teks gelap di atas emas': (PixelColors.background, PixelColors.gold),
    };

    pairs.forEach((name, colors) {
      test(name, () {
        expect(contrastRatio(colors.$1, colors.$2), greaterThanOrEqualTo(4.5));
      });
    });
  });

  group('buildPixelTheme', () {
    final theme = buildPixelTheme();

    test('memakai warna background dan primary dari token', () {
      expect(theme.scaffoldBackgroundColor, PixelColors.background);
      expect(theme.colorScheme.primary, PixelColors.gold);
    });

    test('judul memakai font heading, isi memakai font body', () {
      expect(theme.textTheme.headlineMedium?.fontFamily, PixelFonts.heading);
      expect(theme.textTheme.bodyMedium?.fontFamily, PixelFonts.body);
    });
  });
}