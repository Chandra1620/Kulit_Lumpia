# DESIGN.md

## 1. Arah Desain

Kulit Lumpia adalah aplikasi operasional bisnis. Desain harus membantu pengguna menyelesaikan pekerjaan dengan cepat dan mengurangi salah tekan, bukan sekadar terlihat menarik.

Arah visual:
- Bersih dan fungsional.
- Hangat secukupnya, tidak dekoratif.
- Informasi penting mudah dipindai.
- Komponen konsisten antar-role.
- Fokus pada produk, jumlah, harga, status, alamat, dan tindakan berikutnya.

Jangan menggunakan:
- Gradient sebagai dekorasi.
- Glassmorphism.
- Glow/neon.
- Shadow besar yang tidak memiliki fungsi.
- Animasi berlebihan.
- Emoji sebagai ikon UI.
- Kartu statistik yang hanya mengisi ruang.
- Ilustrasi stok yang tidak membantu tugas.

## 2. Prinsip UX

1. **Task first:** setiap halaman harus memiliki tujuan utama yang jelas.
2. **Status visible:** pengguna harus tahu pesanan sedang berada di tahap apa.
3. **Next action clear:** tombol utama menunjukkan tindakan berikutnya.
4. **Error recoverable:** ketika gagal, jelaskan penyebab dan cara mencoba kembali.
5. **Low cognitive load:** tampilkan informasi sesuai role, jangan menampilkan seluruh data ke semua pengguna.
6. **Consistent terminology:** gunakan istilah status yang sama di seluruh aplikasi.
7. **Trustworthy transaction:** harga, jumlah, pembayaran, dan alamat harus jelas sebelum konfirmasi.

## 3. Visual Direction

Gunakan warna netral sebagai dasar dan satu warna aksen yang terinspirasi dari warna produk/merek. Palet final dapat disesuaikan setelah identitas merek disetujui.

Token awal (bukan kewajiban warna final):

| Token | Penggunaan |
|---|---|
| `background` | Latar halaman |
| `surface` | Panel dan permukaan konten |
| `surface_subtle` | Area sekunder |
| `text_primary` | Teks utama |
| `text_secondary` | Teks pendukung |
| `border` | Garis pemisah |
| `accent` | Aksi utama dan elemen aktif |
| `success` | Keberhasilan |
| `warning` | Perhatian |
| `danger` | Kesalahan/aksi destruktif |
| `info` | Informasi |

Jangan mengandalkan warna saja untuk membedakan status. Sertakan label teks dan, bila perlu, ikon.

## 4. Tipografi

- Gunakan satu keluarga font utama yang mudah dibaca.
- Maksimal gunakan dua keluarga font.
- Hierarki ukuran harus konsisten.
- Angka harga dan kuantitas harus mudah dibaca.
- Hindari terlalu banyak font weight.
- Jangan memakai all caps untuk paragraf atau label panjang.

Hierarki yang disarankan:
- Display: hanya untuk headline penting.
- Heading 1: judul halaman.
- Heading 2: judul bagian.
- Body: konten utama.
- Label: label input dan metadata.
- Caption: informasi tambahan.

## 5. Spacing dan Layout

Gunakan sistem kelipatan 4 atau 8 agar ritme konsisten. Hindari jarak yang berubah-ubah tanpa alasan.

- Beri ruang cukup di antara kelompok informasi.
- Jangan membungkus setiap baris data dalam kartu.
- Gunakan divider untuk memisahkan konten yang berkaitan.
- Gunakan safe area.
- Konten panjang harus dapat discroll.
- Tombol aksi utama mudah dijangkau.
- Hindari horizontal scrolling kecuali benar-benar dibutuhkan.

## 6. Komponen

### Button
- Primary: tindakan utama halaman.
- Secondary: tindakan alternatif.
- Tertiary/text: tindakan ringan.
- Destructive: membatalkan atau tindakan berisiko.

Aturan:
- Label berupa kata kerja yang spesifik.
- Tampilkan loading saat proses berjalan.
- Nonaktifkan tombol saat request sedang diproses.
- Aksi destruktif meminta konfirmasi.

### Form
- Label tetap terlihat.
- Placeholder bukan pengganti label.
- Validasi muncul dekat field.
- Keyboard sesuai jenis input.
- Field Rupiah dan kuantitas memiliki format yang jelas.
- Jangan menghapus input pengguna saat request gagal.

### Status
- Gunakan badge sederhana dengan teks.
- Status pesanan dan pembayaran ditampilkan terpisah.
- Warna status konsisten di semua halaman.
- Jangan membuat status hanya berupa warna tanpa label.

### Product Item
Tampilkan:
- Foto produk.
- Nama produk dan varian.
- Harga per lembar.
- Ketersediaan yang relevan.
- Kontrol kuantitas yang mengikuti minimum dan kelipatan.

### Order Summary
Tampilkan:
- Nomor pesanan.
- Item, varian, dan jumlah.
- Harga satuan.
- Subtotal.
- Ongkir gratis.
- Total.
- Metode dan status pembayaran.
- Alamat penerima.

### Timeline
- Urutkan peristiwa dari awal ke terbaru.
- Tampilkan label, waktu, dan pelaku jika relevan.
- Jangan mengarang timestamp.
- Tampilkan alasan penolakan/pembatalan bila tersedia.

### Dialog
Gunakan dialog untuk:
- Konfirmasi persetujuan/penolakan.
- Konfirmasi pembatalan.
- Konfirmasi penyelesaian produksi.
- Konfirmasi mulai pengiriman.
- Konfirmasi pesanan sampai.

Jangan menggunakan dialog untuk informasi rutin yang lebih tepat ditampilkan di halaman.

## 7. Pola Navigasi per Role

### Pembeli
Navigasi utama yang disarankan:
- Beranda
- Pesanan
- Notifikasi
- Profil

Katalog dan keranjang dapat diakses dari beranda.

### Admin
Navigasi utama:
- Dashboard
- Pesanan
- Produk
- Pengiriman
- Lainnya (pengguna, laporan, audit sesuai hak akses)

Jangan menjejalkan seluruh menu admin ke satu bottom navigation. Gunakan drawer atau halaman menu bila jumlah tujuan bertambah.

### Kepala Karyawan
Navigasi utama:
- Antrean
- Riwayat
- Profil

### Pengirim
Navigasi utama:
- Tugas
- Riwayat
- Profil

## 8. Dashboard

Dashboard harus menjawab pertanyaan kerja, bukan sekadar menampilkan angka.

Admin:
- Berapa pesanan menunggu persetujuan?
- Berapa bukti transfer menunggu verifikasi?
- Berapa pesanan siap ditugaskan?
- Berapa pengiriman yang sedang berjalan?

Kepala karyawan:
- Pesanan apa yang perlu dikerjakan?
- Mana yang sedang diproses?
- Mana yang perlu diselesaikan?

Pengirim:
- Tugas baru apa yang diberikan?
- Pengiriman mana yang sedang berjalan?
- Apa alamat dan kontak penerima?

Pembeli:
- Pesanan aktif saya sedang berada di tahap apa?
- Apa tindakan yang harus saya lakukan, jika ada?

## 9. Empty, Loading, Error, dan Success State

Setiap fitur data harus mendesain empat kondisi:
- Loading: indikator yang proporsional; hindari spinner memenuhi layar untuk operasi kecil.
- Empty: jelaskan bahwa data belum tersedia dan apa langkah berikutnya.
- Error: jelaskan masalah dengan bahasa pengguna dan sediakan retry bila aman.
- Success: konfirmasi tindakan yang benar-benar berhasil.

Jangan menampilkan status sukses sebelum server mengonfirmasi operasi.

## 10. Responsive Behavior

- Desain utama untuk ponsel Android.
- Pertimbangkan layar kecil dan besar.
- Gunakan layout adaptif untuk form dan daftar.
- Jangan mengunci tinggi konten yang dapat bertambah.
- Teks panjang dan alamat harus dapat dibaca tanpa terpotong secara tidak sengaja.
- Uji pada ukuran layar yang berbeda dan skala font sistem.

## 11. Motion

Animasi hanya digunakan jika membantu orientasi atau memberi feedback:
- Transisi halaman sederhana.
- Feedback perubahan status.
- Loading yang tidak mengganggu.
- Expand/collapse detail.

Hindari parallax, animasi dekoratif, shimmer berlebihan, dan transisi yang memperlambat pekerjaan operasional.

## 12. Prinsip Desain Berdasarkan Role

Pembeli membutuhkan kejelasan harga, produk, pembayaran, dan progres.
Admin membutuhkan kepadatan informasi yang terstruktur dan tindakan cepat.
Kepala karyawan membutuhkan antrean yang mudah diprioritaskan.
Pengirim membutuhkan informasi penerima, alamat, dan tindakan pengiriman yang jelas.

Jangan menggunakan satu dashboard generik untuk semua role.
