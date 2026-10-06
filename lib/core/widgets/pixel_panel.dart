import 'package:flutter/material.dart';
import 'package:naik_level/core/theme/pixel_colors.dart';

/// Kotak berbingkai tebal dengan bayangan keras (tanpa blur) khas pixel art.
class PixelPanel extends StatelessWidget {
  const PixelPanel({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.color = PixelColors.surface,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Padding kanan-bawah memberi ruang agar bayangan tidak terpotong.
    return Padding(
      padding: const EdgeInsets.only(right: 4, bottom: 4),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: PixelColors.border, width: 4),
          boxShadow: const [
            BoxShadow(color: PixelColors.border, offset: Offset(4, 4)),
          ],
        ),
        child: child,
      ),
    );
  }
}