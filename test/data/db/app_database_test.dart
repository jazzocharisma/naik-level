import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naik_level/data/db/app_database.dart';
import 'package:naik_level/domain/entities/stat_key.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('schemaVersion bernilai 1', () {
    expect(db.schemaVersion, 1);
  });

  test('database baru berisi 6 stat, Level 1, 0 XP', () async {
    final rows = await db.select(db.stats).get();

    expect(rows.map((r) => r.statKey).toSet(), {
      for (final s in StatKey.values) s.code,
    });
    expect(rows.every((r) => r.level == 1 && r.totalXp == 0), isTrue);
  });

  test('menyimpan dan membaca karakter', () async {
    final id = await db
        .into(db.playerCharacters)
        .insert(
          PlayerCharactersCompanion.insert(
            name: 'Raka',
            avatarId: 2,
            createdAt: DateTime.utc(2026, 10, 6),
          ),
        );

    final row = await (db.select(
      db.playerCharacters,
    )..where((t) => t.id.equals(id))).getSingle();

    expect(row.name, 'Raka');
    expect(row.avatarId, 2);
  });

  test('ledger xp_events bisa dijumlahkan per stat', () async {
    Future<void> add(String stat, int amount) {
      return db
          .into(db.xpEvents)
          .insert(
            XpEventsCompanion.insert(
              statKey: stat,
              amount: amount,
              sourceType: 'activity',
              occurredOn: '2026-10-06',
              createdAt: DateTime.utc(2026, 10, 6),
            ),
          );
    }

    await add('STR', 20);
    await add('STR', 10);
    await add('INT', 99);

    final sum = db.xpEvents.amount.sum();
    final query = db.selectOnly(db.xpEvents)
      ..addColumns([sum])
      ..where(db.xpEvents.statKey.equals('STR'));

    expect((await query.getSingle()).read(sum), 30);
  });

  test('foreign key menolak xp_events untuk stat yang tidak ada', () async {
    final insert = db
        .into(db.xpEvents)
        .insert(
          XpEventsCompanion.insert(
            statKey: 'XXX',
            amount: 5,
            sourceType: 'activity',
            occurredOn: '2026-10-06',
            createdAt: DateTime.utc(2026, 10, 6),
          ),
        );

    await expectLater(insert, throwsA(anything));
  });

  test('settings: insert lalu update (upsert) pada key yang sama', () async {
    Future<void> put(String key, String value) {
      return db
          .into(db.settings)
          .insertOnConflictUpdate(
            SettingsCompanion.insert(key: key, value: value),
          );
    }

    await put('theme', 'dark');
    await put('theme', 'light');

    final rows = await db.select(db.settings).get();
    expect(rows, hasLength(1));
    expect(rows.single.value, 'light');
  });
}
