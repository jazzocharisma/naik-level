# ADR-0001: Riverpod untuk state management

- **Status:** Diterima
- **Tanggal:** 2026-10-06

## Konteks
Aplikasi memiliki banyak state turunan (XP, level, streak, saldo, budget) yang bergantung
pada database lokal dan harus mudah diuji tanpa UI. Kita juga butuh injeksi dependensi
(misalnya `Clock`, repository) yang bisa di-override saat test.

## Keputusan
Memakai **Riverpod** (`flutter_riverpod`) sebagai state management sekaligus DI.

## Alternatif yang dipertimbangkan
- **Provider** — sederhana, tetapi bergantung pada widget tree dan kurang aman saat compile.
- **BLoC** — terstruktur, tetapi lebih banyak boilerplate untuk skala proyek ini.
- **setState/GetX** — sulit diuji dan diskalakan.

## Konsekuensi
- (+) Provider tidak terikat widget tree; mudah di-override di test; mendukung `AsyncValue`.
- (+) Cocok dengan prinsip UI → Notifier → Repository → DAO.
- (−) Kurva belajar bagi yang belum familier dengan konsep provider/ref.
