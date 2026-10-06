import 'package:flutter/material.dart';
import 'package:naik_level/core/theme/pixel_colors.dart';
import 'package:naik_level/core/theme/pixel_theme.dart';

/// Tombol pixel dengan efek "tekan" 2px. `onPressed: null` berarti nonaktif.
class PixelButton extends StatefulWidget {
  const PixelButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.color = PixelColors.gold,
    this.foregroundColor = PixelColors.background,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color color;
  final Color foregroundColor;

  @override
  State<PixelButton> createState() => _PixelButtonState();
}

class _PixelButtonState extends State<PixelButton> {
  static const double _shadow = 4;
  static const double _press = 2;

  bool _pressed = false;

  void _setPressed({required bool value}) {
    if (_pressed != value) {
      setState(() => _pressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    final background = enabled ? widget.color : PixelColors.surface;
    final foreground = enabled ? widget.foregroundColor : PixelColors.textMuted;
    final shift = _pressed ? _press : 0.0;

    return Semantics(
      button: true,
      enabled: enabled,
      label: widget.label,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? (_) => _setPressed(value: true) : null,
        onTapUp: enabled ? (_) => _setPressed(value: false) : null,
        onTapCancel: enabled ? () => _setPressed(value: false) : null,
        onTap: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.only(right: _shadow, bottom: _shadow),
          child: Transform.translate(
            offset: Offset(shift, shift),
            child: Container(
              // Target sentuh minimal 48dp (aksesibilitas, PRD bagian 10).
              constraints: const BoxConstraints(minHeight: 48, minWidth: 48),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: background,
                border: Border.all(color: PixelColors.border, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: PixelColors.border,
                    offset: Offset(_shadow - shift, _shadow - shift),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) ...[
                    Icon(widget.icon, size: 18, color: foreground),
                    const SizedBox(width: 8),
                  ],
                  Flexible(
                    child: Text(
                      widget.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: PixelFonts.heading,
                        fontSize: 12,
                        color: foreground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
