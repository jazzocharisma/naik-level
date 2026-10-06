import 'package:flutter/material.dart';
import 'package:naik_level/core/theme/pixel_colors.dart';

/// Progress bar bersegmen (blok). `value` 0.0-1.0; di luar rentang dibatasi.
class PixelProgressBar extends StatelessWidget {
  const PixelProgressBar({
    required this.value,
    this.color = PixelColors.gold,
    this.segments = 10,
    this.height = 20,
    this.semanticLabel,
    super.key,
  }) : assert(segments > 0, 'segments harus > 0');

  final double value;
  final Color color;
  final int segments;
  final double height;
  final String? semanticLabel;

  /// Jumlah segmen terisi untuk [value] tertentu (nilai dibatasi 0..1).
  static int filledSegments(double value, int segments) {
    final safe = value.isNaN ? 0.0 : (value < 0 ? 0.0 : (value > 1 ? 1.0 : value));
    return (safe * segments).floor();
  }

  @override
  Widget build(BuildContext context) {
    final filled = filledSegments(value, segments);
    final percent = (filled / segments * 100).round();

    return Semantics(
      label: semanticLabel,
      value: '$percent%',
      child: Container(
        height: height,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: PixelColors.background,
          border: Border.all(color: PixelColors.border, width: 4),
        ),
        child: Row(
          children: [
            for (var i = 0; i < segments; i++)
              Expanded(
                child: Container(
                  key: ValueKey(
                    i < filled ? 'pixel-segment-filled' : 'pixel-segment-empty',
                  ),
                  margin: EdgeInsets.only(right: i < segments - 1 ? 2 : 0),
                  color: i < filled ? color : PixelColors.surface,
                ),
              ),
          ],
        ),
      ),
    );
  }
}