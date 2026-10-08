import 'package:flutter_test/flutter_test.dart';
import 'package:naik_level/domain/entities/difficulty.dart';
import 'package:naik_level/domain/xp_calculator.dart';

void main() {
  const calc = XpCalculator();

  group('streakMultiplier', () {
    test('+5% per 7 hari, maksimum +25%', () {
      expect(calc.streakMultiplier(0), closeTo(1.00, 1e-9));
      expect(calc.streakMultiplier(6), closeTo(1.00, 1e-9));
      expect(calc.streakMultiplier(7), closeTo(1.05, 1e-9));
      expect(calc.streakMultiplier(14), closeTo(1.10, 1e-9));
      expect(calc.streakMultiplier(35), closeTo(1.25, 1e-9));
      expect(calc.streakMultiplier(100), closeTo(1.25, 1e-9));
    });

    test('streak negatif diperlakukan 0', () {
      expect(calc.streakMultiplier(-5), closeTo(1.0, 1e-9));
    });
  });

  group('activityXp', () {
    int xp({
      int minutes = 60,
      double rate = 1.0,
      Difficulty difficulty = Difficulty.normal,
      int streak = 0,
    }) {
      return calc.activityXp(
        durationMinutes: minutes,
        categoryRate: rate,
        difficulty: difficulty,
        streakDays: streak,
      );
    }

    test('dasar: 60 menit normal = 60 XP', () {
      expect(xp(), 60);
    });

    test('pengali kesulitan', () {
      expect(xp(minutes: 30, difficulty: Difficulty.easy), 24);
      expect(xp(minutes: 20, difficulty: Difficulty.hard), 26);
    });

    test('rate kategori memengaruhi XP', () {
      expect(xp(minutes: 30, rate: 2.0), 60);
      expect(xp(minutes: 30, rate: 0.5), 15);
    });

    test('rate di luar rentang dibatasi 0.5-2.0', () {
      expect(xp(minutes: 30, rate: 10), 60);
      expect(xp(minutes: 30, rate: 0.01), 15);
    });

    test('bonus streak 14 hari (+10%)', () {
      expect(xp(streak: 14), 66);
    });

    test('minimal 1 XP', () {
      expect(xp(minutes: 1, rate: 0.5, difficulty: Difficulty.easy), 1);
    });

    test('maksimal 150 XP per entri', () {
      expect(xp(minutes: 300, difficulty: Difficulty.hard, streak: 70), 150);
    });

    test('durasi 0 atau negatif melempar ArgumentError', () {
      expect(() => xp(minutes: 0), throwsArgumentError);
      expect(() => xp(minutes: -10), throwsArgumentError);
    });
  });

  group('applyDailyCap', () {
    int cap(int raw, int earned) =>
        calc.applyDailyCap(rawXp: raw, earnedToday: earned);

    test('di bawah 120: efisiensi 100%', () {
      expect(cap(100, 0), 100);
    });

    test('melewati batas tier di tengah entri', () {
      // 20 XP pertama @100% + 20 XP sisanya @50% = 30
      expect(cap(40, 100), 30);
    });

    test('tepat di batas 120: seluruhnya @50%', () {
      expect(cap(40, 120), 20);
    });

    test('zona 241-300: efisiensi 20%', () {
      expect(cap(50, 240), 10);
    });

    test('mendekati batas atas tidak melebihi 300 total', () {
      expect(cap(100, 290), 10);
    });

    test('sudah 300 atau lebih: 0', () {
      expect(cap(50, 300), 0);
      expect(cap(50, 450), 0);
    });

    test('entri maksimum 150 dari nol', () {
      expect(cap(150, 0), 135); // 120 + 30 x 50%
    });

    test('entri sangat besar tidak pernah melebihi total 300', () {
      expect(cap(1000, 0), 300);
    });

    test('rawXp nol atau negatif = 0', () {
      expect(cap(0, 0), 0);
      expect(cap(-5, 0), 0);
    });
  });
}
