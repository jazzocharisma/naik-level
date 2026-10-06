# ⚔️ Naik Level — Real Life RPG Tracker

> *"Hidupmu adalah game. Naikkan levelnya."*

[![CI](https://github.com/jazzocharisma/naik-level/actions/workflows/ci.yml/badge.svg)](https://github.com/jazzocharisma/naik-level/actions/workflows/ci.yml)
![Platform](https://img.shields.io/badge/platform-Android-3DDC84)
![Flutter](https://img.shields.io/badge/Flutter-stable-02569B)
![License](https://img.shields.io/badge/license-MIT-blue)

**Naik Level** mengubah kehidupan nyata menjadi RPG. Catat aktivitas (olahraga, belajar, tidur,
networking, menabung), dapatkan XP, naikkan 6 stat karakter, buka achievement, dan pantau
keuangan — semuanya offline-first dengan gaya pixel art.

> 🚧 **Status:** Rilis 1 sedang dikerjakan (Minggu 1 — Fondasi).

<!-- TODO (Minggu 8): GIF demo + screenshot -->

## Fitur (Rilis 1)

- Karakter & 6 stat: STR, INT, VIT, CHA, DIS, WLT
- Activity log, XP, level, daily cap & diminishing returns
- Quest harian/mingguan/utama, achievement, streak + freeze
- Money tracker + integrasi stat Wealth
- Recap (grafik, heatmap, timeline), class otomatis, insight berbasis aturan
- Backup/restore JSON, notifikasi, efek suara & haptic

Detail lengkap: [`docs/PRD.md`](docs/PRD.md)

## Tech Stack

Flutter · Dart 3 · Riverpod · Drift (SQLite) · go_router · fl_chart

## Arsitektur

Feature-first + Clean Architecture ringan. Folder `lib/domain/` berisi logika murni
(tanpa Flutter) sehingga seluruh aturan game bisa di-unit-test.
Lihat [`docs/adr/`](docs/adr/) untuk catatan keputusan teknis.

## Menjalankan

```bash
flutter pub get
flutter run
```

## Test

```bash
flutter analyze
flutter test --coverage
```

## Roadmap

- [x] Minggu 1 — Fondasi (sedang berjalan)
- [ ] Rilis 1 (v1.0.0) — Minggu 8
- [ ] Rilis 2 — Backend, AI Coach, cloud sync, Health Connect, widget

## Kredit Aset

Lihat [`ASSETS_LICENSES.md`](ASSETS_LICENSES.md).

## Lisensi

[MIT](LICENSE)
