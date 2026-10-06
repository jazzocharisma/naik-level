import 'package:drift/drift.dart';

/// Tabel `characters` (PRD bagian 8). Nama kelas dibuat unik agar tidak
/// bentrok dengan `Characters` milik package characters di Flutter.
@DataClassName('PlayerCharacter')
class PlayerCharacters extends Table {
  @override
  String get tableName => 'characters';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 30)();
  IntColumn get avatarId => integer()();
  DateTimeColumn get createdAt => dateTime()();
}

/// Cache XP/level per stat. Sumber kebenaran tetap ledger `xp_events`.
class Stats extends Table {
  TextColumn get statKey => text()();
  IntColumn get totalXp => integer().withDefault(const Constant(0))();
  IntColumn get level => integer().withDefault(const Constant(1))();

  @override
  Set<Column<Object>> get primaryKey => {statKey};
}

/// Ledger XP (PRD 7.8): setiap perubahan XP adalah satu baris di sini.
@TableIndex(name: 'xp_events_stat_day', columns: {#statKey, #occurredOn})
class XpEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get statKey => text().references(Stats, #statKey)();
  IntColumn get amount => integer()();

  /// activity | quest | achievement | finance | streak
  TextColumn get sourceType => text()();
  IntColumn get sourceId => integer().nullable()();

  /// Tanggal lokal format `yyyy-MM-dd` (dipakai untuk daily cap & streak).
  TextColumn get occurredOn => text()();
  DateTimeColumn get createdAt => dateTime()();
}

class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}
