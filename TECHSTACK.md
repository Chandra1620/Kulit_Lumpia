# TECHSTACK — Kulit Lumpia

> Dokumen keputusan teknologi dan arsitektur  
> Versi: 1.0  
> Platform target: Android  
> Backend platform: Supabase

---

## 1. Ringkasan Keputusan

Kulit Lumpia dibangun sebagai aplikasi Android menggunakan Flutter dan Supabase sebagai backend terkelola.

| Lapisan | Teknologi | Kegunaan |
|---|---|---|
| Mobile framework | Flutter | UI dan aplikasi Android |
| Bahasa | Dart | Bahasa pemrograman |
| Struktur aplikasi | Feature-first + layered architecture | Pemisahan fitur dan tanggung jawab |
| UI architecture | MVVM | Pemisahan View dan ViewModel |
| State management | Riverpod | State dan dependency management |
| Navigation | GoRouter | Routing dan guard berdasarkan sesi/role |
| Backend platform | Supabase | Backend terkelola |
| Database | PostgreSQL (Supabase) | Data transaksi dan operasional |
| Authentication | Supabase Auth | Login, registrasi, sesi |
| Data access | Supabase Data API | Query database dari Flutter |
| Critical business operations | PostgreSQL Functions / RPC | Transaksi dan validasi proses |
| Server-side integration | Supabase Edge Functions | Logika server dan integrasi pihak ketiga |
| Realtime | Supabase Realtime | Pembaruan status langsung |
| File storage | Supabase Storage | Foto produk, bukti transfer, bukti penerimaan |
| Serialization | Freezed + json_serializable | Model immutable dan JSON |
| Local preferences | SharedPreferences | Preferensi non-sensitif |
| Form validation | Formz | Validasi form terstruktur |
| Date/number formatting | intl | Format tanggal dan Rupiah |
| Image selection | image_picker | Pilih foto dari kamera/galeri |
| Image caching | cached_network_image | Cache gambar jaringan |
| Testing | flutter_test + mocktail | Unit/widget test dan mocking |
| Static analysis | flutter_lints | Aturan kualitas kode |
| Version control | Git + GitHub | Source control |
| IDE | Visual Studio Code | Pengembangan |

Versi package harus ditentukan saat inisialisasi proyek dengan memeriksa kompatibilitas versi Flutter/Dart dan dokumentasi package terkini. Jangan menyalin nomor versi dari tutorial lama tanpa verifikasi.

---

## 2. Flutter

Flutter dipilih karena:
- Satu codebase untuk aplikasi mobile.
- UI konsisten pada berbagai perangkat Android.
- Ekosistem package luas.
- Integrasi Supabase tersedia.
- Mendukung unit, widget, dan integration testing.
- Dapat dikembangkan untuk platform lain jika kebutuhan bisnis berubah.

**Bahasa:** Dart.

**Target MVP:** Android. Jangan menambah target iOS/web/desktop sebelum ada kebutuhan bisnis.

---

## 3. Arsitektur Aplikasi

Gunakan kombinasi **Feature-First Architecture + Layered Architecture + MVVM**.

Flutter merekomendasikan pemisahan UI dan data, repository pattern, ViewModel/View, dependency injection, serta pengujian komponen secara terpisah.

### 3.1 Lapisan

1. **Presentation**
   - Screens/pages.
   - Reusable widgets.
   - ViewModels/Notifiers.
   - UI state.

2. **Domain**
   - Entity.
   - Use cases untuk aturan bisnis yang kompleks.
   - Repository contracts.
   - Status dan aturan transisi domain.

3. **Data**
   - Repository implementations.
   - Supabase data sources.
   - DTO/model.
   - Mapper.
   - File storage service.

Domain layer digunakan ketika aturan bisnis memang kompleks, terutama untuk checkout, pembayaran, stok, dan transisi status. Hindari membuat abstraksi berlebihan untuk fitur sederhana.

### 3.2 Struktur Folder yang Disarankan

```text
lib/
├── app/
│   ├── app.dart
│   ├── router/
│   └── theme/
│
├── core/
│   ├── config/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── network/
│   ├── utils/
│   └── widgets/
│
├── shared/
│   ├── models/
│   ├── services/
│   └── widgets/
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── profile/
│   ├── catalog/
│   ├── cart/
│   ├── checkout/
│   ├── orders/
│   ├── payments/
│   ├── admin/
│   ├── production/
│   ├── delivery/
│   ├── notifications/
│   └── reports/
│
└── main.dart
```

Setiap feature dapat memiliki struktur:

```text
feature_name/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── pages/
    ├── widgets/
    └── providers/
```

Feature yang sederhana tidak wajib memiliki semua folder. Struktur harus mengikuti kompleksitas nyata.

---

## 4. State Management — Riverpod

Gunakan Riverpod untuk:
- Menyimpan state autentikasi.
- Menyediakan dependency Supabase client dan repository.
- Mengelola state katalog dan keranjang.
- Mengelola daftar/detail pesanan.
- Mengelola state dashboard setiap role.
- Mengonsumsi stream Realtime.
- Mengelola loading, error, dan success state.

Aturan:
- Widget tidak berisi business logic.
- Jangan melakukan query Supabase langsung dari widget.
- Gunakan provider/notifier sebagai penghubung UI dan use case/repository.
- State penting harus immutable.
- Hindari satu provider global yang mengelola seluruh aplikasi.

---

## 5. Navigation — GoRouter

GoRouter digunakan untuk:
- Routing halaman.
- Nested navigation jika diperlukan.
- Redirect ketika sesi belum login.
- Role-based route guard.
- Deep link bila dibutuhkan.

Contoh aturan akses:
- Belum login → login.
- Role pembeli → area pembeli.
- Role admin → area admin.
- Role kepala karyawan → area produksi.
- Role pengirim → area pengiriman.

**Penting:** route guard hanya mengatur navigasi UI. Route guard bukan sistem keamanan data. Supabase RLS dan validasi server tetap wajib.

---

## 6. Supabase Backend

Supabase menjadi backend utama tanpa perlu membangun REST API server terpisah untuk kebutuhan MVP.

### 6.1 Supabase PostgreSQL

Digunakan untuk:
- Profil dan role.
- Produk dan varian.
- Stok dan mutasi stok.
- Pesanan dan item.
- Pembayaran dan verifikasi.
- Penugasan pengiriman.
- Bukti penerimaan.
- Histori status.
- Notifikasi.
- Audit log.

Konvensi database:
- Primary key UUID.
- Nama tabel dan kolom `snake_case`.
- Waktu memakai `timestamptz`.
- Nominal Rupiah memakai `bigint` atau integer yang sesuai, bukan float.
- Foreign key dan check constraint.
- Index untuk kolom pencarian/filter yang sering digunakan.
- Migration SQL disimpan dalam version control.

### 6.2 Supabase Auth

Digunakan untuk:
- Registrasi pembeli (HANYA role `buyer` yang dibuka untuk pendaftaran publik, D-05).
- Login dan logout seluruh pengguna.
- Pemulihan password.
- Persistensi sesi.
- Identitas pengguna yang terhubung ke tabel `profiles`.

Role aplikasi disimpan dan dikelola secara aman. Pengguna tidak dapat memilih atau mengubah role sendiri melalui aplikasi klien.

Ketentuan Akses:
- Registrasi publik HANYA untuk role `buyer`. Formulir pendaftaran tidak memuat pilihan role.
- Akun staf (`admin`, `production_lead`, `courier`) dibuat secara tertutup oleh admin melalui mekanisme administratif yang aman.
- Role default pengguna baru ditetapkan server-side/database-side sebagai `buyer`.
- Validasi role ditegakkan pada tingkat RLS database, bukan hanya dari state lokal aplikasi.

### 6.3 Supabase Data API

Flutter menggunakan package `supabase_flutter` untuk mengakses Data API.

Akses tabel hanya diberikan setelah:
1. RLS aktif.
2. Policy dibuat dan diuji untuk ke-4 role.
3. Hak akses database diberikan secara least privilege.

Jangan menganggap tabel aman hanya karena aplikasi menyembunyikan menu tertentu.

### 6.4 PostgreSQL Functions / RPC

Gunakan fungsi database untuk operasi kritis yang harus atomik dan konsisten.

Daftar fungsi transaksi yang wajib diimplementasikan:
- `create_order(...)` — validasi varian aktif, hitung total harga di server, simpan snapshot, dan wajib sertakan bukti transfer jika metode transfer (D-07).
- `approve_order(...)` — persetujuan admin dan alokasi stok atomik.
- `reject_order(...)` — penolakan admin dengan alasan wajib.
- `start_production(...)` — mulai proses produksi oleh kepala karyawan.
- `complete_production(...)` — penyelesaian produksi oleh kepala karyawan ke `ready_for_delivery`.
- `assign_courier(...)` — penugasan pengirim aktif oleh admin ke `assigned_to_courier`.
- `start_delivery(...)` — mulai pengiriman oleh pengirim ke `in_delivery`.
- `report_cod_receipt(...)` — pengirim melaporkan penerimaan fisik uang COD (tahap 1 konfirmasi COD).
- `confirm_delivery(...)` — pengirim mengonfirmasi sampai (`delivered`) dengan validasi wajib foto bukti dan nama penerima barang (D-06).
- `verify_transfer_payment(...)` — verifikasi bukti transfer manual oleh admin.
- `record_cod_payment(...)` — verifikasi fisik setoran uang COD oleh admin ke `cod_collected` (tahap 2 konfirmasi COD).
- `process_refund(...)` — pencatatan manual pengembalian dana transfer bank oleh admin (D-03).
- `cancel_order(...)` — pembatalan pesanan (buyer hanya pada `pending_approval`, admin dengan alasan wajib dan inisiasi karantina sisa produksi D-01/D-02).

Nama di atas adalah rancangan awal, bukan kewajiban nama final.

Setiap fungsi harus:
- Memeriksa identitas pengguna.
- Memeriksa role dan kepemilikan/assignment.
- Memeriksa status sebelumnya.
- Menolak transisi yang tidak valid.
- Menjalankan update terkait dalam satu transaksi.
- Mencatat histori dan audit log.
- Mencegah aksi ganda jika request diulang.

Jangan membuat fungsi `update_order_status` generik yang membolehkan klien mengirim status apa pun tanpa aturan transisi.

### 6.5 Supabase Edge Functions

Gunakan untuk kebutuhan server-side seperti:
- Integrasi payment gateway di masa depan.
- Push notification provider.
- Webhook eksternal.
- Proses yang memerlukan secret API.
- Pekerjaan server-side yang tidak tepat dilakukan di aplikasi klien.

Jangan memindahkan seluruh CRUD sederhana ke Edge Functions tanpa alasan. PostgreSQL RPC lebih tepat untuk transaksi database yang harus atomik.

### 6.6 Supabase Realtime

Digunakan untuk:
- Pesanan baru pada dashboard admin.
- Pembaruan antrean kepala karyawan.
- Penugasan baru untuk pengirim.
- Pembaruan status pesanan pada aplikasi pembeli.
- Notifikasi in-app jika sesuai.

Realtime adalah mekanisme sinkronisasi UI, bukan pengganti validasi server. Setelah menerima event, aplikasi tetap harus membaca data sesuai izin RLS.

### 6.7 Supabase Storage

Bucket yang disarankan:
- `product-images` — foto produk.
- `payment-proofs` — bukti transfer.
- `delivery-proofs` — bukti penerimaan.

Keamanan:
- Bukti pembayaran dan bukti penerimaan menggunakan bucket privat.
- Akses berdasarkan role dan kepemilikan pesanan.
- Gunakan signed URL bila diperlukan.
- Batasi MIME type dan ukuran file.
- Jangan membuat seluruh bukti transaksi menjadi public.
- Nama file tidak boleh menjadi dasar otorisasi.

---

## 7. Keamanan

### 7.1 RLS

Aktifkan RLS pada semua tabel yang dapat diakses melalui Data API.

Prinsip policy:
- Pembeli: hanya data miliknya.
- Admin: data operasional sesuai kewenangan.
- Kepala karyawan: pesanan yang masuk ke antrean kerjanya.
- Pengirim: tugas yang ditugaskan kepadanya.
- Role tidak dapat ditentukan dari input bebas pengguna.

### 7.2 Secret dan Environment

- Supabase project URL dan anon/publishable key dapat digunakan di aplikasi klien dengan RLS yang benar.
- `service_role` key dan secret lainnya tidak boleh masuk ke source code atau APK.
- Simpan konfigurasi environment secara terpisah.
- Jangan commit file `.env` berisi secret.
- Gunakan konfigurasi berbeda untuk development dan production jika memungkinkan.

### 7.3 Audit

Catat minimal:
- Aktor.
- Role.
- Aksi.
- Entitas yang berubah.
- Nilai sebelum/sesudah bila relevan.
- Waktu.
- Alasan untuk penolakan/pembatalan.
- Metadata request yang aman dan relevan.

---

## 8. Package Flutter yang Direkomendasikan

| Package | Tujuan | Prioritas |
|---|---|---|
| `supabase_flutter` | Supabase client | Wajib |
| `flutter_riverpod` | State management dan DI | Wajib |
| `go_router` | Navigation | Wajib |
| `freezed_annotation` | Model immutable | Direkomendasikan |
| `freezed` | Code generation model | Dev dependency |
| `json_annotation` | JSON serialization | Direkomendasikan |
| `json_serializable` | JSON code generation | Dev dependency |
| `build_runner` | Code generation runner | Dev dependency |
| `intl` | Format Rupiah/tanggal | Wajib |
| `image_picker` | Ambil gambar | Wajib untuk upload bukti |
| `cached_network_image` | Cache foto jaringan | Direkomendasikan |
| `shared_preferences` | Preferensi sederhana | Opsional |
| `formz` | Validasi form | Direkomendasikan |
| `flutter_lints` | Static analysis | Dev dependency |
| `mocktail` | Mock untuk testing | Dev dependency |

Tambahkan package lain hanya jika ada kebutuhan nyata. Untuk MVP, hindari menumpuk dependency yang fungsinya tumpang tindih.

---

## 9. Notifikasi

Tahap awal:
- Supabase Realtime untuk pembaruan data saat aplikasi aktif.
- Tabel notifikasi untuk menyimpan inbox notifikasi.
- Status baca disimpan di database agar konsisten antar perangkat.

Tahap lanjutan:
- Firebase Cloud Messaging (FCM) untuk push notification.
- Supabase Edge Functions sebagai penghubung event server ke FCM.
- Simpan token perangkat dengan relasi ke pengguna dan perangkat.

Jangan mengandalkan notifikasi lokal sebagai satu-satunya sumber informasi status pesanan.

---

## 10. Strategi Testing

### Unit Test
Uji:
- Perhitungan subtotal dan total.
- Validasi minimum dan kelipatan jumlah.
- Validasi transisi status.
- Aturan pembayaran.
- Perhitungan stok tersedia dan kebutuhan produksi.
- Validasi role pada use case.

### Widget Test
Uji:
- Login dan validasi form.
- Katalog dan detail produk.
- Checkout.
- Tampilan status pesanan.
- Dashboard per role.
- Dialog konfirmasi tindakan penting.

### Integration Test
Uji alur:
1. Pembeli checkout.
2. Admin menyetujui.
3. Kepala karyawan memulai dan menyelesaikan produksi.
4. Admin menugaskan pengirim.
5. Pengirim memulai pengiriman.
6. Pengirim mengunggah bukti dan mengonfirmasi sampai.

### Security Test
Uji:
- Pembeli mencoba membaca pesanan orang lain.
- Pengirim mencoba membuka tugas pengirim lain.
- Kepala karyawan mencoba mengubah pembayaran.
- Pembeli mencoba mengubah role.
- Pengguna mencoba memanggil RPC dengan status tidak valid.
- Pengguna mencoba mengakses file bukti tanpa izin.

### Concurrency Test
Uji dua checkout/persetujuan bersamaan ketika stok terbatas. Pastikan stok tidak dialokasikan melebihi jumlah yang tersedia.

---

## 11. Build dan Release

- Development: Flutter debug build terhubung ke Supabase development.
- Testing: APK internal untuk UAT.
- Production: Flutter release APK atau AAB sesuai kanal distribusi.
- Aktifkan konfigurasi production yang terpisah.
- Pastikan Supabase production memiliki RLS, backup, dan kebijakan storage yang sudah diuji.
- Jangan menganggap APK menyimpan database lokal. Data transaksi utama berada di Supabase dan membutuhkan koneksi internet.

---

## 12. Prinsip Implementasi

1. Feature-first, bukan folder berdasarkan jenis file secara global saja.
2. UI tidak boleh berisi query database dan business logic.
3. Repository menjadi sumber akses data bagi ViewModel.
4. Validasi bisnis kritis dilakukan server-side.
5. RLS adalah lapisan keamanan wajib.
6. Status pesanan dan pembayaran terpisah.
7. Perubahan stok dan status penting bersifat atomik.
8. Semua tindakan sensitif memiliki audit log.
9. Semua list besar menggunakan pagination.
10. Semua layar menangani loading, error, empty, dan success state.
11. Tidak ada secret backend di APK.
12. Package dan API harus mengikuti dokumentasi versi yang benar-benar dipasang.

---

## 13. Referensi Resmi

- Flutter architecture recommendations: https://docs.flutter.dev/app-architecture/recommendations
- Flutter architecture guide: https://docs.flutter.dev/app-architecture/guide
- Supabase Flutter quickstart: https://supabase.com/docs/guides/getting-started/quickstarts/flutter
- Supabase Flutter client installation: https://supabase.com/docs/reference/dart/installing
- Supabase mobile database security: https://supabase.com/kb/faqs/database/mobile-app-database
- Supabase documentation: https://supabase.com/docs
