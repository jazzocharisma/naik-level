import 'package:flutter/material.dart';

/// Token warna Naik Level (PRD bagian 10). Jangan memakai hex di luar file ini.
abstract final class PixelColors {
  // Dasar
  static const background = Color(0xFF1A1423);
  static const surface = Color(0xFF2D2440);
  static const border = Color(0xFF0F0A18);

  // Teks
  static const textPrimary = Color(0xFFF2EEF8);
  static const textMuted = Color(0xFFB9AFCB);

  // Aksen
  static const gold = Color(0xFFF5C542); // XP / primary
  static const green = Color(0xFF4ADE80);
  static const red = Color(0xFFEF4444); // HP
  static const blue = Color(0xFF38BDF8); // mana
  static const purple = Color(0xFFA855F7); // rarity langka

  // Warna per stat
  static const statStr = red;
  static const statInt = blue;
  static const statVit = green;
  static const statCha = Color(0xFFF472B6);
  static const statDis = Color(0xFFFB923C);
  static const statWlt = gold;
}
