import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naik_level/app/router.dart';

class NaikLevelApp extends ConsumerWidget {
  const NaikLevelApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Naik Level',
      debugShowCheckedModeBanner: false,
      // Tema sementara; diganti design system pixel di tugas berikutnya.
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF5C542),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF1A1423),
      ),
      routerConfig: router,
    );
  }
}