import 'package:flutter_test/flutter_test.dart';
import 'package:naik_level/core/game_config.dart';
import 'package:naik_level/domain/level_calculator.dart';

void main() {
  const stat = LevelCalculator.stat();
  const global = LevelCalculator.global();

  group('totalXpForLevel (stat)', () {
    test('sesuai tabel PRD 7.1', () {
      const expected = {
        1: 0,
        2: 100,
        3: 300,
        4: 600,
        5: 1000,
        10: 4500,
        20: 19000,
      };
      expected.forEach((level, xp) {
        expect(stat.totalXpForLevel(level), xp, reason: 'level $level');
      });
    });

    test('level di luar 1..50 melempar RangeError', () {
      expect(() => stat.totalXpForLevel(0), throwsRangeError);
      expect(() => stat.totalXpForLevel(51), throwsRangeError);
    });
  });

  group('levelForXp (stat)', () {
    test('batas level tepat', () {
      expect(stat.levelForXp(0), 1);
      expect(stat.levelForXp(99), 1);
      expect(stat.levelForXp(100), 2);
      expect(stat.levelForXp(299), 2);
      expect(stat.levelForXp(300), 3);
      expect(stat.levelForXp(4499), 9);
      expect(stat.levelForXp(4500), 10);
    });

    test('XP negatif dianggap level 1', () {
      expect(stat.levelForXp(-50), 1);
    });

    test('dibatasi level maksimum 50', () {
      final xpAtMax = stat.totalXpForLevel(50);
      expect(stat.levelForXp(xpAtMax - 1), 49);
      expect(stat.levelForXp(xpAtMax), 50);
      expect(stat.levelForXp(99999999), 50);
    });

    test(
      'round-trip: levelForXp(totalXpForLevel(L)) == L untuk semua level',
      () {
        for (var level = 1; level <= GameConfig.maxLevel; level++) {
          final xp = stat.totalXpForLevel(level);
          expect(stat.levelForXp(xp), level, reason: 'tepat di level $level');
          if (level > 1) {
            expect(
              stat.levelForXp(xp - 1),
              level - 1,
              reason: 'sebelum $level',
            );
          }
        }
      },
    );
  });

  group('level global (faktor 100)', () {
    test('kurva 2x lebih curam dari stat', () {
      expect(global.totalXpForLevel(2), 200);
      expect(global.totalXpForLevel(25), 60000);
      expect(global.levelForXp(199), 1);
      expect(global.levelForXp(200), 2);
    });
  });

  group('progress', () {
    test('di tengah level', () {
      final p = stat.progress(150);
      expect(p.level, 2);
      expect(p.xpIntoLevel, 50);
      expect(p.xpNeededForNext, 200);
      expect(p.fraction, closeTo(0.25, 1e-9));
      expect(p.isMaxLevel, isFalse);
    });

    test('awal level 1', () {
      final p = stat.progress(0);
      expect(p.level, 1);
      expect(p.fraction, 0);
    });

    test('level maksimum: fraction 1.0', () {
      final p = stat.progress(stat.totalXpForLevel(50));
      expect(p.isMaxLevel, isTrue);
      expect(p.fraction, 1.0);
      expect(p.xpNeededForNext, 0);
    });

    test('satu pemberian XP besar bisa melompati beberapa level', () {
      expect(stat.levelForXp(0), 1);
      expect(stat.levelForXp(650), 4); // level 1 -> 4 sekaligus
    });
  });

  group('titleForGlobalLevel', () {
    test('rentang title sesuai PRD 7.2', () {
      const expected = {
        1: 'Novice',
        4: 'Novice',
        5: 'Apprentice',
        9: 'Apprentice',
        10: 'Adventurer',
        19: 'Adventurer',
        20: 'Veteran',
        34: 'Veteran',
        35: 'Hero',
        49: 'Hero',
        50: 'Legend',
      };
      expected.forEach((level, title) {
        expect(
          LevelCalculator.titleForGlobalLevel(level),
          title,
          reason: 'level $level',
        );
      });
    });
  });
}
