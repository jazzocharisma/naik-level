// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PlayerCharactersTable extends PlayerCharacters
    with TableInfo<$PlayerCharactersTable, PlayerCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avatarIdMeta = const VerificationMeta(
    'avatarId',
  );
  @override
  late final GeneratedColumn<int> avatarId = GeneratedColumn<int>(
    'avatar_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, avatarId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlayerCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('avatar_id')) {
      context.handle(
        _avatarIdMeta,
        avatarId.isAcceptableOrUnknown(data['avatar_id']!, _avatarIdMeta),
      );
    } else if (isInserting) {
      context.missing(_avatarIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerCharacter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      avatarId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}avatar_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PlayerCharactersTable createAlias(String alias) {
    return $PlayerCharactersTable(attachedDatabase, alias);
  }
}

class PlayerCharacter extends DataClass implements Insertable<PlayerCharacter> {
  final int id;
  final String name;
  final int avatarId;
  final DateTime createdAt;
  const PlayerCharacter({
    required this.id,
    required this.name,
    required this.avatarId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['avatar_id'] = Variable<int>(avatarId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlayerCharactersCompanion toCompanion(bool nullToAbsent) {
    return PlayerCharactersCompanion(
      id: Value(id),
      name: Value(name),
      avatarId: Value(avatarId),
      createdAt: Value(createdAt),
    );
  }

  factory PlayerCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerCharacter(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      avatarId: serializer.fromJson<int>(json['avatarId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'avatarId': serializer.toJson<int>(avatarId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PlayerCharacter copyWith({
    int? id,
    String? name,
    int? avatarId,
    DateTime? createdAt,
  }) => PlayerCharacter(
    id: id ?? this.id,
    name: name ?? this.name,
    avatarId: avatarId ?? this.avatarId,
    createdAt: createdAt ?? this.createdAt,
  );
  PlayerCharacter copyWithCompanion(PlayerCharactersCompanion data) {
    return PlayerCharacter(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      avatarId: data.avatarId.present ? data.avatarId.value : this.avatarId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerCharacter(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatarId: $avatarId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, avatarId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerCharacter &&
          other.id == this.id &&
          other.name == this.name &&
          other.avatarId == this.avatarId &&
          other.createdAt == this.createdAt);
}

class PlayerCharactersCompanion extends UpdateCompanion<PlayerCharacter> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> avatarId;
  final Value<DateTime> createdAt;
  const PlayerCharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.avatarId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PlayerCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int avatarId,
    required DateTime createdAt,
  }) : name = Value(name),
       avatarId = Value(avatarId),
       createdAt = Value(createdAt);
  static Insertable<PlayerCharacter> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? avatarId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (avatarId != null) 'avatar_id': avatarId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PlayerCharactersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? avatarId,
    Value<DateTime>? createdAt,
  }) {
    return PlayerCharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarId: avatarId ?? this.avatarId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatarId.present) {
      map['avatar_id'] = Variable<int>(avatarId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerCharactersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatarId: $avatarId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $StatsTable extends Stats with TableInfo<$StatsTable, Stat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _statKeyMeta = const VerificationMeta(
    'statKey',
  );
  @override
  late final GeneratedColumn<String> statKey = GeneratedColumn<String>(
    'stat_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalXpMeta = const VerificationMeta(
    'totalXp',
  );
  @override
  late final GeneratedColumn<int> totalXp = GeneratedColumn<int>(
    'total_xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [statKey, totalXp, level];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<Stat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('stat_key')) {
      context.handle(
        _statKeyMeta,
        statKey.isAcceptableOrUnknown(data['stat_key']!, _statKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_statKeyMeta);
    }
    if (data.containsKey('total_xp')) {
      context.handle(
        _totalXpMeta,
        totalXp.isAcceptableOrUnknown(data['total_xp']!, _totalXpMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {statKey};
  @override
  Stat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stat(
      statKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stat_key'],
      )!,
      totalXp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_xp'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
    );
  }

  @override
  $StatsTable createAlias(String alias) {
    return $StatsTable(attachedDatabase, alias);
  }
}

class Stat extends DataClass implements Insertable<Stat> {
  final String statKey;
  final int totalXp;
  final int level;
  const Stat({
    required this.statKey,
    required this.totalXp,
    required this.level,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['stat_key'] = Variable<String>(statKey);
    map['total_xp'] = Variable<int>(totalXp);
    map['level'] = Variable<int>(level);
    return map;
  }

  StatsCompanion toCompanion(bool nullToAbsent) {
    return StatsCompanion(
      statKey: Value(statKey),
      totalXp: Value(totalXp),
      level: Value(level),
    );
  }

  factory Stat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stat(
      statKey: serializer.fromJson<String>(json['statKey']),
      totalXp: serializer.fromJson<int>(json['totalXp']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'statKey': serializer.toJson<String>(statKey),
      'totalXp': serializer.toJson<int>(totalXp),
      'level': serializer.toJson<int>(level),
    };
  }

  Stat copyWith({String? statKey, int? totalXp, int? level}) => Stat(
    statKey: statKey ?? this.statKey,
    totalXp: totalXp ?? this.totalXp,
    level: level ?? this.level,
  );
  Stat copyWithCompanion(StatsCompanion data) {
    return Stat(
      statKey: data.statKey.present ? data.statKey.value : this.statKey,
      totalXp: data.totalXp.present ? data.totalXp.value : this.totalXp,
      level: data.level.present ? data.level.value : this.level,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Stat(')
          ..write('statKey: $statKey, ')
          ..write('totalXp: $totalXp, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(statKey, totalXp, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stat &&
          other.statKey == this.statKey &&
          other.totalXp == this.totalXp &&
          other.level == this.level);
}

class StatsCompanion extends UpdateCompanion<Stat> {
  final Value<String> statKey;
  final Value<int> totalXp;
  final Value<int> level;
  final Value<int> rowid;
  const StatsCompanion({
    this.statKey = const Value.absent(),
    this.totalXp = const Value.absent(),
    this.level = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StatsCompanion.insert({
    required String statKey,
    this.totalXp = const Value.absent(),
    this.level = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : statKey = Value(statKey);
  static Insertable<Stat> custom({
    Expression<String>? statKey,
    Expression<int>? totalXp,
    Expression<int>? level,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (statKey != null) 'stat_key': statKey,
      if (totalXp != null) 'total_xp': totalXp,
      if (level != null) 'level': level,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StatsCompanion copyWith({
    Value<String>? statKey,
    Value<int>? totalXp,
    Value<int>? level,
    Value<int>? rowid,
  }) {
    return StatsCompanion(
      statKey: statKey ?? this.statKey,
      totalXp: totalXp ?? this.totalXp,
      level: level ?? this.level,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (statKey.present) {
      map['stat_key'] = Variable<String>(statKey.value);
    }
    if (totalXp.present) {
      map['total_xp'] = Variable<int>(totalXp.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatsCompanion(')
          ..write('statKey: $statKey, ')
          ..write('totalXp: $totalXp, ')
          ..write('level: $level, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $XpEventsTable extends XpEvents with TableInfo<$XpEventsTable, XpEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $XpEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _statKeyMeta = const VerificationMeta(
    'statKey',
  );
  @override
  late final GeneratedColumn<String> statKey = GeneratedColumn<String>(
    'stat_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stats (stat_key)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
    'source_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occurredOnMeta = const VerificationMeta(
    'occurredOn',
  );
  @override
  late final GeneratedColumn<String> occurredOn = GeneratedColumn<String>(
    'occurred_on',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    statKey,
    amount,
    sourceType,
    sourceId,
    occurredOn,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'xp_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<XpEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stat_key')) {
      context.handle(
        _statKeyMeta,
        statKey.isAcceptableOrUnknown(data['stat_key']!, _statKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_statKeyMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    if (data.containsKey('occurred_on')) {
      context.handle(
        _occurredOnMeta,
        occurredOn.isAcceptableOrUnknown(data['occurred_on']!, _occurredOnMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredOnMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  XpEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return XpEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      statKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stat_key'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_id'],
      ),
      occurredOn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occurred_on'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $XpEventsTable createAlias(String alias) {
    return $XpEventsTable(attachedDatabase, alias);
  }
}

class XpEvent extends DataClass implements Insertable<XpEvent> {
  final int id;
  final String statKey;
  final int amount;

  /// activity | quest | achievement | finance | streak
  final String sourceType;
  final int? sourceId;

  /// Tanggal lokal format `yyyy-MM-dd` (dipakai untuk daily cap & streak).
  final String occurredOn;
  final DateTime createdAt;
  const XpEvent({
    required this.id,
    required this.statKey,
    required this.amount,
    required this.sourceType,
    this.sourceId,
    required this.occurredOn,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stat_key'] = Variable<String>(statKey);
    map['amount'] = Variable<int>(amount);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<int>(sourceId);
    }
    map['occurred_on'] = Variable<String>(occurredOn);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  XpEventsCompanion toCompanion(bool nullToAbsent) {
    return XpEventsCompanion(
      id: Value(id),
      statKey: Value(statKey),
      amount: Value(amount),
      sourceType: Value(sourceType),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      occurredOn: Value(occurredOn),
      createdAt: Value(createdAt),
    );
  }

  factory XpEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return XpEvent(
      id: serializer.fromJson<int>(json['id']),
      statKey: serializer.fromJson<String>(json['statKey']),
      amount: serializer.fromJson<int>(json['amount']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceId: serializer.fromJson<int?>(json['sourceId']),
      occurredOn: serializer.fromJson<String>(json['occurredOn']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'statKey': serializer.toJson<String>(statKey),
      'amount': serializer.toJson<int>(amount),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceId': serializer.toJson<int?>(sourceId),
      'occurredOn': serializer.toJson<String>(occurredOn),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  XpEvent copyWith({
    int? id,
    String? statKey,
    int? amount,
    String? sourceType,
    Value<int?> sourceId = const Value.absent(),
    String? occurredOn,
    DateTime? createdAt,
  }) => XpEvent(
    id: id ?? this.id,
    statKey: statKey ?? this.statKey,
    amount: amount ?? this.amount,
    sourceType: sourceType ?? this.sourceType,
    sourceId: sourceId.present ? sourceId.value : this.sourceId,
    occurredOn: occurredOn ?? this.occurredOn,
    createdAt: createdAt ?? this.createdAt,
  );
  XpEvent copyWithCompanion(XpEventsCompanion data) {
    return XpEvent(
      id: data.id.present ? data.id.value : this.id,
      statKey: data.statKey.present ? data.statKey.value : this.statKey,
      amount: data.amount.present ? data.amount.value : this.amount,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      occurredOn: data.occurredOn.present
          ? data.occurredOn.value
          : this.occurredOn,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('XpEvent(')
          ..write('id: $id, ')
          ..write('statKey: $statKey, ')
          ..write('amount: $amount, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceId: $sourceId, ')
          ..write('occurredOn: $occurredOn, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    statKey,
    amount,
    sourceType,
    sourceId,
    occurredOn,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is XpEvent &&
          other.id == this.id &&
          other.statKey == this.statKey &&
          other.amount == this.amount &&
          other.sourceType == this.sourceType &&
          other.sourceId == this.sourceId &&
          other.occurredOn == this.occurredOn &&
          other.createdAt == this.createdAt);
}

class XpEventsCompanion extends UpdateCompanion<XpEvent> {
  final Value<int> id;
  final Value<String> statKey;
  final Value<int> amount;
  final Value<String> sourceType;
  final Value<int?> sourceId;
  final Value<String> occurredOn;
  final Value<DateTime> createdAt;
  const XpEventsCompanion({
    this.id = const Value.absent(),
    this.statKey = const Value.absent(),
    this.amount = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.occurredOn = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  XpEventsCompanion.insert({
    this.id = const Value.absent(),
    required String statKey,
    required int amount,
    required String sourceType,
    this.sourceId = const Value.absent(),
    required String occurredOn,
    required DateTime createdAt,
  }) : statKey = Value(statKey),
       amount = Value(amount),
       sourceType = Value(sourceType),
       occurredOn = Value(occurredOn),
       createdAt = Value(createdAt);
  static Insertable<XpEvent> custom({
    Expression<int>? id,
    Expression<String>? statKey,
    Expression<int>? amount,
    Expression<String>? sourceType,
    Expression<int>? sourceId,
    Expression<String>? occurredOn,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (statKey != null) 'stat_key': statKey,
      if (amount != null) 'amount': amount,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceId != null) 'source_id': sourceId,
      if (occurredOn != null) 'occurred_on': occurredOn,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  XpEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? statKey,
    Value<int>? amount,
    Value<String>? sourceType,
    Value<int?>? sourceId,
    Value<String>? occurredOn,
    Value<DateTime>? createdAt,
  }) {
    return XpEventsCompanion(
      id: id ?? this.id,
      statKey: statKey ?? this.statKey,
      amount: amount ?? this.amount,
      sourceType: sourceType ?? this.sourceType,
      sourceId: sourceId ?? this.sourceId,
      occurredOn: occurredOn ?? this.occurredOn,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (statKey.present) {
      map['stat_key'] = Variable<String>(statKey.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
    }
    if (occurredOn.present) {
      map['occurred_on'] = Variable<String>(occurredOn.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('XpEventsCompanion(')
          ..write('id: $id, ')
          ..write('statKey: $statKey, ')
          ..write('amount: $amount, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceId: $sourceId, ')
          ..write('occurredOn: $occurredOn, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String key;
  final String value;
  const Setting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(key: Value(key), value: Value(value));
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Setting copyWith({String? key, String? value}) =>
      Setting(key: key ?? this.key, value: value ?? this.value);
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting && other.key == this.key && other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<Setting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlayerCharactersTable playerCharacters = $PlayerCharactersTable(
    this,
  );
  late final $StatsTable stats = $StatsTable(this);
  late final $XpEventsTable xpEvents = $XpEventsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final Index xpEventsStatDay = Index(
    'xp_events_stat_day',
    'CREATE INDEX xp_events_stat_day ON xp_events (stat_key, occurred_on)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    playerCharacters,
    stats,
    xpEvents,
    settings,
    xpEventsStatDay,
  ];
}

typedef $$PlayerCharactersTableCreateCompanionBuilder =
    PlayerCharactersCompanion Function({
      Value<int> id,
      required String name,
      required int avatarId,
      required DateTime createdAt,
    });
typedef $$PlayerCharactersTableUpdateCompanionBuilder =
    PlayerCharactersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> avatarId,
      Value<DateTime> createdAt,
    });

class $$PlayerCharactersTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerCharactersTable> {
  $$PlayerCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get avatarId => $composableBuilder(
    column: $table.avatarId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlayerCharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerCharactersTable> {
  $$PlayerCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get avatarId => $composableBuilder(
    column: $table.avatarId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlayerCharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerCharactersTable> {
  $$PlayerCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get avatarId =>
      $composableBuilder(column: $table.avatarId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PlayerCharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayerCharactersTable,
          PlayerCharacter,
          $$PlayerCharactersTableFilterComposer,
          $$PlayerCharactersTableOrderingComposer,
          $$PlayerCharactersTableAnnotationComposer,
          $$PlayerCharactersTableCreateCompanionBuilder,
          $$PlayerCharactersTableUpdateCompanionBuilder,
          (
            PlayerCharacter,
            BaseReferences<
              _$AppDatabase,
              $PlayerCharactersTable,
              PlayerCharacter
            >,
          ),
          PlayerCharacter,
          PrefetchHooks Function()
        > {
  $$PlayerCharactersTableTableManager(
    _$AppDatabase db,
    $PlayerCharactersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerCharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerCharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerCharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> avatarId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlayerCharactersCompanion(
                id: id,
                name: name,
                avatarId: avatarId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int avatarId,
                required DateTime createdAt,
              }) => PlayerCharactersCompanion.insert(
                id: id,
                name: name,
                avatarId: avatarId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlayerCharactersTable, PlayerCharacter>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $PlayerCharactersTable,
                    PlayerCharacter
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlayerCharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayerCharactersTable,
      PlayerCharacter,
      $$PlayerCharactersTableFilterComposer,
      $$PlayerCharactersTableOrderingComposer,
      $$PlayerCharactersTableAnnotationComposer,
      $$PlayerCharactersTableCreateCompanionBuilder,
      $$PlayerCharactersTableUpdateCompanionBuilder,
      (
        PlayerCharacter,
        BaseReferences<_$AppDatabase, $PlayerCharactersTable, PlayerCharacter>,
      ),
      PlayerCharacter,
      PrefetchHooks Function()
    >;
typedef $$StatsTableCreateCompanionBuilder = StatsCompanion Function({
  required String statKey,
  Value<int> totalXp,
  Value<int> level,
  Value<int> rowid,
});
typedef $$StatsTableUpdateCompanionBuilder = StatsCompanion Function({
  Value<String> statKey,
  Value<int> totalXp,
  Value<int> level,
  Value<int> rowid,
});

final class $$StatsTableReferences
    extends BaseReferences<_$AppDatabase, $StatsTable, Stat> {
  $$StatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$XpEventsTable, List<XpEvent>> _xpEventsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.xpEvents,
    aliasName: 'stats__stat_key__xp_events__stat_key',
  );

  $$XpEventsTableProcessedTableManager get xpEventsRefs {
    final manager = $$XpEventsTableTableManager($_db, $_db.xpEvents).filter(
      (f) => f.statKey.statKey.sqlEquals($_itemColumn<String>('stat_key')!),
    );

    final cache = $_typedResult.readTableOrNull(_xpEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StatsTableFilterComposer extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get statKey => $composableBuilder(
    column: $table.statKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalXp => $composableBuilder(
    column: $table.totalXp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> xpEventsRefs(
    Expression<bool> Function($$XpEventsTableFilterComposer f) f,
  ) {
    final $$XpEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statKey,
      referencedTable: $db.xpEvents,
      getReferencedColumn: (t) => t.statKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$XpEventsTableFilterComposer(
            $db: $db,
            $table: $db.xpEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StatsTableOrderingComposer
    extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get statKey => $composableBuilder(
    column: $table.statKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalXp => $composableBuilder(
    column: $table.totalXp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get statKey =>
      $composableBuilder(column: $table.statKey, builder: (column) => column);

  GeneratedColumn<int> get totalXp =>
      $composableBuilder(column: $table.totalXp, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  Expression<T> xpEventsRefs<T extends Object>(
    Expression<T> Function($$XpEventsTableAnnotationComposer a) f,
  ) {
    final $$XpEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statKey,
      referencedTable: $db.xpEvents,
      getReferencedColumn: (t) => t.statKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$XpEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.xpEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatsTable,
          Stat,
          $$StatsTableFilterComposer,
          $$StatsTableOrderingComposer,
          $$StatsTableAnnotationComposer,
          $$StatsTableCreateCompanionBuilder,
          $$StatsTableUpdateCompanionBuilder,
          (Stat, $$StatsTableReferences),
          Stat,
          PrefetchHooks Function({bool xpEventsRefs})
        > {
  $$StatsTableTableManager(_$AppDatabase db, $StatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> statKey = const Value.absent(),
                Value<int> totalXp = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatsCompanion(
                statKey: statKey,
                totalXp: totalXp,
                level: level,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String statKey,
                Value<int> totalXp = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatsCompanion.insert(
                statKey: statKey,
                totalXp: totalXp,
                level: level,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StatsTable, Stat>(table),
                  $$StatsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({xpEventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (xpEventsRefs) db.xpEvents],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (xpEventsRefs)
                    await $_getPrefetchedData<Stat, $StatsTable, XpEvent>(
                      currentTable: table,
                      referencedTable: $$StatsTableReferences
                          ._xpEventsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$StatsTableReferences(db, table, p0).xpEventsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.statKey == item.statKey,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$StatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatsTable,
      Stat,
      $$StatsTableFilterComposer,
      $$StatsTableOrderingComposer,
      $$StatsTableAnnotationComposer,
      $$StatsTableCreateCompanionBuilder,
      $$StatsTableUpdateCompanionBuilder,
      (Stat, $$StatsTableReferences),
      Stat,
      PrefetchHooks Function({bool xpEventsRefs})
    >;
typedef $$XpEventsTableCreateCompanionBuilder = XpEventsCompanion Function({
  Value<int> id,
  required String statKey,
  required int amount,
  required String sourceType,
  Value<int?> sourceId,
  required String occurredOn,
  required DateTime createdAt,
});
typedef $$XpEventsTableUpdateCompanionBuilder = XpEventsCompanion Function({
  Value<int> id,
  Value<String> statKey,
  Value<int> amount,
  Value<String> sourceType,
  Value<int?> sourceId,
  Value<String> occurredOn,
  Value<DateTime> createdAt,
});

final class $$XpEventsTableReferences
    extends BaseReferences<_$AppDatabase, $XpEventsTable, XpEvent> {
  $$XpEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StatsTable _statKeyTable(_$AppDatabase db) =>
      db.stats.createAlias('xp_events__stat_key__stats__stat_key');

  $$StatsTableProcessedTableManager get statKey {
    final $_column = $_itemColumn<String>('stat_key')!;

    final manager = $$StatsTableTableManager(
      $_db,
      $_db.stats,
    ).filter((f) => f.statKey.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_statKeyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$XpEventsTableFilterComposer
    extends Composer<_$AppDatabase, $XpEventsTable> {
  $$XpEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occurredOn => $composableBuilder(
    column: $table.occurredOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StatsTableFilterComposer get statKey {
    final $$StatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statKey,
      referencedTable: $db.stats,
      getReferencedColumn: (t) => t.statKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatsTableFilterComposer(
            $db: $db,
            $table: $db.stats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$XpEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $XpEventsTable> {
  $$XpEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occurredOn => $composableBuilder(
    column: $table.occurredOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StatsTableOrderingComposer get statKey {
    final $$StatsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statKey,
      referencedTable: $db.stats,
      getReferencedColumn: (t) => t.statKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatsTableOrderingComposer(
            $db: $db,
            $table: $db.stats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$XpEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $XpEventsTable> {
  $$XpEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get occurredOn => $composableBuilder(
    column: $table.occurredOn,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$StatsTableAnnotationComposer get statKey {
    final $$StatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statKey,
      referencedTable: $db.stats,
      getReferencedColumn: (t) => t.statKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatsTableAnnotationComposer(
            $db: $db,
            $table: $db.stats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$XpEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $XpEventsTable,
          XpEvent,
          $$XpEventsTableFilterComposer,
          $$XpEventsTableOrderingComposer,
          $$XpEventsTableAnnotationComposer,
          $$XpEventsTableCreateCompanionBuilder,
          $$XpEventsTableUpdateCompanionBuilder,
          (XpEvent, $$XpEventsTableReferences),
          XpEvent,
          PrefetchHooks Function({bool statKey})
        > {
  $$XpEventsTableTableManager(_$AppDatabase db, $XpEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$XpEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$XpEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$XpEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> statKey = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<int?> sourceId = const Value.absent(),
                Value<String> occurredOn = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => XpEventsCompanion(
                id: id,
                statKey: statKey,
                amount: amount,
                sourceType: sourceType,
                sourceId: sourceId,
                occurredOn: occurredOn,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String statKey,
                required int amount,
                required String sourceType,
                Value<int?> sourceId = const Value.absent(),
                required String occurredOn,
                required DateTime createdAt,
              }) => XpEventsCompanion.insert(
                id: id,
                statKey: statKey,
                amount: amount,
                sourceType: sourceType,
                sourceId: sourceId,
                occurredOn: occurredOn,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$XpEventsTable, XpEvent>(table),
                  $$XpEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({statKey = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (statKey) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.statKey,
                        referencedTable: $$XpEventsTableReferences
                            ._statKeyTable(db),
                        referencedColumn: $$XpEventsTableReferences
                            ._statKeyTable(db)
                            .statKey,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$XpEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $XpEventsTable,
      XpEvent,
      $$XpEventsTableFilterComposer,
      $$XpEventsTableOrderingComposer,
      $$XpEventsTableAnnotationComposer,
      $$XpEventsTableCreateCompanionBuilder,
      $$XpEventsTableUpdateCompanionBuilder,
      (XpEvent, $$XpEventsTableReferences),
      XpEvent,
      PrefetchHooks Function({bool statKey})
    >;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => SettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) => SettingsCompanion.insert(key: key, value: value, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsTable, Setting>(table),
                  BaseReferences<_$AppDatabase, $SettingsTable, Setting>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlayerCharactersTableTableManager get playerCharacters =>
      $$PlayerCharactersTableTableManager(_db, _db.playerCharacters);
  $$StatsTableTableManager get stats =>
      $$StatsTableTableManager(_db, _db.stats);
  $$XpEventsTableTableManager get xpEvents =>
      $$XpEventsTableTableManager(_db, _db.xpEvents);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
