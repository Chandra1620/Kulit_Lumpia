# TASK.md — Backlog Pengembangan

Status awal seluruh task: **Belum dimulai**. Ubah status hanya berdasarkan pekerjaan yang benar-benar dilakukan.

## Aturan
- Kerjakan satu tahap aktif.
- Jangan coding sebelum dependency dan keputusan bisnis dipahami.
- Catat acceptance criteria dan hasil test.
- Jangan menyatakan selesai hanya karena UI terlihat.

## Tahap 0 — Discovery
- [ ] Periksa repository dan dokumentasi.
- [ ] Konfirmasi nama/foto/variasi produk dan harga.
- [ ] Konfirmasi minimum, maksimum, dan kelipatan pesanan.
- [ ] Konfirmasi jam operasional dan batas order.
- [ ] Konfirmasi area dan biaya pengiriman.
- [ ] Konfirmasi pembatalan dan refund.
- [ ] Konfirmasi proses penerimaan uang COD.
- [ ] Konfirmasi bukti penerimaan barang.
**Selesai jika:** keputusan yang memengaruhi alur inti dan database disetujui.

## Tahap 1 — UX dan desain
- [ ] Petakan alur Pembeli, Admin, Produksi, dan Kurir.
- [ ] Rancang login dan navigasi per role.
- [ ] Rancang halaman inti per role.
- [ ] Tetapkan design token dan komponen.
- [ ] Tinjau pada ukuran Android kecil dan umum.
**Selesai jika:** alur dan rancangan layar disetujui.

## Tahap 2 — Fondasi
- [ ] Periksa Flutter/Dart dan struktur project.
- [ ] Tetapkan dependency berdasarkan kebutuhan.
- [ ] Siapkan konfigurasi environment.
- [ ] Siapkan Supabase development.
- [ ] Pastikan secret tidak masuk repository/client.
- [ ] Pastikan aplikasi dapat dijalankan.

## Tahap 3 — Database dan keamanan
- [ ] Rancang tabel dan relasi.
- [ ] Buat migration.
- [ ] Tambahkan constraint dan indeks.
- [ ] Aktifkan RLS.
- [ ] Buat policy setiap role.
- [ ] Registrasi publik menghasilkan buyer.
- [ ] Siapkan penetapan role staf yang aman.
- [ ] Uji akses diizinkan dan ditolak.

## Tahap 4 — Auth dan navigasi
- [ ] Registrasi pembeli.
- [ ] Login email/password.
- [ ] Logout dan session restore.
- [ ] Reset password.
- [ ] Ambil role dari sumber tepercaya.
- [ ] Routing per role.
- [ ] Uji akses langsung ke halaman role lain.

## Tahap 5 — Pembeli
- [ ] Profil dan alamat.
- [ ] Katalog dan detail produk.
- [ ] Pemilihan kuantitas.
- [ ] Checkout dan ringkasan.
- [ ] Riwayat dan detail pesanan.
- [ ] Tampilan status.

## Tahap 6 — Admin
- [ ] Ringkasan operasional.
- [ ] Daftar/detail pesanan.
- [ ] Persetujuan dan penolakan.
- [ ] Kelola produk dan harga.
- [ ] Kelola stok.
- [ ] Verifikasi transfer.
- [ ] Antrean siap kirim.
- [ ] Penugasan kurir.

## Tahap 7 — Stok dan produksi
- [ ] Hitung available.
- [ ] Alokasi stok atomik.
- [ ] Catat kekurangan produksi.
- [ ] Antrean produksi.
- [ ] Mulai dan perbarui progres.
- [ ] Selesaikan produksi.
- [ ] Rekonsiliasi stok.
- [ ] Uji pesanan bersamaan dan pembatalan.

## Tahap 8 — Kurir
- [ ] Daftar tugas milik kurir.
- [ ] Detail pengiriman.
- [ ] Mulai pengiriman.
- [ ] Laporan kendala.
- [ ] Konfirmasi terkirim.
- [ ] Riwayat.
- [ ] Uji pembatasan akses antar kurir.

## Tahap 9 — Pembayaran dan notifikasi
- [ ] Transfer manual.
- [ ] Bukti transfer di storage privat.
- [ ] Verifikasi admin.
- [ ] Pencatatan COD.
- [ ] Status pembayaran terpisah.
- [ ] Notifikasi sesuai role.
- [ ] Uji akses notifikasi.

## Tahap 10 — QA dan rilis
- [ ] Unit test aturan bisnis.
- [ ] Widget test halaman penting.
- [ ] Test integrasi alur pesanan.
- [ ] Test RLS setiap role.
- [ ] Test konkurensi stok.
- [ ] Test jaringan gagal dan retry.
- [ ] `flutter analyze`.
- [ ] Build release Android.
- [ ] Uji pada perangkat.
- [ ] Panduan operasional dan uji coba terbatas.

## Catatan progres
Untuk setiap tahap catat tanggal, perubahan, file, test dan hasil, kendala, keputusan yang dibutuhkan, serta persetujuan pengguna.
