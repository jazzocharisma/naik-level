import 'dart:math' as math;

import 'package:naik_level/core/game_config.dart';

/// Posisi XP di dalam satu level (untuk progress bar).
class LevelProgress {
  const LevelProgress({
    required this.level,
    required this.xpIntoLevel,
    required this.xpNeededForNext,
    required this.isMaxLevel,
  });

  final int level;
  final int xpIntoLevel;

  /// Total XP yang dibutuhkan dari awal level ini ke level berikutnya
  /// (0 bila sudah level maksimum).
  final int xpNeededForNext;
  final bool isMaxLevel;

  /// 0.0-1.0; level maksimum selalu 1.0.
  double get fraction => isMaxLevel ? 1.0 : xpIntoLevel / xpNeededForNext;
}

/// Kurva level: `totalXpForLevel(L) = factor x L x (L - 1)`.
/// Dipakai untuk stat (factor 50) dan level global (factor 100).
class LevelCalculator {
  const LevelCalculator({
    required this.factor,
    this.maxLevel = GameConfig.maxLevel,
  });

  const LevelCalculator.stat() : this(factor: GameConfig.statLevelFactor);

  const LevelCalculator.global() : this(factor: GameConfig.globalLevelFactor);

  final int factor;
  final int maxLevel;

  /// XP kumulatif minimum untuk mencapai [level].
  int totalXpForLevel(int level) {
    RangeError.checkValueInInterval(level, 1, maxLevel, 'level');
    return factor * level * (level - 1);
  }

  /// Level untuk total [xp] tertentu (dibatasi 1..[maxLevel]).
  int levelForXp(int xp) {
    if (xp <= 0) {
      return 1;
    }
    // Perkiraan dari rumus kuadrat; floating point bisa meleset di batas
    // level, jadi dikoreksi dengan perbandingan integer di bawah.
    final estimate = ((1 + math.sqrt(1 + 4 * xp / factor)) / 2).floor();
    var level = math.min(math.max(estimate, 1), maxLevel);

    while (level < maxLevel && xp >= totalXpForLevel(level + 1)) {
      level++;
    }
    while (level > 1 && xp < totalXpForLevel(level)) {
      level--;
    }
    return level;
  }

  LevelProgress progress(int xp) {
    final safeXp = math.max(0, xp);
    final level = levelForXp(safeXp);
    final levelStart = totalXpForLevel(level);

    if (level >= maxLevel) {
      return LevelProgress(
        level: level,
        xpIntoLevel: safeXp - levelStart,
        xpNeededForNext: 0,
        isMaxLevel: true,
      );
    }

    return LevelProgress(
      level: level,
      xpIntoLevel: safeXp - levelStart,
      xpNeededForNext: totalXpForLevel(level + 1) - levelStart,
      isMaxLevel: false,
    );
  }

  /// Title (Novice, Apprentice, ...) dari level global.
  static String titleForGlobalLevel(int level) {
    var title = GameConfig.globalTitles.first.title;
    for (final entry in GameConfig.globalTitles) {
      if (level >= entry.minLevel) {
        title = entry.title;
      }
    }
    return title;
  }
}
