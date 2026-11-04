# SECURITY.md — Kebijakan Keamanan

## Prinsip
Terapkan least privilege. Setiap pengguna hanya boleh mengakses data dan tindakan minimum sesuai tugasnya.

## Data
- Akun: user ID, email, nama, nomor telepon, role.
- Operasional: produk, harga, stok, produksi, pesanan, pengiriman.
- Transaksi sensitif: alamat lengkap, bukti transfer, catatan pembayaran.
- Rahasia: password, token, service-role key, kredensial layanan.

Jangan mencatat rahasia ke log atau repository.

## Autentikasi
- Gunakan Supabase Auth.
- Tangani sesi, logout, refresh, dan sesi kedaluwarsa.
- Gunakan mekanisme reset password resmi.
- Jangan simpan password plaintext.
- Jangan membuat login palsu berbasis nilai lokal.

## Role
Role: `buyer`, `admin`, `production`, `courier`.
- Registrasi publik hanya membuat `buyer`.
- Pengguna tidak dapat mengubah role sendiri.
- Role staf ditetapkan melalui proses tepercaya.
- Jangan mempercayai role dari request body, local storage, atau parameter navigasi.
- RLS dan validasi server-side wajib.
- Menyembunyikan tombol bukan kontrol keamanan.

## RLS
Aktifkan RLS pada seluruh tabel yang terekspos ke client.
- Buyer hanya mengakses profil, alamat, dan pesanan miliknya.
- Courier hanya mengakses pengiriman yang ditugaskan kepadanya.
- Production hanya mengakses data yang diperlukan untuk produksi.
- Admin memperoleh akses sesuai fungsi administratif.
- Setiap update status dibatasi role, penugasan, dan transisi valid.
- Setiap tabel baru harus memiliki policy sebelum digunakan client.

## Secret
- `service_role` key dilarang berada di Flutter.
- Jangan commit `.env` berisi rahasia.
- Gunakan secret management untuk proses server-side.
- Publishable/anon key tidak menggantikan RLS.
- Jika secret terlanjur ter-commit, rotasi kredensial dan periksa riwayat Git.
- Pisahkan konfigurasi development dan production.

## Validasi server-side
Validasi harga, subtotal, kuantitas, produk aktif, kepemilikan alamat, transisi status, kewenangan aktor, alokasi stok, pembayaran, penugasan kurir, dan penyelesaian pengiriman. Gunakan transaksi atomik dan idempotency untuk operasi yang berisiko duplikasi.

## File
- Bukti transfer disimpan di bucket privat.
- Policy storage mengikuti pemilik dan petugas berwenang.
- Gunakan signed URL berumur terbatas jika diperlukan.
- Validasi ukuran dan tipe file.
- Jangan membuat bukti pembayaran dapat diakses publik.

## Audit trail
Catat aktor, waktu, entitas, perubahan penting, dan alasan untuk persetujuan/penolakan, stok, produksi, pembayaran, penugasan, pengiriman, dan pembatalan. Jangan sediakan edit/hapus riwayat biasa.

## Skenario serangan yang wajib diuji
- Buyer membaca pesanan orang lain.
- Buyer mengubah role menjadi admin.
- Courier membuka tugas courier lain.
- Production memverifikasi pembayaran.
- Client memanipulasi harga/total.
- Kuantitas negatif atau ekstrem.
- Dua checkout mengalokasikan stok yang sama.
- Request diulang setelah timeout.
- Status dilompati.
- Bukti transfer diakses pihak tidak berhak.
- Secret muncul di log atau repository.

## Checklist rilis
- [ ] RLS aktif dan diuji pada semua tabel client-facing.
- [ ] Policy diuji dengan setiap role.
- [ ] Service-role key tidak ada di client/repository.
- [ ] Harga dan total divalidasi di server.
- [ ] Alokasi stok atomik.
- [ ] Transisi status tervalidasi.
- [ ] File privat tidak publik.
- [ ] Audit trail tersedia.
- [ ] Error tidak membocorkan detail internal.
- [ ] Konfigurasi dev/prod terpisah.

Dokumen ini bukan pengganti audit keamanan profesional sebelum penggunaan komersial.
