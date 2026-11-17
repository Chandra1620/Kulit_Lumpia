# AGENTS.md

## 1. Tujuan Dokumen

Dokumen ini adalah instruksi kerja untuk AI coding agent dan developer yang mengerjakan aplikasi **Kulit Lumpia**. Instruksi di sini melengkapi `PRD.md`, `TECHSTACK.md`, `ARCHITECTURE.md`, `DESIGN.md`, `SECURITY.md`, `STYLEGUIDE.md`, `SKILLS.md`, dan `TASK.md`.

Jika ada konflik:
1. Keputusan bisnis terbaru yang disetujui pemilik produk menjadi sumber kebenaran.
2. `PRD.md` menjadi sumber kebutuhan dan aturan bisnis.
3. `SECURITY.md` menjadi sumber aturan keamanan.
4. `ARCHITECTURE.md` dan `TECHSTACK.md` menjadi sumber keputusan teknis.
5. `DESIGN.md` dan `STYLEGUIDE.md` menjadi sumber keputusan UI/UX.
6. `TASK.md` menjadi urutan implementasi, bukan alasan untuk mengabaikan dokumen lain.

Jangan mengarang keputusan bisnis yang belum ditetapkan. Tandai sebagai `OPEN QUESTION` dan minta keputusan sebelum mengimplementasikan perilaku yang berdampak pada uang, stok, pembayaran, pembatalan, atau hak akses.

## 2. Ringkasan Produk

Kulit Lumpia adalah aplikasi Android untuk operasional penjualan kulit lumpia. Pengguna terdiri dari:
- Pembeli
- Admin
- Kepala Karyawan
- Pengirim

Stack utama:
- Flutter dan Dart
- Supabase Auth
- Supabase PostgreSQL
- Supabase Storage
- Supabase Realtime
- PostgreSQL Functions/RPC untuk transaksi kritis
- Supabase Edge Functions untuk integrasi server-side
- Riverpod
- GoRouter

Aturan bisnis baseline (Terkunci Resmi Stage 0.2):
- Produk memiliki varian dengan Generic Variant Structure (`products` 1-to-many `product_variants`). Atribut: `id`, `product_id`, `name`, `sku`, `price_per_piece`, `is_active` (D-04).
- Harga dihitung per lembar dan disimpan dalam integer/bigint Rupiah, bukan float.
- Minimum pesanan 10 lembar dan jumlah harus kelipatan 10.
- Ongkos kirim gratis (Rp0).
- Pembayaran transfer atau COD; payment gateway belum ada di MVP.
- Bukti transfer wajib diunggah saat checkout; tidak ada auto-cancel timeout pembayaran pada MVP (D-07).
- Pembayaran transfer diverifikasi manual oleh admin; status tidak otomatis lunas saat upload.
- Refund transfer dilakukan manual oleh admin via transfer bank dengan pencatatan lengkap; status pembayaran hanya menjadi `refunded` setelah transfer dicatat (D-03).
- Konfirmasi COD dilakukan 2 tahap: (1) Kurir lapor uang diterima fisik, (2) Admin verifikasi setoran uang kurir -> status `cod_collected`.
- Status pesanan tepat 9: `pending_approval`, `rejected`, `awaiting_production`, `in_production`, `ready_for_delivery`, `assigned_to_courier`, `in_delivery`, `delivered`, `cancelled`. Status `awaiting_courier` dilarang.
- Pembeli hanya boleh membatalkan pesanan secara mandiri saat status `pending_approval` (D-02).
- Admin berwenang membatalkan pesanan setelah persetujuan dengan alasan wajib; sisa produksi masuk alur karantina/pemeriksaan kelayakan oleh Admin/Kepala Karyawan (D-01).
- Admin menugaskan pengirim aktif.
- Pengirim wajib mengunggah foto bukti penerimaan dan menginput nama penerima; catatan opsional (D-06).
- Alamat lengkap rumah diperlukan; koordinat GPS tidak wajib.
- Format nomor pesanan: `ORD-YYYYMMDD-XXXX` (dibuat server-side).
- Registrasi publik HANYA untuk role `buyer`. Akun staf (`admin`, `production_lead`, `courier`) dibuat secara tertutup oleh admin; form registrasi tanpa pilihan role; default role database adalah `buyer` (D-05).

## 3. Cara Memulai Setiap Pekerjaan

Sebelum mengubah kode:
1. Baca dokumen yang relevan dengan pekerjaan.
2. Periksa struktur repository dan pola implementasi yang sudah ada.
3. Periksa `pubspec.yaml`, versi Flutter/Dart, konfigurasi Supabase, dan migration yang tersedia.
4. Cari implementasi yang sudah ada sebelum membuat file atau service baru.
5. Identifikasi dampak terhadap role, RLS, status pesanan, pembayaran, stok, dan file storage.
6. Buat rencana singkat sebelum perubahan lintas fitur.
7. Implementasikan perubahan sekecil mungkin yang memenuhi kebutuhan.
8. Jalankan formatter, analyzer, dan test yang relevan.
9. Laporkan file yang berubah, keputusan yang dibuat, hasil pemeriksaan, serta risiko atau pertanyaan terbuka.

Jangan menimpa pekerjaan yang sudah ada hanya karena pendekatan lain terlihat lebih menarik.

## 4. Aturan Implementasi Wajib

### 4.1 Business Logic
- Jangan menaruh aturan bisnis di widget.
- Jangan menghitung harga final hanya di sisi Flutter.
- Jangan mengizinkan klien mengirim status pesanan arbitrer.
- Validasi jumlah, harga, pembayaran, stok, dan transisi status harus ditegakkan server-side.
- Gunakan PostgreSQL transaction/RPC untuk operasi yang perlu atomik.
- Operasi yang dapat dipanggil ulang harus dirancang idempotent bila relevan.
- Pisahkan status pesanan dari status pembayaran.

### 4.2 Data Access
- UI tidak boleh melakukan query Supabase langsung.
- Akses data melalui repository/data source.
- Jangan membuat duplikasi repository untuk fungsi yang sama.
- Gunakan pagination untuk daftar yang dapat bertambah besar.
- Tangani loading, empty, error, dan success state.
- Jangan menganggap event Realtime sebagai bukti bahwa operasi bisnis berhasil.

### 4.3 Role dan Authorization
- Empat role utama adalah pembeli, admin, kepala karyawan, dan pengirim.
- Route guard hanya mengatur navigasi; bukan pengamanan data.
- RLS harus melindungi data walaupun pengguna memanggil API di luar UI.
- Pengirim hanya mengakses tugas yang ditugaskan kepadanya.
- Kepala karyawan hanya mengakses antrean kerja yang menjadi kewenangannya.
- Pembeli hanya mengakses data miliknya.
- Jangan mempercayai role dari local storage atau input klien.

### 4.4 Database
- Semua perubahan schema harus melalui migration yang tersimpan di version control.
- Jangan melakukan perubahan schema manual di production tanpa migration yang dapat direproduksi.
- Gunakan UUID, foreign key, check constraint, dan index sesuai kebutuhan.
- Simpan nominal Rupiah sebagai integer/bigint, bukan floating point.
- Gunakan `timestamptz`.
- Simpan snapshot harga, nama produk/varian, dan alamat pada transaksi.
- Jangan menghapus histori transaksi untuk menyembunyikan perubahan.

### 4.5 Storage
- Bukti transfer dan bukti pengiriman bukan file publik.
- Validasi ukuran dan tipe file.
- Periksa authorization sebelum memberikan akses file.
- Jangan menggunakan nama file sebagai mekanisme otorisasi.
- Hindari menyimpan URL publik permanen untuk bukti privat.

## 5. Aturan UI/UX

- Ikuti `DESIGN.md` dan `STYLEGUIDE.md`.
- Utamakan keterbacaan, hierarki, dan efisiensi kerja.
- Jangan menambahkan gradient dekoratif, glassmorphism, glow, atau animasi yang tidak membantu tugas.
- Jangan menggunakan emoji sebagai ikon antarmuka.
- Gunakan ikon konsisten dari satu icon set.
- Hindari dashboard penuh kartu statistik yang tidak membantu keputusan.
- Setiap layar harus memiliki loading, empty, error, dan success state yang relevan.
- Aksi destruktif atau berdampak pada transaksi memerlukan konfirmasi.
- Tampilkan alasan kegagalan dan langkah pemulihan yang dapat dilakukan.

## 6. Batasan Perubahan

- Jangan menambah package tanpa kebutuhan yang jelas.
- Jangan mengganti state management, router, atau arsitektur tanpa alasan teknis yang kuat dan persetujuan.
- Jangan membuat abstraksi generik sebelum ada minimal dua kebutuhan nyata yang memerlukannya.
- Jangan menambahkan fitur di luar MVP tanpa persetujuan.
- Jangan mengubah kontrak database dan aplikasi sekaligus tanpa migration dan rencana kompatibilitas.
- Jangan menghapus test untuk membuat pipeline hijau.
- Jangan menonaktifkan RLS atau lint rule untuk menghindari perbaikan.
- Jangan menyimpan secret di source code, dokumentasi, log, atau screenshot.

## 7. Prosedur Sebelum Menyelesaikan Task

Jalankan perintah yang tersedia dan relevan:

```bash
dart format .
flutter analyze
flutter test
```

Untuk perubahan database:
- Validasi migration dari database development yang bersih bila memungkinkan.
- Uji policy RLS dengan setiap role.
- Uji constraint dan transaksi.
- Uji skenario request ganda dan concurrency jika menyentuh stok atau pembayaran.

Jangan mengklaim test berhasil jika belum dijalankan. Jika environment tidak tersedia, jelaskan secara eksplisit.

## 8. Format Laporan Pekerjaan

Setiap penyelesaian task harus melaporkan:
1. Ringkasan perubahan.
2. File yang dibuat/diubah.
3. Aturan bisnis yang terpengaruh.
4. Migration atau perubahan Supabase.
5. Test yang dijalankan dan hasilnya.
6. Risiko, keterbatasan, dan pertanyaan terbuka.

## 9. Prinsip Utama

Lebih baik implementasi kecil yang aman dan dapat diuji daripada banyak fitur yang tampak selesai tetapi aturan bisnisnya tidak konsisten.

Jangan menebak. Periksa kode, baca dokumen, validasi asumsi, lalu implementasikan.
