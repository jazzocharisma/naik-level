/// Enam stat karakter (PRD F3). `code` adalah nilai yang disimpan di database.
enum StatKey {
  str('STR'),
  intelligence('INT'),
  vit('VIT'),
  cha('CHA'),
  dis('DIS'),
  wlt('WLT');

  const StatKey(this.code);

  final String code;

  static StatKey fromCode(String code) =>
      StatKey.values.firstWhere((s) => s.code == code);
}
