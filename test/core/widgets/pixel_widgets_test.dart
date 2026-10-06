import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naik_level/core/theme/pixel_theme.dart';
import 'package:naik_level/core/widgets/pixel_button.dart';
import 'package:naik_level/core/widgets/pixel_panel.dart';
import 'package:naik_level/core/widgets/pixel_progress_bar.dart';

Widget wrap(Widget child) {
  return MaterialApp(
    theme: buildPixelTheme(),
    home: Scaffold(body: Center(child: child)),
  );
}

int countKey(WidgetTester tester, String key) =>
    tester.widgetList(find.byKey(ValueKey(key))).length;

void main() {
  group('PixelButton', () {
    testWidgets('memanggil onPressed saat di-tap', (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        wrap(PixelButton(label: 'Mulai', onPressed: () => taps++)),
      );

      await tester.tap(find.text('Mulai'));
      await tester.pump();

      expect(taps, 1);
    });

    testWidgets('target sentuh minimal 48dp', (tester) async {
      await tester.pumpWidget(
        wrap(PixelButton(label: 'OK', onPressed: () {})),
      );

      expect(tester.getSize(find.byType(PixelButton)).height, greaterThanOrEqualTo(48));
    });

    testWidgets('nonaktif tidak crash saat di-tap', (tester) async {
      await tester.pumpWidget(
        wrap(const PixelButton(label: 'Terkunci', onPressed: null)),
      );

      await tester.tap(find.text('Terkunci'));
      await tester.pump();

      expect(find.text('Terkunci'), findsOneWidget);
    });
  });

  group('PixelPanel', () {
    testWidgets('menampilkan child', (tester) async {
      await tester.pumpWidget(wrap(const PixelPanel(child: Text('Isi panel'))));

      expect(find.text('Isi panel'), findsOneWidget);
    });
  });

  group('PixelProgressBar', () {
    test('filledSegments membatasi nilai di luar rentang', () {
      expect(PixelProgressBar.filledSegments(-1, 10), 0);
      expect(PixelProgressBar.filledSegments(0, 10), 0);
      expect(PixelProgressBar.filledSegments(0.35, 10), 3);
      expect(PixelProgressBar.filledSegments(1, 10), 10);
      expect(PixelProgressBar.filledSegments(2, 10), 10);
      expect(PixelProgressBar.filledSegments(double.nan, 10), 0);
    });

    testWidgets('mengisi segmen sesuai value', (tester) async {
      await tester.pumpWidget(
        wrap(const SizedBox(width: 200, child: PixelProgressBar(value: 0.35))),
      );

      expect(countKey(tester, 'pixel-segment-filled'), 3);
      expect(countKey(tester, 'pixel-segment-empty'), 7);
    });

    testWidgets('value 1.0 mengisi semua segmen', (tester) async {
      await tester.pumpWidget(
        wrap(const SizedBox(width: 200, child: PixelProgressBar(value: 1))),
      );

      expect(countKey(tester, 'pixel-segment-filled'), 10);
      expect(countKey(tester, 'pixel-segment-empty'), 0);
    });
  });
}