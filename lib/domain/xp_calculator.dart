import 'dart:math' as math;

import 'package:naik_level/core/game_config.dart';
import 'package:naik_level/domain/entities/difficulty.dart';

/// Rumus XP aktivitas (PRD 7.3) dan daily cap (PRD 7.4). Tanpa dependensi Flutter.
class XpCalculator {
  const XpCalculator();

  /// Pengali streak: 1 + min(0.25, 0.05 x floor(streak / 7)).
  double streakMultiplier(int streakDays) {
    final steps = math.max(0, streakDays) ~/ GameConfig.streakDaysPerStep;
    final bonus = math.min(
      GameConfig.maxStreakBonus,
      GameConfig.streakBonusPerStep * steps,
    );
    return 1 + bonus;
  }

  double difficultyMultiplier(Difficulty difficulty) {
    return switch (difficulty) {
      Difficulty.easy => GameConfig.easyMultiplier,
      Difficulty.normal => GameConfig.normalMultiplier,
      Difficulty.hard => GameConfig.hardMultiplier,
    };
  }

  /// XP mentah satu aktivitas (SEBELUM daily cap): dibulatkan, min 1, maks 150.
  int activityXp({
    required int durationMinutes,
    required double categoryRate,
    required Difficulty difficulty,
    required int streakDays,
  }) {
    if (durationMinutes <= 0) {
      throw ArgumentError.value(
        durationMinutes,
        'durationMinutes',
        'harus > 0',
      );
    }

    final rate = math.min(
      math.max(categoryRate, GameConfig.minCategoryRate),
      GameConfig.maxCategoryRate,
    );
    final raw =
        durationMinutes *
        rate *
        difficultyMultiplier(difficulty) *
        streakMultiplier(streakDays);

    return math.min(
      math.max(raw.round(), GameConfig.minXpPerEntry),
      GameConfig.maxXpPerEntry,
    );
  }

  /// Menerapkan daily cap pada [rawXp].
  ///
  /// [earnedToday] = XP yang sudah DIKREDITKAN pada stat yang sama hari ini
  /// (bisa dijumlahkan langsung dari ledger `xp_events`). Hasilnya adalah XP
  /// yang benar-benar dikreditkan untuk aktivitas ini.
  int applyDailyCap({required int rawXp, required int earnedToday}) {
    if (rawXp <= 0) {
      return 0;
    }

    final start = math.max(0, earnedToday);
    final cap = GameConfig.dailyCapTiers.last.upToXp;
    var position = start;
    var credited = 0.0;
    var remainingRaw = rawXp.toDouble();

    for (final tier in GameConfig.dailyCapTiers) {
      if (position >= tier.upToXp) {
        continue;
      }
      final capacity = tier.upToXp - position; // sisa kredit di tier ini
      final percent = tier.efficiencyPercent;
      final rawNeededToFill = capacity * 100 / percent;

      if (remainingRaw >= rawNeededToFill) {
        credited += capacity;
        remainingRaw -= rawNeededToFill;
        position = tier.upToXp;
      } else {
        credited += remainingRaw * percent / 100;
        break;
      }
    }

    return math.min(credited.round(), math.max(0, cap - start));
  }
}
