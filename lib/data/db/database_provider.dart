import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naik_level/data/db/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase.defaults();
  ref.onDispose(db.close);
  return db;
});
