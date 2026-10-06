# PRD: Naik Level — Real Life RPG Tracker

> **Versi:** 1.0 | **Platform:** Android (Flutter) | **Mode data:** Offline-first | **Gaya visual:** Pixel art
> **Cara pakai dokumen ini:** Tempel seluruh isi file ini di chat Claude baru, lalu ikuti bagian **[19. Instruksi untuk Claude](#19-instruksi-untuk-claude-di-chat-baru)**.

---

## 1. Ringkasan Produk

**Naik Level** adalah aplikasi Android yang mengubah kehidupan nyata menjadi RPG. Pengguna mencatat aktivitas produktif (olahraga, belajar, tidur, networking, menabung), lalu mendapat XP, stat karakter naik, level naik, dan achievement terbuka. Aplikasi juga memiliki money tracker, rekap perjalanan, dan insight otomatis.

**Tagline:** *"Hidupmu adalah game. Naikkan levelnya."*

**Target pengguna:** remaja dan pemuda yang suka bermain game (awalnya dipakai pribadi oleh pembuat, lalu open source di GitHub).

**Tujuan sekunder (portofolio):** menjadi proyek unggulan untuk melamar magang di Accenture (Semarang/Jakarta). Karena itu kualitas engineering (arsitektur, test, CI/CD, dokumentasi) sama pentingnya dengan fitur.

---

## 2. Tujuan & Metrik Keberhasilan

### Tujuan produk
1. Membuat pencatatan aktivitas terasa seperti bermain game, bukan mengisi formulir.
2. Memberi gambaran perkembangan diri yang jelas dari waktu ke waktu.
3. Menyatukan produktivitas dan keuangan dalam satu sistem progres.

### Tujuan portofolio
| Indikator | Target |
|---|---|
| Rilis 1 selesai dan bisa didemokan | Minggu 8 |
| Cakupan unit test pada logika inti (XP, streak, budget, achievement) | ≥ 80% |
| CI GitHub Actions (analyze + test + build APK) hijau | Setiap push ke `main` |
| README profesional (screenshot/GIF, arsitektur, cara run) | Ada |
| APK terpublikasi di GitHub Releases | Ada |
| Commit history rutin dengan konvensi (Conventional Commits) | Ada |
| Crash pada alur utama | 0 |

---

## 3. Persona

**Persona utama — "Raka", 20 tahun, mahasiswa & gamer**
- Suka RPG dan game progres (Genshin, Pokémon, Dark Souls).
- Sering mulai kebiasaan baik lalu berhenti dalam 1-2 minggu.
- Butuh umpan balik visual cepat dan rasa "naik level" supaya konsisten.
- Ingin tahu ke mana uangnya pergi, tapi malas aplikasi keuangan yang membosankan.

**Persona sekunder — "Pembuat aplikasi"** (juga pengguna pertama): dogfooding setiap hari, jadi bug dan friction cepat ketahuan.

---

## 4. Ruang Lingkup

### Rilis 1 — Offline (Minggu 1-8, WAJIB)
Karakter & stats, activity log, XP & level, quest, achievement, streak + freeze, money tracker + integrasi Wealth, recap (grafik, heatmap, timeline), class otomatis, insight berbasis aturan, notifikasi pengingat, tema, backup/restore JSON, efek suara & haptic, README & dokumentasi, CI/CD, APK release.

### Rilis 2 — Cloud & Cerdas (Minggu 9-14)
Backend + autentikasi, AI Coach (via backend proxy), cloud sync, Health Connect, widget home screen, lokalisasi ID/EN (jika belum di rilis 1).

### Di luar cakupan (tidak dikerjakan)
iOS, fitur sosial/leaderboard/multiplayer, monetisasi, integrasi bank/e-wallet otomatis, web/desktop.

---

## 5. Core Loop

```
Lakukan aktivitas nyata → Catat (log/quest) → Dapat XP → Stat naik → Level naik
        ↑                                                            ↓
   Termotivasi ← Achievement / Class / Insight / Rekap ←────────────┘
```

---

## 6. Fitur, User Story, dan Acceptance Criteria

### F1. Onboarding & Karakter
**User story:** Sebagai pengguna baru, saya ingin membuat karakter agar merasa memulai petualangan.
- **AC1:** Layar pembuatan karakter: nama, pilih avatar pixel (min. 6 pilihan).
- **AC2:** Semua stat mulai dari Level 1 dengan 0 XP.
- **AC3:** Ada tutorial singkat (3-4 layar) yang bisa dilewati.
- **AC4:** Karakter tersimpan lokal dan tidak perlu dibuat ulang saat app dibuka kembali.
- **AC5:** Nama dan avatar bisa diedit di profil.

### F2. Status Screen (Home)
**User story:** Sebagai pengguna, saya ingin melihat kartu karakter bergaya RPG untuk tahu kondisi saya sekarang.
- **AC1:** Menampilkan avatar, nama, title/class, level global, dan XP bar global.
- **AC2:** Menampilkan 6 stat beserta level dan progress bar masing-masing.
- **AC3:** Radar chart (hexagon) 6 stat.
- **AC4:** Menampilkan streak aktif, quest harian hari ini, dan tombol cepat "Catat Aktivitas".
- **AC5:** XP bar beranimasi ketika nilai berubah.

### F3. Stats
Enam stat dengan makna dan contoh aktivitas:

| Stat | Makna | Contoh aktivitas | Sumber otomatis (Rilis 2) |
|---|---|---|---|
| **STR** Strength | Kekuatan fisik | Gym, lari, push-up, olahraga | Health Connect: olahraga |
| **INT** Intelligence | Pengetahuan & skill | Belajar, kursus, baca buku, ngoding | — |
| **VIT** Vitality | Kesehatan | Tidur cukup, minum air, makan sehat | Health Connect: tidur, langkah |
| **CHA** Charisma | Sosial & komunikasi | Presentasi, networking, organisasi | — |
| **DIS** Discipline | Konsistensi | Streak, menyelesaikan quest tepat waktu | — |
| **WLT** Wealth | Kecerdasan finansial | Menabung, di bawah budget, mencatat keuangan | — |

- **AC1:** Tiap stat punya XP dan level sendiri.
- **AC2:** Halaman detail stat: riwayat XP, aktivitas terbaru, grafik 30 hari.
- **AC3:** Stat **DIS** otomatis bertambah dari streak dan quest yang selesai tepat waktu (bukan dari log manual).
- **AC4:** Stat **WLT** otomatis bertambah dari money tracker (lihat F8).

### F4. Activity Log
**User story:** Sebagai pengguna, saya ingin mencatat aktivitas dengan cepat agar mendapat XP.
- **AC1:** Form cepat: kategori (dari daftar), durasi (menit), tingkat kesulitan (Easy/Normal/Hard), catatan opsional.
- **AC2:** Preview XP yang akan didapat sebelum menyimpan.
- **AC3:** Setelah simpan: animasi +XP, dan animasi level-up bila level naik.
- **AC4:** Kategori bawaan (±20) dipetakan ke stat; pengguna bisa menambah kategori sendiri dengan memilih stat dan rate XP.
- **AC5:** Log bisa diedit dan dihapus; XP dihitung ulang dengan benar (lihat ledger XP di bagian 7).
- **AC6:** Bisa mencatat aktivitas untuk hari sebelumnya (maksimal 7 hari ke belakang).
- **AC7:** Daftar log dengan filter tanggal dan stat.

### F5. Sistem XP & Level
Aturan lengkap di **bagian 7**.
- **AC1:** Semua perhitungan berada di domain layer murni (tanpa dependensi Flutter) dan di-unit-test.
- **AC2:** Daily cap dan diminishing returns berlaku per stat.
- **AC3:** Seluruh perubahan XP tercatat di tabel `xp_events` (ledger) sehingga bisa diaudit dan dihitung ulang.

### F6. Quest System
**User story:** Sebagai pengguna, saya ingin punya misi harian/mingguan/utama agar punya arah.
- **AC1:** Tiga tipe: **Daily** (reset tiap hari), **Weekly** (reset Senin), **Main** (tujuan jangka panjang dengan sub-langkah).
- **AC2:** Buat quest sendiri (judul, stat terkait, XP reward, tipe, deadline opsional) atau pilih dari template (min. 15 template).
- **AC3:** Menyelesaikan quest memberi XP ke stat terkait ditambah bonus DIS.
- **AC4:** Main quest punya checklist sub-langkah dan progress persentase.
- **AC5:** Quest harian bisa diatur berulang (misalnya setiap hari / hari kerja saja).
- **AC6:** Quest yang melewati deadline ditandai "gagal" tanpa penalti XP (hanya memengaruhi statistik rekap).

### F7. Achievement & Badge
**User story:** Sebagai pengguna, saya ingin membuka pencapaian agar merasa dihargai.
- **AC1:** Minimal 40 achievement dengan rarity: Common, Rare, Epic, Legendary.
- **AC2:** Pop-up bergaya game + efek suara saat achievement terbuka.
- **AC3:** Halaman koleksi: yang terkunci tampil sebagai siluet dengan petunjuk.
- **AC4:** Evaluasi achievement berbasis event (setelah log, quest, transaksi) lewat `AchievementEngine` yang bisa di-test.
- **AC5:** Achievement tidak bisa terbuka dua kali dan menyimpan tanggal pembukaan.

Contoh daftar awal:

| Nama | Syarat | Rarity |
|---|---|---|
| Langkah Pertama | Catat aktivitas pertama | Common |
| Api Kecil | Streak 3 hari | Common |
| Konsisten | Streak 7 hari | Rare |
| Tak Terhentikan | Streak 30 hari | Epic |
| Legenda Disiplin | Streak 100 hari | Legendary |
| Kutu Buku | 50 jam total INT | Rare |
| Sang Cendekia | INT Level 10 | Epic |
| Besi Berkarat | 20 sesi STR | Common |
| Penyimpan Pertama | Tabungan pertama tercatat | Common |
| Juragan | Tabungan total Rp1.000.000 | Rare |
| Disiplin Dompet | Di bawah budget 3 bulan berturut-turut | Epic |
| Seimbang | Semua stat ≥ Level 5 | Epic |
| Pahlawan | Level global 25 | Legendary |

### F8. Money Tracker
**User story:** Sebagai pengguna, saya ingin mencatat pemasukan dan pengeluaran agar tahu kondisi keuangan saya.
- **AC1:** Transaksi: jenis (pemasukan/pengeluaran/transfer), nominal (Rupiah), kategori, dompet, tanggal, catatan.
- **AC2:** Dompet/akun multi (Tunai, Bank, E-wallet) dengan saldo dihitung dari transaksi.
- **AC3:** Kategori bawaan dan bisa ditambah (ikon pixel).
- **AC4:** Budget bulanan per kategori; indikator hijau/kuning/merah (<75% / 75-100% / >100%).
- **AC5:** Grafik pengeluaran per kategori (donut) dan tren bulanan (bar/line).
- **AC6:** Format Rupiah konsisten (`Rp1.250.000`), nominal disimpan sebagai integer (tanpa floating point).
- **AC7:** Edit dan hapus transaksi; saldo dan XP Wealth menyesuaikan.
- **AC8:** **Integrasi gamifikasi (Wealth):**
  - Mencatat transaksi hari ini: +5 XP WLT (maks. 1x per hari).
  - Akhir bulan di bawah budget total: +100 XP WLT.
  - Menyisihkan tabungan: +XP proporsional (rumus di bagian 7.6).
  - Finansial quest otomatis (misalnya "Tidak jajan 3 hari").

### F9. Streak & Freeze
- **AC1:** Hari dihitung "aktif" jika ada ≥1 aktivitas atau quest selesai.
- **AC2:** **Freeze:** jatah 1 per minggu (maks. simpan 2). Dipakai otomatis jika 1 hari terlewat.
- **AC3:** Bonus XP streak: +5% per 7 hari streak, maksimum +25%.
- **AC4:** Visual api/streak di Home; animasi saat streak naik atau freeze terpakai.
- **AC5:** Zona waktu perangkat jadi acuan; pergantian hari pukul 00:00 lokal (konfigurasi "hari baru mulai jam" opsional, default 00:00).

### F10. Recap / Journey
**User story:** Sebagai pengguna, saya ingin melihat perjalanan saya agar tahu progres.
- **AC1:** Rekap **Mingguan, Bulanan, All-time**: total XP, aktivitas, stat yang paling naik, quest selesai, achievement baru, ringkasan keuangan.
- **AC2:** **Heatmap** aktivitas ala GitHub (12 bulan).
- **AC3:** Grafik pertumbuhan XP per stat dari waktu ke waktu.
- **AC4:** **Timeline** milestone (level-up, achievement, quest utama).
- **AC5:** Kartu "Recap Card" bergaya pixel yang bisa diekspor sebagai gambar (share).
- **AC6:** Performa: halaman rekap dimuat < 1 detik dengan 1 tahun data (±5.000 log).

### F11. Class / Build Otomatis
- **AC1:** Class ditentukan dari stat dominan (rule di bagian 7.7), dihitung ulang tiap XP berubah.
- **AC2:** Tiap class punya title, sprite frame/aksesori avatar, dan deskripsi.
- **AC3:** Perubahan class memicu pop-up.

### F12. Insight Otomatis (berbasis aturan)
- **AC1:** Mesin insight memeriksa data dan menghasilkan 1-3 kalimat insight di Home dan rekap.
- **AC2:** Minimal 12 aturan, contoh:
  - "INT naik 30% dibanding minggu lalu."
  - "VIT turun 3 minggu berturut-turut, coba quest tidur cepat."
  - "Pengeluaran 'Jajan' sudah 80% dari budget di tanggal 15."
  - "Kamu paling produktif di hari Selasa."
- **AC3:** Setiap aturan punya unit test dengan data sampel.
- **AC4:** Insight tidak diulang dalam 3 hari.

### F13. Notifikasi Pengingat
- **AC1:** Pengingat harian (jam bisa diatur) dan peringatan "streak hampir putus" (misalnya jam 20:00 bila belum ada aktivitas).
- **AC2:** Bisa dimatikan per jenis; izin notifikasi Android 13+ ditangani dengan benar.
- **AC3:** Teks notifikasi bernuansa game ("Quest harianmu menunggu, Hero!").

### F14. Backup & Restore
- **AC1:** Ekspor seluruh data ke file JSON (berversi skema), dibagikan lewat share sheet atau disimpan ke penyimpanan.
- **AC2:** Impor JSON dengan validasi skema dan konfirmasi sebelum menimpa data.
- **AC3:** Ekspor CSV untuk transaksi dan log aktivitas.
- **AC4:** Test round-trip: ekspor → impor → data identik.

### F15. Pengaturan
Tema (dark default, light opsional dengan palet pixel), suara on/off, haptic on/off, notifikasi, bahasa (struktur siap lokalisasi), hapus semua data, tentang aplikasi (versi, atribusi aset, link GitHub).

### F16. Audio & Feedback
- **AC1:** Efek suara: tap, +XP, level-up, achievement, quest selesai (aset berlisensi bebas, atribusi di README).
- **AC2:** Haptic ringan pada aksi penting.
- **AC3:** Semua bisa dimatikan; tidak ada musik otomatis yang mengganggu.

---

## 7. Aturan Game (XP, Level, Streak, Class)

> Semua angka adalah **nilai awal yang dapat disetel** dan disimpan sebagai konstanta di satu file konfigurasi (`game_config.dart`) agar mudah diseimbangkan.

### 7.1 Kurva level (per stat)
XP kumulatif untuk mencapai level `L`:

```
totalXpForLevel(L) = 50 × L × (L − 1)
```
| Level | XP kumulatif |
|---|---|
| 1 | 0 |
| 2 | 100 |
| 3 | 300 |
| 4 | 600 |
| 5 | 1.000 |
| 10 | 4.500 |
| 20 | 19.000 |

Mencari level dari XP: `L = floor((1 + sqrt(1 + 0.08 × xp)) / 2)`. Level maksimum: 50.

### 7.2 Level global
`globalXp = jumlah XP seluruh stat`; level global memakai kurva yang sama dengan faktor `×2` (`100 × L × (L − 1)`). Title ditentukan dari rentang level global (misalnya 1-4 "Novice", 5-9 "Apprentice", 10-19 "Adventurer", 20-34 "Veteran", 35-49 "Hero", 50 "Legend").

### 7.3 XP dari aktivitas
```
baseXp = durasiMenit × rateKategori        (rate default 1.0 XP/menit; rentang 0.5–2.0)
xp     = baseXp × multiplierKesulitan × multiplierStreak
```
- Kesulitan: Easy ×0.8, Normal ×1.0, Hard ×1.3
- Streak: 1 + min(0.25, 0.05 × floor(streak / 7))
- XP per aktivitas dibulatkan ke integer, minimal 1, maksimal 150 per entri.

### 7.4 Daily cap & diminishing returns (per stat per hari)
| XP stat hari ini | Efisiensi |
|---|---|
| 0 – 120 | 100% |
| 121 – 240 | 50% |
| 241 – 300 | 20% |
| > 300 | 0% (dibatasi) |

Tujuan: mencegah curang dan burnout. UI menampilkan indikator "Kelelahan" saat memasuki zona diminishing.

### 7.5 XP quest
- Daily: 20-50 XP; Weekly: 80-200 XP; Main: 300-1.000 XP (dibagi per sub-langkah + bonus selesai).
- Quest XP **tidak** terkena daily cap, tetapi dibatasi maksimal 5 quest XP-bearing per hari.
- Setiap quest selesai tepat waktu: +10 XP DIS.

### 7.6 XP Wealth
- Catat transaksi (1x/hari): +5 XP
- Di bawah budget bulanan total: +100 XP (diberikan saat bulan ditutup)
- Menabung: `+ min(80, floor(nominalTabungan / 25.000))` XP per transaksi tabungan (maks. 1x/hari)
- Semua XP WLT tetap tunduk pada daily cap kecuali bonus akhir bulan.

### 7.7 Class otomatis
Hitung `share = xpStat / totalXp` (bila totalXp < 300, class = **Newbie**):

| Kondisi | Class |
|---|---|
| STR share tertinggi dan ≥ 25% | Warrior |
| INT share tertinggi dan ≥ 25% | Scholar |
| VIT share tertinggi dan ≥ 25% | Paladin |
| CHA share tertinggi dan ≥ 25% | Bard |
| DIS share tertinggi dan ≥ 25% | Monk |
| WLT share tertinggi dan ≥ 25% | Merchant |
| Tidak ada yang ≥ 25% dan selisih max-min < 15% | Adventurer (seimbang) |

### 7.8 Ledger XP
Setiap perubahan XP adalah baris di `xp_events` (`source_type`: activity/quest/achievement/finance/streak, `source_id`, `stat`, `amount`, `created_at`). Level dan XP stat adalah **hasil turunan** (derived) dari ledger, dengan cache pada tabel `stats`. Menghapus log berarti menghapus event terkait, lalu menghitung ulang cache.

---

## 8. Model Data (Drift / SQLite)

| Tabel | Kolom utama |
|---|---|
| `characters` | id, name, avatar_id, created_at |
| `stats` | stat_key (PK), total_xp, level (cache) |
| `activity_categories` | id, name, stat_key, xp_rate, icon, is_custom |
| `activity_logs` | id, category_id, duration_min, difficulty, note, logged_at, created_at |
| `xp_events` | id, stat_key, amount, source_type, source_id, occurred_on (date), created_at |
| `quests` | id, title, description, type (daily/weekly/main), stat_key, xp_reward, repeat_rule, deadline, status, created_at, completed_at |
| `quest_steps` | id, quest_id, title, is_done |
| `achievement_unlocks` | achievement_key (PK), unlocked_at |
| `streak_state` | current, longest, last_active_date, freezes_available, freeze_week_anchor |
| `wallets` | id, name, type, initial_balance (int), icon |
| `money_categories` | id, name, kind (income/expense), icon |
| `transactions` | id, kind, amount (int Rupiah), category_id, wallet_id, to_wallet_id, note, occurred_at |
| `budgets` | id, category_id, month (yyyy-MM), limit_amount |
| `insights_shown` | rule_key, shown_on |
| `settings` | key (PK), value |

Catatan:
- Definisi achievement disimpan sebagai kode (konstanta), bukan di DB; DB hanya menyimpan status unlock.
- Gunakan migrasi Drift berversi sejak awal (`schemaVersion`), dengan test migrasi.
- Semua waktu disimpan UTC; konversi ke lokal di lapisan presentasi.

---

## 9. Arsitektur & Stack

### Stack
| Kebutuhan | Pilihan |
|---|---|
| Framework | Flutter (stable terbaru), Dart 3 |
| State management | Riverpod (`flutter_riverpod`, dengan `riverpod_generator` bila nyaman) |
| Database | Drift + `sqlite3_flutter_libs` |
| Navigasi | `go_router` |
| Grafik | `fl_chart` |
| Notifikasi | `flutter_local_notifications` |
| Audio | `audioplayers` atau `just_audio` |
| Berbagi/ekspor | `share_plus`, `path_provider`, `file_picker` |
| Model immutable | `freezed` + `json_serializable` (opsional) |
| Lint | `very_good_analysis` atau `flutter_lints` + aturan tambahan |
| Test | `flutter_test`, `mocktail`, `integration_test` |

### Pola arsitektur: Feature-first + Clean Architecture ringan
```
lib/
├─ main.dart
├─ app/                      # router, tema, bootstrap, DI (providers)
├─ core/
│  ├─ game_config.dart       # konstanta game (XP, cap, dll.)
│  ├─ utils/                 # tanggal, format Rupiah
│  └─ widgets/               # komponen pixel UI bersama
├─ data/
│  ├─ db/                    # Drift tables, DAO, migrasi
│  └─ repositories/          # implementasi repository
├─ domain/                   # LOGIKA MURNI (tanpa Flutter)
│  ├─ entities/
│  ├─ xp_calculator.dart
│  ├─ level_calculator.dart
│  ├─ streak_service.dart
│  ├─ achievement_engine.dart
│  ├─ class_resolver.dart
│  └─ insight_engine.dart
└─ features/
   ├─ onboarding/
   ├─ home/
   ├─ stats/
   ├─ activity/
   ├─ quests/
   ├─ achievements/
   ├─ money/
   ├─ recap/
   └─ settings/
test/                        # mencerminkan struktur lib/
integration_test/
docs/                        # arsitektur, ADR, screenshot
.github/workflows/ci.yml
```

### Prinsip
1. `domain/` tidak boleh meng-import `package:flutter`; seluruh aturan game bisa dites murni.
2. UI → Provider/Notifier → Repository → DAO. UI tidak mengakses database langsung.
3. Waktu diakses lewat `Clock` yang bisa di-inject agar test streak dan reset deterministik.
4. Error ditangani eksplisit (hasil `Result`/`AsyncValue`), bukan dibiarkan melempar ke UI.
5. Setiap keputusan penting dicatat sebagai **ADR** singkat di `docs/adr/` (misalnya "Kenapa Riverpod", "Kenapa ledger XP").

---

## 10. Design System — Pixel Art

- **Font:** *Press Start 2P* untuk judul/angka besar, *Pixelify Sans* untuk teks isi agar tetap terbaca. (Keduanya Google Fonts, lisensi OFL; bundel lokal agar offline.)
- **Palet terbatas (±16 warna)**, dark fantasy retro. Contoh token:
  - Background `#1A1423`, Surface `#2D2440`, Border `#0F0A18`
  - Primary (emas XP) `#F5C542`, Aksen hijau `#4ADE80`, merah HP `#EF4444`, biru mana `#38BDF8`, ungu langka `#A855F7`
  - Warna per stat: STR merah, INT biru, VIT hijau, CHA pink, DIS oranye, WLT emas
- **Komponen khas:** panel dengan border tebal bergaya 9-slice, tombol dengan efek "tekan" 2px, progress bar bersegmen (blok), dialog bergaya kotak teks RPG, ikon 16×16 atau 32×32.
- **Rendering pixel:** gunakan `FilterQuality.none` pada gambar sprite agar tidak blur; skala kelipatan bulat.
- **Aset:** avatar (6+), ikon stat (6), badge achievement (rarity frame ×4), ikon kategori, sprite animasi level-up. Gunakan paket gratis berlisensi jelas (itch.io, OpenGameArt) **atau** buat sendiri (Aseprite/Piskel/LibreSprite). **Catat sumber dan lisensi setiap aset di `ASSETS_LICENSES.md`.**
- **Animasi:** XP bar terisi bertahap, partikel pixel saat level-up, shake ringan saat gagal, transisi layar bergaya "blink".
- **Aksesibilitas:** kontras teks memenuhi WCAG AA, ukuran target sentuh ≥ 48dp, dukung skala font sistem, jangan hanya mengandalkan warna (tambahkan ikon/teks).

---

## 11. Persyaratan Non-Fungsional

| Aspek | Target |
|---|---|
| Performa | Start dingin < 2 detik; scroll 60 fps pada perangkat menengah |
| Offline | 100% fungsi Rilis 1 berjalan tanpa internet |
| Integritas data | Transaksi DB atomik (log + xp_events dalam satu transaksi); tidak ada XP ganda |
| Privasi | Semua data lokal; tidak ada analitik/pelacakan di Rilis 1 |
| Kompatibilitas | Android 8.0 (API 26) ke atas, target SDK terbaru |
| Ukuran APK | < 40 MB |
| Keamanan (Rilis 2) | Tidak ada API key di dalam aplikasi; semua panggilan AI lewat backend proxy |
| Maintainability | Lint bersih, tidak ada warning analyzer, dokumentasi publik pada kelas inti |

---

## 12. Strategi Testing

| Level | Cakupan | Target |
|---|---|---|
| Unit | `xp_calculator`, `level_calculator`, `streak_service`, `achievement_engine`, `class_resolver`, `insight_engine`, perhitungan budget/saldo | ≥ 80% pada `domain/` |
| Repository/DB | Drift in-memory: CRUD, ledger, hitung ulang XP, migrasi | Semua repository |
| Widget | Home, form log, form transaksi, pop-up level-up | Alur kritis |
| Integration | Onboarding → catat aktivitas → XP naik → achievement terbuka; tambah transaksi → saldo berubah; backup → restore | 3-5 skenario |

**Kasus uji wajib (contoh):** pergantian hari tepat tengah malam, streak dengan freeze, hapus log memengaruhi XP/level, daily cap, level-up berantai (satu log menaikkan 2 level), transaksi transfer antar dompet, budget bulan berganti, impor JSON rusak.

---

## 13. CI/CD & Praktik Repositori

- **GitHub Actions** (`.github/workflows/ci.yml`): `flutter pub get` → `flutter analyze` → `flutter test --coverage` → `flutter build apk --release` (artifact). Badge status dan coverage di README.
- **Release workflow:** tag `vX.Y.Z` memicu build APK dan melampirkannya ke GitHub Release secara otomatis.
- **Git:** branch `main` (stabil) + branch fitur (`feat/...`, `fix/...`); Pull Request ke diri sendiri dengan template (bagus untuk jejak review); **Conventional Commits**; changelog (`CHANGELOG.md`).
- **Issue tracker:** pakai GitHub Issues + Project board untuk backlog (satu issue per user story). Ini menunjukkan cara kerja tim.
- **Lisensi:** MIT (kecuali aset yang punya lisensi sendiri).

---

## 14. Deliverable Dokumentasi (penting untuk HRD)

1. **README.md:** deskripsi singkat, GIF demo, screenshot, fitur, tech stack, arsitektur (diagram), cara menjalankan, cara test, roadmap, kredit aset.
2. **docs/architecture.md:** diagram lapisan, alur data, ERD database.
3. **docs/adr/:** 5-8 catatan keputusan teknis.
4. **docs/game-design.md:** rumus XP, kurva level, alasan desain.
5. **PRD ini** (disimpan di `docs/PRD.md`).
6. **Video demo 1-2 menit** (tautkan di README dan CV).
7. **Penjelasan 60 detik** untuk wawancara: masalah → solusi → keputusan teknis tersulit (jawaban: ledger XP + offline-first + testing logika inti).

---

## 15. Rencana Rilis 1 (Minggu 1-8)

### Minggu 1 — Fondasi
- [ ] Buat repo GitHub, lisensi, struktur folder, lint, `.gitignore`
- [ ] Setup Riverpod, go_router, Drift (skema awal + migrasi v1)
- [ ] Design system dasar: tema, font, token warna, komponen `PixelButton`, `PixelPanel`, `PixelProgressBar`
- [ ] Navigasi bawah (Home, Quest, Money, Recap, Profil)
- [ ] CI GitHub Actions pertama (analyze + test)
- [ ] ADR pertama

### Minggu 2 — Karakter, Stats, XP
- [ ] Onboarding & pembuatan karakter (F1)
- [ ] `game_config`, `level_calculator`, `xp_calculator` + unit test lengkap
- [ ] Tabel `stats`, `xp_events`, repository XP (ledger + cache)
- [ ] Status screen awal (F2) dengan radar chart

### Minggu 3 — Activity Log → **MVP**
- [ ] Kategori bawaan + form log aktivitas (F4)
- [ ] Daily cap & diminishing returns, preview XP
- [ ] Animasi +XP dan level-up
- [ ] Edit/hapus log + hitung ulang XP
- [ ] Halaman detail stat (F3)
- [ ] **Rilis APK v0.1.0 (MVP)** di GitHub Releases

### Minggu 4 — Quest, Achievement, Streak
- [ ] Streak + freeze + `Clock` injectable + test (F9)
- [ ] Quest daily/weekly/main + template (F6)
- [ ] `achievement_engine` + 40 achievement + pop-up + koleksi (F7)
- [ ] Rilis v0.2.0

### Minggu 5 — Money Tracker
- [ ] Dompet, kategori, transaksi, transfer (F8)
- [ ] Budget bulanan + indikator
- [ ] Integrasi XP Wealth dan achievement finansial
- [ ] Format Rupiah, test perhitungan saldo/budget
- [ ] Rilis v0.3.0

### Minggu 6 — Recap, Class, Insight
- [ ] Rekap mingguan/bulanan/all-time (F10)
- [ ] Heatmap, grafik pertumbuhan, timeline
- [ ] `class_resolver` (F11) dan `insight_engine` 12 aturan + test (F12)
- [ ] Recap Card yang bisa dibagikan
- [ ] Rilis v0.4.0

### Minggu 7 — Polish & Sistem
- [ ] Notifikasi (F13), pengaturan (F15), tema terang
- [ ] Backup/restore JSON + CSV (F14) + test round-trip
- [ ] Audio & haptic (F16)
- [ ] Optimasi performa, perbaikan bug dari pemakaian harian
- [ ] Siapkan struktur lokalisasi (ARB), semua string dari file terpisah

### Minggu 8 — Finalisasi
- [ ] Coverage ≥ 80% domain, integration test utama
- [ ] README final, diagram arsitektur, GIF/screenshot, video demo
- [ ] `ASSETS_LICENSES.md`, CHANGELOG, ADR lengkap
- [ ] **Rilis v1.0.0** (APK di GitHub Releases)
- [ ] Update CV/LinkedIn dengan tautan repo dan demo

> **Aturan emas:** di akhir tiap minggu aplikasi harus **bisa dijalankan dan tidak rusak**. Jika terlambat, potong fitur (urutan pemotongan: audio → tema terang → Recap Card → insight tambahan), jangan potong test dan dokumentasi.

---

## 16. Rencana Rilis 2 (Minggu 9-14)

Urutan disarankan (AI lebih awal karena paling mudah dipamerkan):

| Minggu | Pekerjaan |
|---|---|
| 9 | **Backend & Auth:** Supabase (atau Firebase), login Google/email, Row Level Security, skema cloud |
| 10 | **AI Coach (bagian 1):** Edge Function sebagai proxy ke API LLM, rate limit per pengguna, prompt sistem, ringkasan data anonim dari app |
| 11 | **AI Coach (bagian 2):** UI chat bergaya dialog NPC "Guild Master", saran quest harian yang bisa langsung ditambahkan, insight mingguan naratif, penanganan error/offline |
| 12 | **Cloud Sync:** sinkronisasi offline-first berbasis `updated_at` + soft delete + tabel antrean perubahan; strategi konflik (last-write-wins per baris, ledger XP bersifat append-only) |
| 13 | **Health Connect:** langkah, tidur, olahraga → XP otomatis dengan izin eksplisit dan de-duplikasi |
| 14 | **Widget home screen** (XP/streak/quest hari ini) + lokalisasi ID/EN + polish + rilis v2.0.0 |

**Prinsip keamanan AI:** API key hanya di server; data yang dikirim ke AI diminimalkan dan pengguna bisa mematikan fitur; respons AI divalidasi (format JSON) sebelum dipakai; ada batas permintaan harian; app tetap berfungsi penuh tanpa AI.

---

## 17. Risiko & Mitigasi

| Risiko | Dampak | Mitigasi |
|---|---|---|
| Scope terlalu besar | Tidak selesai | Rilis bertahap, aturan pemotongan fitur, MVP minggu 3 |
| Aset pixel memakan waktu | Jadwal mundur | Pakai aset gratis berlisensi dulu; ganti belakangan |
| Bug perhitungan XP/streak | Data salah, hilang kepercayaan | Ledger + unit test ketat + `Clock` injectable |
| Migrasi database merusak data | Data hilang | `schemaVersion` + test migrasi + backup JSON |
| Cloud sync rumit | Rilis 2 molor | Ledger append-only, LWW sederhana, mulai dari sync satu arah bila perlu |
| Kehilangan motivasi | Berhenti | Dogfooding harian, rilis kecil tiap minggu |
| Lisensi aset | Masalah hukum | Catat semua sumber & lisensi |

---

## 18. Keputusan yang Sudah Final

1. Nama: **Naik Level**; platform: **Android**; mode: **offline-first** (backup JSON di Rilis 1)
2. Gaya visual: **pixel art**; target: gamer remaja-pemuda
3. 6 stat: STR, INT, VIT, CHA, DIS, WLT
4. Stack: Flutter + Riverpod + Drift + go_router + fl_chart
5. Rilis 1 (8 minggu) wajib; Rilis 2 (6 minggu) mencakup backend, AI Coach, cloud sync, Health Connect, widget
6. Pengembangan di VS Code; repo publik di GitHub sejak hari pertama

**Pertanyaan terbuka (bisa diputuskan di tengah jalan):** nama final aset/avatar; apakah perlu mode "hari baru mulai jam X"; penyedia backend (Supabase vs Firebase) diputuskan di minggu 9.

---

## 19. Instruksi untuk Claude (di chat baru)

> Salin bagian ini bersama seluruh PRD saat memulai chat baru.

Kamu adalah mentor dan pair-programmer Flutter senior. Aku sedang membangun aplikasi **Naik Level** sesuai PRD di atas, menggunakan **VS Code**, untuk portofolio magang di Accenture. Aturan kerja:

1. **Bertahap:** kerjakan satu minggu/fase sesuai bagian 15, dan di dalamnya satu tugas kecil per jawaban. Jangan loncat fase. Mulai dari **Minggu 1**.
2. **Setiap tugas** berikan: tujuan singkat, file yang dibuat/diubah (path lengkap), kode lengkap yang siap salin, perintah terminal yang perlu dijalankan, cara memverifikasi, dan pesan commit (Conventional Commits).
3. **Logika inti dulu dengan test:** setiap kode di `domain/` harus disertai unit test.
4. **Jelaskan alasan** keputusan teknis penting dalam 1-3 kalimat (aku perlu bisa menjelaskannya saat wawancara) dan tawarkan draf ADR bila relevan.
5. **Patuhi arsitektur** di bagian 9 (feature-first, `domain/` bebas Flutter, Riverpod, Drift, `Clock` injectable) dan semua angka di bagian 7 (simpan di `game_config.dart`).
6. **Kode harus bisa jalan**: periksa konsistensi import, versi paket (minta aku menjalankan `flutter pub add` agar versi terbaru), dan hindari API yang sudah deprecated. Bila tidak yakin dengan versi/API terbaru, katakan terus terang.
7. **Akhir tiap tugas**, beri checklist progres minggu itu dan usulan tugas berikutnya. Tunggu konfirmasiku sebelum lanjut.
8. Bila ada error, aku akan menempelkan pesan error lengkap; bantu diagnosis dengan langkah terstruktur.
9. Jaga agar aplikasi **selalu dalam keadaan bisa dijalankan** di akhir setiap tugas.
10. Jangan menambah fitur di luar PRD tanpa bertanya. Jika menurutmu ada perbaikan PRD, usulkan dulu.

**Mulai sekarang:** bantu aku mengerjakan **Minggu 1, tugas pertama** (setup repo dan proyek Flutter, struktur folder, lint, dan commit awal). Tanyakan versi Flutter/Dart yang terpasang di mesinku bila perlu.
