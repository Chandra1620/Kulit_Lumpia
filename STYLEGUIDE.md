# STYLEGUIDE.md

## 1. Tujuan

Style guide ini mengatur standar visual dan interaksi Kulit Lumpia. Hasil akhir harus terasa seperti produk operasional yang dirancang dengan sengaja: rapi, mudah dipahami, dan tidak dipenuhi ornamen.

Dokumen ini bukan ajakan untuk membuat UI yang ramai atau mengikuti tren visual sementara.

## 2. Karakter Visual

Karakter:
- Praktis.
- Bersih.
- Hangat secukupnya.
- Tegas dalam hierarki.
- Konsisten.
- Mengutamakan konten dan tindakan.

Hindari tampilan template generik yang terdiri dari gradient hero, deretan kartu statistik, sudut terlalu membulat, shadow tebal, dan ikon dekoratif yang tidak memiliki fungsi.

## 3. Aturan Warna

Gunakan semantic color tokens, bukan hard-coded color yang tersebar di widget.

Token minimum:
- `colorBackground`
- `colorSurface`
- `colorSurfaceMuted`
- `colorTextPrimary`
- `colorTextSecondary`
- `colorBorder`
- `colorAccent`
- `colorSuccess`
- `colorWarning`
- `colorDanger`
- `colorInfo`

Aturan:
- Background netral.
- Aksen digunakan secara hemat untuk tindakan utama dan state aktif.
- Warna status konsisten.
- Kontras teks harus memadai.
- Jangan menyampaikan informasi hanya melalui warna.
- Jangan memakai banyak warna aksen yang bersaing.

Nilai hex final ditetapkan di theme setelah identitas merek dikonfirmasi. Jangan mengarang warna brand seolah sudah disetujui.

## 4. Tipografi

- Gunakan satu font utama yang jelas.
- Gunakan ukuran dan weight berdasarkan hierarki.
- Judul halaman lebih menonjol daripada judul bagian.
- Body text nyaman dibaca.
- Caption tidak boleh menjadi tempat menyimpan informasi penting.
- Harga dan jumlah memakai angka yang mudah dipindai.
- Format Rupiah konsisten, contoh `Rp1.000.000`.

Jangan memperkecil teks hanya agar lebih banyak informasi masuk ke satu layar. Atur prioritas konten terlebih dahulu.

## 5. Spacing

Gunakan skala dasar 4 dp:

| Token | Nilai |
|---|---:|
| `space4` | 4 |
| `space8` | 8 |
| `space12` | 12 |
| `space16` | 16 |
| `space20` | 20 |
| `space24` | 24 |
| `space32` | 32 |

Gunakan nilai yang konsisten. Jangan membuat margin acak untuk memperbaiki satu layar tanpa memeriksa komponen terkait.

## 6. Radius, Border, dan Elevation

- Radius kecil untuk input dan kontrol.
- Radius sedang untuk panel atau container penting.
- Hindari radius besar pada semua elemen.
- Border tipis digunakan untuk pemisah dan batas kontrol.
- Elevation hanya ketika ada hierarki lapisan yang nyata.
- Jangan memakai shadow sebagai pengganti spacing atau border.

## 7. Iconography

- Gunakan satu icon set secara konsisten.
- Ikon harus memiliki makna yang mudah dikenali.
- Gunakan ukuran dan stroke yang konsisten.
- Tombol icon-only wajib memiliki tooltip/label aksesibel.
- Jangan menggunakan emoji sebagai ikon navigasi atau aksi.

## 8. Button

- Primary hanya satu untuk tindakan utama dalam satu area.
- Secondary untuk alternatif.
- Text button untuk tindakan ringan.
- Destructive untuk aksi yang berisiko.
- Label harus berupa kata kerja yang spesifik: `Setujui Pesanan`, `Mulai Produksi`, `Selesaikan Produksi`, `Mulai Pengiriman`, `Konfirmasi Sudah Sampai`.
- Tampilkan loading ketika request berjalan.
- Cegah double submission.
- Jangan menampilkan sukses sebelum server mengonfirmasi.

## 9. Form dan Input

- Label terlihat secara permanen.
- Placeholder hanya contoh format.
- Validasi dekat dengan field terkait.
- Tandai field wajib.
- Gunakan input type yang sesuai.
- Input kuantitas hanya menerima bilangan bulat dan memvalidasi minimum 10 serta kelipatan 10.
- Input harga diformat Rupiah tetapi nilai yang dikirim tetap angka integer.
- Pertahankan input ketika terjadi error jaringan.
- Jangan meminta informasi alamat yang tidak dibutuhkan.

## 10. Status dan Badge

Label UI yang disarankan:
- Menunggu Persetujuan
- Ditolak
- Menunggu Produksi
- Sedang Diproses
- Siap Dikirim
- Menunggu Pengirim
- Pengirim Ditugaskan
- Sedang Dikirim
- Sudah Sampai
- Dibatalkan

Status pembayaran ditampilkan terpisah:
- Belum Dibayar
- Menunggu Verifikasi
- Lunas
- Bukti Ditolak
- COD Belum Diterima
- COD Diterima
- Dikembalikan

Jangan menggunakan label `Selesai` untuk kondisi produksi selesai jika barang belum dikirim. Istilah final harus mengikuti state machine di database.

## 11. List dan Data Density

- Gunakan list untuk antrean dan riwayat.
- Prioritaskan nomor pesanan, nama penerima/pembeli, jumlah, status, dan waktu.
- Informasi sekunder dapat berada pada baris kedua.
- Jangan membungkus setiap item dalam kartu jika divider sudah cukup.
- Sediakan filter dan pencarian saat volume data membutuhkannya.
- Gunakan pagination atau infinite scroll yang terkontrol.

## 12. Layout per Role

### Pembeli
- Fokus pada produk, harga, kuantitas, checkout, dan progres pesanan.
- Tampilkan total dan metode pembayaran dengan jelas.
- Jangan tampilkan informasi internal produksi.

### Admin
- Fokus pada antrean yang perlu tindakan.
- Letakkan aksi utama dekat dengan detail yang diperiksa.
- Tampilkan bukti transfer dan ringkasan nominal secara jelas.
- Pisahkan tab/filter berdasarkan status kerja.

### Kepala Karyawan
- Fokus pada daftar pekerjaan dan kuantitas yang harus disiapkan.
- Tampilkan varian dan catatan penting tanpa harus membuka banyak halaman.
- Minta konfirmasi sebelum menyelesaikan pekerjaan.

### Pengirim
- Fokus pada alamat, penerima, nomor kontak, jumlah barang, dan status tugas.
- Tombol mulai dan konfirmasi sampai harus jelas.
- Bukti penerimaan mudah diunggah.
- Jangan menampilkan data pembeli yang tidak diperlukan untuk pengiriman.

## 13. Feedback dan Motion

- Gunakan feedback langsung setelah aksi berhasil.
- Loading tidak boleh menghalangi seluruh aplikasi jika hanya satu komponen yang berubah.
- Animasi singkat dan fungsional.
- Jangan menggunakan animasi dekoratif yang memperlambat tugas.
- Jangan menghilangkan feedback error hanya karena desain ingin terlihat minimal.

## 14. Aksesibilitas

- Area sentuh nyaman untuk jari.
- Kontras cukup.
- Label kontrol dapat dibaca screen reader.
- Ukuran teks mengikuti pengaturan aksesibilitas sistem.
- Jangan mengandalkan warna saja.
- Pastikan konten tidak terpotong pada ukuran font besar.

## 15. Konsistensi Implementasi Flutter

- Simpan theme dan design tokens di satu tempat.
- Buat komponen bersama hanya untuk pola yang benar-benar berulang.
- Jangan membuat widget generik dengan puluhan parameter.
- Hindari duplikasi komponen yang berbeda tipis tanpa alasan.
- Semua halaman menangani loading, error, empty, dan success.
- Jangan mengubah visual satu role tanpa memeriksa konsistensi komponen bersama.

## 16. Review Visual

Sebelum menyatakan UI selesai, periksa:
- Apakah tujuan layar jelas dalam beberapa detik?
- Apakah tindakan utama terlihat?
- Apakah informasi penting terbaca?
- Apakah jarak dan alignment konsisten?
- Apakah tampilan tetap baik pada layar kecil?
- Apakah state kosong/error/loading dirancang?
- Apakah ada dekorasi yang tidak membantu?
- Apakah teks status sama dengan istilah di PRD?
