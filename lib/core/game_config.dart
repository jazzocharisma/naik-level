/// Semua angka keseimbangan game (PRD bagian 7). Ubah angka HANYA di sini.
abstract final class GameConfig {
  // 7.1 / 7.2 Kurva level
  static const int maxLevel = 50;
  static const int statLevelFactor = 50; // 50 x L x (L-1)
  static const int globalLevelFactor = 100; // 100 x L x (L-1)

  // 7.3 XP aktivitas
  static const double defaultCategoryRate = 1.0;
  static const double minCategoryRate = 0.5;
  static const double maxCategoryRate = 2.0;
  static const int minXpPerEntry = 1;
  static const int maxXpPerEntry = 150;

  static const double easyMultiplier = 0.8;
  static const double normalMultiplier = 1.0;
  static const double hardMultiplier = 1.3;

  // Bonus streak: +5% per 7 hari, maksimum +25%
  static const int streakDaysPerStep = 7;
  static const double streakBonusPerStep = 0.05;
  static const double maxStreakBonus = 0.25;

  // 7.4 Daily cap & diminishing returns (per stat per hari).
  // `upToXp` = batas atas XP yang SUDAH DIKREDITKAN hari itu pada stat tersebut.
  static const List<({int upToXp, int efficiencyPercent})> dailyCapTiers = [
    (upToXp: 120, efficiencyPercent: 100),
    (upToXp: 240, efficiencyPercent: 50),
    (upToXp: 300, efficiencyPercent: 20),
  ];

  // 7.2 Title berdasarkan level global
  static const List<({int minLevel, String title})> globalTitles = [
    (minLevel: 1, title: 'Novice'),
    (minLevel: 5, title: 'Apprentice'),
    (minLevel: 10, title: 'Adventurer'),
    (minLevel: 20, title: 'Veteran'),
    (minLevel: 35, title: 'Hero'),
    (minLevel: 50, title: 'Legend'),
  ];
}
