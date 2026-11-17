# SKILLS.md

## 1. Tujuan

Dokumen ini mendefinisikan kompetensi teknis yang diperlukan untuk mengembangkan dan memelihara Kulit Lumpia. Dokumen ini juga membantu AI coding agent memilih pendekatan yang tepat dan mengetahui kapan harus memeriksa dokumentasi resmi.

## 2. Skill Utama

| Area | Kompetensi | Kebutuhan |
|---|---|---|
| Dart | Null safety, async/await, collections, error handling | Wajib |
| Flutter | Widget composition, lifecycle, forms, navigation | Wajib |
| Riverpod | Provider, Notifier, AsyncValue, dependency injection | Wajib |
| GoRouter | Route configuration, redirect, nested navigation | Wajib |
| Supabase | Auth, Data API, Storage, Realtime | Wajib |
| PostgreSQL | Schema, constraints, index, transaction, function | Wajib |
| RLS | Policy berbasis role, ownership, assignment | Wajib |
| Testing | Unit, widget, integration, database/RLS test | Wajib |
| Git | Branch, commit, merge, review | Wajib |
| UI/UX | Mobile interaction, form, loading/error/empty states | Wajib |
| Security | Secret handling, authorization, input validation | Wajib |
| CI/CD | Analyze, test, build APK/AAB | Direkomendasikan |

## 3. Dart dan Flutter

Developer/agent harus mampu:
- Menulis Dart null-safe.
- Memahami Future, Stream, async/await.
- Membuat widget kecil dengan tanggung jawab jelas.
- Memisahkan widget presentasional dari state logic.
- Mengelola form dan validasi.
- Menangani lifecycle dan disposal.
- Memahami responsive layout dan keyboard behavior.
- Menggunakan formatter dan analyzer.

Hindari:
- Widget raksasa.
- `dynamic` tanpa alasan.
- `BuildContext` digunakan setelah async gap tanpa pemeriksaan yang sesuai.
- Business logic di `build()`.
- Catch error lalu mengabaikannya.

## 4. Riverpod

Wajib memahami:
- Provider dan dependency injection.
- Notifier/AsyncNotifier sesuai kebutuhan.
- State immutable.
- Async loading/error/data.
- Provider invalidation dan lifecycle.
- Testing provider.

Aturan:
- Jangan memakai global mutable state.
- Jangan memanggil Supabase dari widget.
- Jangan membuat provider yang menjadi tempat semua logika.
- Pilih provider berdasarkan jenis state, bukan mengikuti tren.

## 5. GoRouter

Wajib memahami:
- Route declaration.
- Redirect berbasis sesi.
- Role-aware navigation.
- Nested route bila dibutuhkan.
- Error dan unknown route.

Route guard tidak menggantikan RLS.

## 6. Supabase dan PostgreSQL

Developer/agent harus mampu:
- Membuat schema relasional.
- Menentukan PK/FK dan constraint.
- Membuat migration.
- Menulis query yang efisien.
- Membuat function/RPC untuk transaksi kritis.
- Mengaktifkan dan menguji RLS.
- Menggunakan Auth UID secara aman.
- Mengatur bucket dan Storage policy.
- Menggunakan Realtime secara terukur.
- Memahami transaction dan concurrency.

Operasi stok, checkout, pembayaran, dan perubahan status tidak boleh mengandalkan validasi Flutter saja.

## 7. Domain Knowledge

Pahami alur bisnis dan aturan yang telah dikunci pada Stage 0.2:
1. Pembeli membuat pesanan (minimum 10, kelipatan 10, upload bukti transfer jika transfer, pembatalan mandiri hanya saat `pending_approval` D-02).
2. Admin meninjau dan menyetujui/menolak pesanan; sisa produksi pesanan batal wajib melalui alur karantina/pemeriksaan kelayakan (D-01).
3. Kepala karyawan memproses dan menyelesaikan produksi (mengubah status ke `ready_for_delivery`).
4. Admin menugaskan pengirim aktif (status beralih ke `assigned_to_courier`).
5. Pengirim memulai pengiriman (`in_delivery`).
6. Pengirim mengunggah bukti penerimaan (foto dan nama penerima wajib D-06), lalu mengonfirmasi barang sampai (`delivered`).
7. Pembayaran COD diselesaikan melalui 2 tahap: kurir lapor fisik (tahap 1), admin verifikasi setoran ke `cod_collected` (tahap 2). Refund transfer manual dicatat oleh admin (D-03).

Pahami juga perbedaan tegas:
- Status pesanan (9 status resmi: `pending_approval`, `rejected`, `awaiting_production`, `in_production`, `ready_for_delivery`, `assigned_to_courier`, `in_delivery`, `delivered`, `cancelled`). Status `awaiting_courier` dilarang.
- Status pembayaran (`unpaid`, `proof_submitted`, `paid`, `payment_rejected`, `cod_pending`, `cod_collected`, `refunded`).
- Metode pembayaran (`bank_transfer`, `cod`).
- Status produksi dan penugasan pengiriman.

Jangan mencampur seluruh dimensi menjadi satu enum status.

## 8. Testing dan Quality

Harus mampu menulis:
- Unit test untuk perhitungan dan aturan.
- Widget test untuk interaksi layar.
- Integration test untuk alur end-to-end.
- RLS test untuk setiap role.
- Concurrency test untuk alokasi stok.
- Regression test untuk bug yang pernah ditemukan.

Jangan hanya menguji happy path. Uji juga:
- Input tidak valid.
- Sesi habis.
- Jaringan terputus.
- Request ganda.
- Role tidak berhak.
- Stok tidak cukup.
- Bukti file gagal diunggah.
- Status sudah berubah oleh pengguna lain.

## 9. UI/UX dan Visual Craft

Wajib mampu:
- Menyusun hierarki informasi.
- Merancang form yang mudah digunakan.
- Menampilkan status dengan jelas.
- Mendesain empty/loading/error/success state.
- Menghindari dekorasi tanpa fungsi.
- Menjaga konsistensi spacing, typography, dan komponen.
- Mempertimbangkan aksesibilitas dan ukuran layar.

Acuan utama adalah `DESIGN.md` dan `STYLEGUIDE.md`.

## 10. Dokumentasi dan Referensi

Utamakan dokumentasi resmi dan versi yang sesuai dengan dependency project:
- Flutter: https://docs.flutter.dev/
- Dart: https://dart.dev/guides
- Riverpod: https://riverpod.dev/
- GoRouter: https://pub.dev/packages/go_router
- Supabase: https://supabase.com/docs
- PostgreSQL: https://www.postgresql.org/docs/

Jangan menganggap contoh API dari artikel lama masih berlaku. Periksa versi package di `pubspec.lock` dan dokumentasi versi terkait.

## 11. Kapan Harus Meminta Review

Minta review sebelum merge jika perubahan:
- Mengubah schema atau RLS.
- Mengubah perhitungan harga atau pembayaran.
- Mengubah alokasi stok.
- Mengubah transisi status.
- Mengubah role atau permission.
- Menambah integrasi pihak ketiga.
- Mengubah cara menyimpan atau mengakses file privat.
- Mengubah konfigurasi production.

## 12. Definition of Competent Delivery

Pekerjaan dianggap memenuhi standar bila:
- Kebutuhan dapat ditelusuri ke PRD/task.
- Implementasi mengikuti arsitektur.
- Aturan bisnis divalidasi di tempat yang tepat.
- Keamanan diuji, bukan hanya diasumsikan.
- Test relevan lulus.
- Tidak ada secret yang bocor.
- Dokumentasi diperbarui bila kontrak berubah.
- Laporan pekerjaan menyebutkan hasil dan keterbatasan secara jujur.
