import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:naik_level/data/db/tables.dart';
import 'package:naik_level/domain/entities/stat_key.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [PlayerCharacters, Stats, XpEvents, Settings])
class AppDatabase extends _$AppDatabase {
  /// Untuk test: berikan executor in-memory.
  AppDatabase(super.e);

  /// Database produksi (file SQLite di penyimpanan aplikasi).
  AppDatabase.defaults() : super(driftDatabase(name: 'naik_level'));

  /// Naikkan angka ini setiap skema berubah, lalu tulis migrasinya.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      // Semua stat mulai Level 1 dengan 0 XP (PRD F1-AC2).
      await batch((b) {
        b.insertAll(stats, [
          for (final stat in StatKey.values)
            StatsCompanion.insert(statKey: stat.code),
        ]);
      });
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
