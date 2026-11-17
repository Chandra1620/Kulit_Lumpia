# TASK.md

## 1. Tujuan

Dokumen ini menjadi urutan kerja implementasi Kulit Lumpia. Task disusun berdasarkan dependensi agar fondasi data dan keamanan tidak dibangun belakangan setelah UI terlanjur bergantung pada asumsi yang salah.

Status task:
- `[ ]` Belum dikerjakan
- `[-]` Sedang dikerjakan
- `[x]` Selesai dan sudah diverifikasi
- `[!]` Terblokir / menunggu keputusan

Jangan menandai task selesai hanya karena kode sudah ditulis. Task selesai setelah kriteria penerimaan dan pemeriksaan relevan terpenuhi.

---

## 2. Stage 0 — Finalisasi Produk

- [x] Tinjau `PRD.md` bersama pemilik produk.
- [x] Finalisasi atribut varian produk (D-04: Generic Variant Structure `name`, `sku`, `price_per_piece`, `is_active`).
- [x] Finalisasi batas pembatalan mandiri pembeli (D-02: HANYA saat `pending_approval`).
- [x] Finalisasi kebijakan refund transfer (D-03: Manual via transfer bank + pencatatan lengkap admin).
- [x] Finalisasi penanganan sisa produksi setelah pembatalan (D-01: Alur karantina/pemeriksaan kelayakan oleh Admin/Kepala Karyawan).
- [x] Finalisasi batas waktu verifikasi transfer (D-07: Bukti transfer wajib di checkout, tidak ada auto-cancel timeout).
- [x] Finalisasi proses pencatatan COD (Aturan 2 tahap: Kurir lapor fisik, Admin verifikasi setoran ke `cod_collected`).
- [x] Finalisasi bukti penerimaan (D-06: Wajib foto + nama penerima barang, catatan opsional).
- [x] Finalisasi role dan prosedur pembuatan akun staf (D-05: Registrasi publik hanya `buyer`, akun staf tertutup oleh admin).

**Exit criteria:** aturan yang memengaruhi transaksi, stok, dan akses telah disetujui resmi oleh Product Owner dan terkunci (Stage 0 Selesai).

## 3. Stage 1 — Project Foundation

- [ ] Buat project Flutter Android.
- [ ] Tetapkan package name dan application ID.
- [ ] Pastikan Flutter/Dart SDK kompatibel.
- [ ] Setup Git repository dan `.gitignore`.
- [ ] Tambahkan dependency minimum.
- [ ] Buat struktur folder feature-first.
- [ ] Setup theme dan design tokens awal.
- [ ] Setup Riverpod.
- [ ] Setup GoRouter.
- [ ] Setup formatter dan `flutter_lints`.
- [ ] Pastikan `flutter analyze` bersih.
- [ ] Pastikan `flutter test` berjalan.

**Exit criteria:** aplikasi dapat dijalankan pada perangkat Android dan fondasi project stabil.

## 4. Stage 2 — Supabase Foundation

- [ ] Buat Supabase project development.
- [ ] Konfigurasikan environment development.
- [ ] Buat migration awal.
- [ ] Buat schema profiles dan role.
- [ ] Buat schema addresses.
- [ ] Buat schema products dan product_variants.
- [ ] Buat schema inventory dan inventory_movements.
- [ ] Buat schema orders dan order_items.
- [ ] Buat schema payments dan payment_verifications.
- [ ] Buat schema production records jika diperlukan.
- [ ] Buat schema delivery_assignments dan delivery_proofs.
- [ ] Buat schema order_status_history.
- [ ] Buat schema notifications.
- [ ] Buat schema activity_logs.
- [ ] Tambahkan FK, unique constraint, check constraint, dan index.
- [ ] Aktifkan RLS untuk tabel yang terekspos.
- [ ] Buat dan uji policy per role.
- [ ] Buat bucket storage dan policy.
- [ ] Buat seed data development.
- [ ] Dokumentasikan ERD dan data dictionary.

**Exit criteria:** schema dapat dibuat ulang dari migration dan akses role telah diuji.

## 5. Stage 3 — Authentication dan Profile

- [ ] Implementasikan login.
- [ ] Implementasikan registrasi pembeli.
- [ ] Implementasikan logout.
- [ ] Implementasikan reset password.
- [ ] Implementasikan session handling.
- [ ] Implementasikan profile repository dan state.
- [ ] Implementasikan role-aware navigation.
- [ ] Implementasikan alur pembuatan akun staf oleh admin.
- [ ] Uji akses tanpa login.
- [ ] Uji manipulasi role dari client.

**Exit criteria:** setiap pengguna masuk ke area yang benar dan tidak dapat menaikkan hak akses sendiri.

## 6. Stage 4 — Master Data dan Katalog

- [ ] Implementasikan daftar produk.
- [ ] Implementasikan detail produk.
- [ ] Implementasikan daftar varian.
- [ ] Implementasikan harga per lembar.
- [ ] Implementasikan ketersediaan.
- [ ] Implementasikan upload foto produk.
- [ ] Implementasikan CRUD produk untuk admin.
- [ ] Implementasikan CRUD varian untuk admin.
- [ ] Implementasikan pencarian/filter jika diperlukan.
- [ ] Uji akses katalog dan manajemen produk berdasarkan role.

**Exit criteria:** katalog menampilkan data dari Supabase dan admin dapat mengelolanya sesuai hak akses.

## 7. Stage 5 — Cart dan Checkout

- [ ] Implementasikan keranjang.
- [ ] Validasi minimum 10 lembar.
- [ ] Validasi kelipatan 10 lembar.
- [ ] Implementasikan alamat pengiriman lengkap.
- [ ] Implementasikan pilihan transfer/COD.
- [ ] Implementasikan upload bukti transfer saat checkout (wajib sebelum pesanan dibuat, tanpa timeout auto-cancel D-07).
- [ ] Implementasikan perhitungan ringkasan harga di UI untuk preview.
- [ ] Implementasikan RPC create order yang menghitung ulang harga di server.
- [ ] Implementasikan nomor pesanan `ORD-YYYYMMDD-XXXX`.
- [ ] Simpan snapshot produk, varian, harga, jumlah, dan alamat.
- [ ] Cegah request checkout ganda.
- [ ] Uji kuantitas tidak valid.
- [ ] Uji perubahan harga saat checkout.
- [ ] Uji kegagalan upload bukti transfer.

**Exit criteria:** pesanan valid dibuat secara konsisten dan total final berasal dari server.

## 8. Stage 6 — Admin Order Review dan Payment

- [ ] Implementasikan dashboard admin.
- [ ] Implementasikan antrean pesanan baru.
- [ ] Implementasikan detail pesanan.
- [ ] Implementasikan review bukti transfer.
- [ ] Implementasikan approve order.
- [ ] Implementasikan reject order dengan alasan.
- [ ] Implementasikan verifikasi transfer.
- [ ] Implementasikan konfirmasi COD tahap 2 (verifikasi setoran uang fisik oleh admin -> cod_collected).
- [ ] Implementasikan pencatatan refund transfer manual oleh admin (nominal, tanggal, referensi, catatan, bukti transfer D-03).
- [ ] Implementasikan histori keputusan admin dan audit log.
- [ ] Uji akses dan transisi status yang tidak sah.

**Exit criteria:** admin dapat memproses pesanan dan pembayaran tanpa mengubah data transaksi secara tidak terlacak.

## 9. Stage 7 — Production Workflow

- [ ] Implementasikan antrean kepala karyawan.
- [ ] Implementasikan detail pekerjaan.
- [ ] Implementasikan mulai produksi.
- [ ] Implementasikan catatan kendala.
- [ ] Implementasikan penyelesaian produksi.
- [ ] Implementasikan validasi jumlah barang siap.
- [ ] Implementasikan status siap dikirim.
- [ ] Implementasikan histori produksi.
- [ ] Uji kepala karyawan tidak dapat mengubah pembayaran.
- [ ] Uji penyelesaian produksi ganda.

**Exit criteria:** kepala karyawan dapat mengelola pekerjaan sesuai pesanan dan menyelesaikannya secara tercatat.

## 10. Stage 8 — Delivery Workflow

- [ ] Implementasikan antrean pesanan siap ditugaskan.
- [ ] Implementasikan daftar pengirim aktif.
- [ ] Implementasikan penugasan pengirim oleh admin.
- [ ] Implementasikan daftar tugas pengirim.
- [ ] Implementasikan detail alamat dan penerima.
- [ ] Implementasikan mulai pengiriman.
- [ ] Implementasikan upload bukti penerimaan (foto dan nama penerima wajib, catatan opsional D-06).
- [ ] Implementasikan konfirmasi sudah sampai (`delivered`).
- [ ] Implementasikan riwayat pengiriman.
- [ ] Uji pengirim tidak dapat mengakses tugas pengirim lain.
- [ ] Uji konfirmasi tanpa foto dan nama penerima ditolak.

**Exit criteria:** alur penugasan sampai barang diterima berjalan dan memiliki bukti.

## 11. Stage 9 — Notifications dan Realtime

- [ ] Buat tabel/inbox notifikasi.
- [ ] Implementasikan notifikasi pesanan baru.
- [ ] Implementasikan notifikasi persetujuan/penolakan.
- [ ] Implementasikan notifikasi antrean produksi.
- [ ] Implementasikan notifikasi tugas pengiriman.
- [ ] Implementasikan notifikasi perubahan status pembeli.
- [ ] Implementasikan status baca yang tersimpan di server.
- [ ] Implementasikan Realtime subscription yang dibatasi.
- [ ] Uji event duplikat dan reconnect.
- [ ] Evaluasi FCM untuk push notification.

**Exit criteria:** notifikasi relevan diterima role yang benar dan status baca konsisten antar perangkat.

## 12. Stage 10 — Reporting dan Operational Polish

- [ ] Dashboard ringkas per role.
- [ ] Filter pesanan berdasarkan status dan rentang tanggal.
- [ ] Riwayat transaksi.
- [ ] Laporan dasar penjualan.
- [ ] Laporan produksi.
- [ ] Laporan pengiriman.
- [ ] Audit log viewer untuk admin.
- [ ] Pagination pada daftar besar.
- [ ] Optimasi gambar dan query.
- [ ] Perbaiki empty/error/loading states.

**Exit criteria:** operasional harian dapat dipantau tanpa membuka database secara manual.

## 13. Stage 11 — Quality Assurance

- [ ] Unit test domain rules.
- [ ] Unit test perhitungan Rupiah.
- [ ] Unit test validasi kuantitas.
- [ ] Unit test state transition.
- [ ] Widget test autentikasi.
- [ ] Widget test katalog dan checkout.
- [ ] Widget test dashboard per role.
- [ ] Integration test checkout sampai delivered.
- [ ] RLS test seluruh role.
- [ ] Storage policy test.
- [ ] Concurrency test alokasi stok.
- [ ] Test request ganda.
- [ ] Test sesi kedaluwarsa.
- [ ] Test koneksi terputus.
- [ ] UAT pembeli.
- [ ] UAT admin.
- [ ] UAT kepala karyawan.
- [ ] UAT pengirim.

**Exit criteria:** seluruh alur kritis dan kontrol keamanan lulus.

## 14. Stage 12 — Release

- [ ] Siapkan Supabase production.
- [ ] Terapkan migration production yang telah diuji.
- [ ] Periksa RLS dan Storage policy production.
- [ ] Pastikan tidak ada secret server di APK.
- [ ] Konfigurasikan application ID, app name, icon, dan version.
- [ ] Build APK internal.
- [ ] Uji APK pada perangkat fisik.
- [ ] Build release APK/AAB sesuai kanal distribusi.
- [ ] Siapkan backup dan prosedur pemulihan.
- [ ] Siapkan panduan admin dan staf.
- [ ] Rilis bertahap dan pantau error.

**Exit criteria:** build release dapat dipasang, login, melakukan transaksi, dan menjalankan alur operasional dengan backend production.

## 15. Prioritas MVP

Urutan prioritas:
1. Finalisasi aturan bisnis.
2. Database, migration, RLS, dan storage.
3. Auth dan role.
4. Katalog dan varian.
5. Checkout dan pembayaran.
6. Admin approval.
7. Produksi.
8. Penugasan dan pengiriman.
9. Histori dan notifikasi.
10. QA dan release.

Jangan memulai animasi, dashboard analitik kompleks, GPS tracking, voucher, atau fitur sekunder sebelum alur order sampai delivered stabil.

## 16. Template Task Baru

```markdown
### [ID] Nama Task

**Status:** [ ]  
**Prioritas:** P0 / P1 / P2  
**Feature:**  
**Tujuan:**  

**Ruang lingkup:**
- 

**Di luar ruang lingkup:**
- 

**Acceptance criteria:**
- [ ] 
- [ ] 

**Security/data impact:**
- 

**Tests:**
- [ ] 

**Dependencies:**
- 
```

## 17. Definition of Done

Task hanya boleh ditandai `[x]` jika:
- Acceptance criteria terpenuhi.
- Implementasi mengikuti dokumen arsitektur dan keamanan.
- Test relevan dijalankan.
- Tidak ada error analyzer yang belum dijelaskan.
- Migration dan policy ikut diperbarui jika schema berubah.
- Dokumentasi diperbarui jika keputusan atau kontrak berubah.
- Tidak ada secret yang masuk repository.
- Hasil pekerjaan dilaporkan secara jujur.
