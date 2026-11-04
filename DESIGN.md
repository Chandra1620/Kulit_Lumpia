# DESIGN.md — Prinsip Desain Produk

## Arah visual
Kulit Lumpia adalah aplikasi operasional usaha, bukan landing page promosi. Desain harus praktis, terpercaya, tenang, dan mudah dipahami pengguna dengan tingkat literasi digital beragam.

Prioritas:
1. Pengguna cepat memahami tindakan berikutnya.
2. Status pesanan mudah dibedakan.
3. Jumlah, harga, alamat, dan tindakan penting mudah ditemukan.
4. Form nyaman digunakan di layar Android.
5. Tidak ada dekorasi tanpa fungsi.

Hindari tampilan dashboard template generik, gradient berlebihan, glassmorphism, blur, glow, ornamen abstrak, animasi looping, dan terlalu banyak kartu.

## Karakter visual
- Bersih, fungsional, dan hangat secukupnya.
- Gunakan permukaan netral dan kontras teks jelas.
- Aksen warna digunakan untuk tindakan utama.
- Gunakan foto produk asli jika tersedia; jangan menyamarkan gambar stok sebagai foto produk.
- Jangan gunakan emoji sebagai ikon navigasi.

## Design tokens
Tetapkan token semantik: `colorBackground`, `colorSurface`, `colorSurfaceSubtle`, `colorTextPrimary`, `colorTextSecondary`, `colorBorder`, `colorPrimary`, `colorOnPrimary`, `colorSuccess`, `colorWarning`, `colorError`, dan `colorInfo`.

Warna brand final menunggu logo/identitas usaha. Jangan menanam warna acak pada setiap widget. Status harus memiliki teks, bukan dibedakan lewat warna saja.

## Tipografi dan layout
- Gunakan maksimal dua keluarga font.
- Buat skala konsisten untuk heading, title, body, label, dan caption.
- Gunakan spacing berbasis kelipatan 4 atau 8.
- Pastikan target sentuh nyaman dan teks tidak terlalu kecil.
- Utamakan layout ponsel Android, termasuk layar kecil dan ukuran teks besar.

## Navigasi per role
**Pembeli:** Beranda/katalog, Pesanan, Profil/Alamat.  
**Admin:** Ringkasan, Pesanan, Produk/Stok, Pembayaran, Pengiriman, Laporan.  
**Kepala Karyawan:** Antrean produksi, Detail kebutuhan, Progres, Riwayat.  
**Kurir:** Tugas aktif, Detail pengiriman, Riwayat.

Menu disesuaikan dengan role. Menyembunyikan menu bukan pengganti otorisasi backend.

## Pola halaman
Gunakan app bar dengan judul jelas. Letakkan informasi terpenting di awal. Filter dekat daftar. Detail pesanan disusun: ringkasan, item, alamat, pembayaran, progres, riwayat, lalu tindakan. Kelompokkan form berdasarkan konteks.

## Komponen
Bangun komponen bersama bila pola benar-benar berulang: tombol, field, product item, order summary, status indicator, empty/error/loading state, confirmation dialog, quantity selector, dan address summary.

## Interaksi
- Tampilkan loading saat request berjalan.
- Cegah submit berulang.
- Konfirmasi tindakan berdampak besar.
- Animasi singkat hanya untuk feedback atau transisi yang membantu.
- Hormati preferensi reduced motion bila tersedia.

## Aksesibilitas
Pastikan kontras, label screen reader, urutan fokus, ukuran target sentuh, dan keyboard tidak menutupi input. Jangan mengandalkan warna sebagai satu-satunya petunjuk.

## Acceptance criteria
Halaman siap ditinjau jika tujuan dan aksi utama jelas, label sesuai bahasa operasional, state loading/empty/error/success dipikirkan, tidak ada dekorasi tanpa fungsi, dan layout diuji pada ukuran Android berbeda.
