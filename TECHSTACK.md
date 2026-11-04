# TECHSTACK.md — Teknologi

## Prinsip
Gunakan teknologi stabil, kompatibel, mudah dirawat, dan sesuai kebutuhan. Periksa versi aktual sebelum mengubah dependency. Jangan menambah library tanpa alasan.

## Stack utama
| Lapisan | Teknologi | Fungsi |
|---|---|---|
| Platform | Android | Platform MVP |
| Mobile | Flutter | UI dan aplikasi |
| Bahasa | Dart | Implementasi |
| Auth | Supabase Auth | Identitas dan sesi |
| Database | Supabase PostgreSQL | Data utama |
| Authorization | PostgreSQL RLS | Pembatasan akses |
| Transaksi | SQL function/RPC atau server-side service | Operasi atomik |
| Realtime | Supabase Realtime | Pembaruan terpilih |
| Storage | Supabase Storage | Foto dan file privat |
| Version control | Git | Riwayat kode/migration |

## Flutter
- Gunakan Flutter stable yang kompatibel dengan environment.
- Gunakan Dart null safety.
- Terapkan lint dan formatter.
- Pilih state management dan router setelah memeriksa project aktual.
- Jangan mencampur beberapa pola state management tanpa alasan.
- Pertahankan dependency sesedikit mungkin.

## Supabase
- Auth untuk identitas.
- PostgreSQL sebagai sumber kebenaran.
- RLS untuk otorisasi.
- Migration untuk perubahan skema.
- RPC/function untuk operasi atomik.
- Storage privat untuk file sensitif.
- Realtime hanya bila ada kebutuhan pembaruan langsung.

## Database
- UUID untuk identifier yang sesuai.
- Gunakan tipe numeric/decimal untuk uang, bukan floating point.
- Gunakan integer untuk jumlah lembar.
- Constraint untuk nilai dan relasi.
- Snapshot harga dan alamat pada transaksi.
- Status pesanan dan pembayaran disimpan terpisah.
- Catat migration dalam Git.

## Konfigurasi
- Pisahkan development dan production.
- Jangan commit file environment berisi rahasia.
- Jangan menaruh service-role key di Flutter.
- Publishable/anon key tetap harus dilindungi RLS.
- Dokumentasikan setup lokal tanpa membagikan secret.

## Pengujian
Gunakan `dart format`, `flutter analyze`, `flutter test`, dan integration test bila relevan. Uji migration/RLS pada environment non-production. Uji transaksi dan race condition sebelum rilis.

## Belum diputuskan
State management package, router package, dependency injection, push notification provider, payment gateway, maps/GPS provider, dan analytics/crash reporting. Ajukan rekomendasi berdasarkan kebutuhan lalu tunggu persetujuan sebelum menambah layanan.
