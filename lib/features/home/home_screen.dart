import 'package:flutter/material.dart';
import 'package:naik_level/core/theme/pixel_colors.dart';
import 'package:naik_level/core/widgets/pixel_button.dart';
import 'package:naik_level/core/widgets/pixel_panel.dart';
import 'package:naik_level/core/widgets/pixel_progress_bar.dart';

// SEMENTARA: galeri komponen. Diganti Status Screen (F2) di Minggu 2.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _xp = 0.3;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PixelPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('HERO  LV 1', style: textTheme.titleLarge),
                const SizedBox(height: 12),
                PixelProgressBar(value: _xp, semanticLabel: 'XP'),
                const SizedBox(height: 8),
                Text('${(_xp * 100).round()}% XP', style: textTheme.bodySmall),
                const SizedBox(height: 12),
                const PixelProgressBar(
                  value: 0.6,
                  color: PixelColors.statStr,
                  semanticLabel: 'STR',
                ),
                const SizedBox(height: 12),
                const PixelProgressBar(
                  value: 0.8,
                  color: PixelColors.statInt,
                  semanticLabel: 'INT',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PixelButton(
            label: '+10% XP',
            icon: Icons.add,
            onPressed: () => setState(() {
              _xp = (_xp + 0.1).clamp(0.0, 1.0).toDouble();
            }),
          ),
          const SizedBox(height: 12),
          PixelButton(
            label: 'RESET',
            color: PixelColors.red,
            foregroundColor: PixelColors.textPrimary,
            onPressed: () => setState(() => _xp = 0),
          ),
          const SizedBox(height: 12),
          const PixelButton(label: 'TERKUNCI', onPressed: null),
        ],
      ),
    );
  }
}