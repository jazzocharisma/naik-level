import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naik_level/app/router.dart';
import 'package:naik_level/core/theme/pixel_theme.dart';


class NaikLevelApp extends ConsumerWidget {
  const NaikLevelApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Naik Level',
      debugShowCheckedModeBanner: false,
      // Tema sementara; diganti design system pixel di tugas berikutnya.
      theme: buildPixelTheme(),
      routerConfig: router,
    );
  }
}