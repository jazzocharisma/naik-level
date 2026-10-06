import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naik_level/app/app.dart';
import 'package:naik_level/features/home/home_screen.dart';
import 'package:naik_level/features/quests/quests_screen.dart';

void main() {
  testWidgets('menampilkan Home lalu bisa pindah ke tab Quest', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: NaikLevelApp()));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    await tester.tap(find.byIcon(Icons.flag_outlined));
    await tester.pumpAndSettle();

    expect(find.byType(QuestsScreen), findsOneWidget);
  });
}