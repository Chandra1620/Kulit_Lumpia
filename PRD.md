# PRODUCT REQUIREMENTS DOCUMENT (PRD)

# Aplikasi Kulit Lumpia

**Versi:** 1.0\
**Tanggal:** 2 November 2026\
**Platform:** Android\
**Frontend:** Flutter (Dart)\
**Backend dan Database:** Supabase (PostgreSQL, Auth, Row Level
Security, Realtime sesuai kebutuhan)\
**Status Dokumen:** Acuan utama pengembangan

------------------------------------------------------------------------

## 1. Ringkasan Produk

Kulit Lumpia adalah aplikasi Android untuk mengelola proses penjualan
dan distribusi kulit lumpia. Aplikasi menghubungkan pembeli, admin,
kepala karyawan/produksi, dan kurir dalam satu alur kerja terintegrasi.

Aplikasi menangani proses dari pembeli melihat produk dan membuat
pesanan, admin menyetujui pesanan, bagian produksi memenuhi kekurangan
stok, admin menetapkan kurir, hingga kurir mengantarkan pesanan kepada
pembeli.

Aplikasi menggunakan sistem persediaan hybrid, yaitu menggabungkan stok
produk siap jual dengan produksi berdasarkan pesanan (make-to-order).

## 2. Latar Belakang dan Masalah

Pengelolaan pesanan secara manual berisiko menyebabkan: - Pesanan
terlewat atau tercatat lebih dari satu kali. - Informasi stok tidak
sesuai dengan kondisi sebenarnya. - Kesulitan menentukan jumlah produk
yang harus diproduksi. - Informasi progres pesanan tidak tersampaikan
dengan baik. - Penugasan kurir dan status pengiriman sulit dipantau. -
Riwayat pembayaran dan transaksi tidak terdokumentasi secara konsisten.

Kulit Lumpia dikembangkan untuk menyatukan proses tersebut, mengurangi
pencatatan berulang, dan menyediakan informasi yang dapat diakses sesuai
tanggung jawab setiap pengguna.

## 3. Tujuan Produk

1.  Memudahkan pembeli melakukan pemesanan kulit lumpia melalui Android.
2.  Membantu admin mengelola pesanan, produk, stok, pembayaran, dan
    pengiriman.
3.  Membantu kepala karyawan mengelola kebutuhan dan progres produksi.
4.  Membantu kurir melihat tugas dan memperbarui status pengiriman.
5.  Menyediakan informasi status pesanan yang konsisten dari awal hingga
    selesai.
6.  Mengurangi risiko kesalahan alokasi stok dan pencatatan transaksi.
7.  Menyediakan riwayat aktivitas sebagai dasar pelacakan dan evaluasi
    operasional.

## 4. Ruang Lingkup

### 4.1 Termasuk dalam MVP

-   Aplikasi Android menggunakan Flutter.
-   Login dan autentikasi menggunakan Supabase Auth.
-   Empat role: Pembeli, Admin, Kepala Karyawan/Produksi, dan Kurir.
-   Profil pengguna dan alamat pengiriman.
-   Katalog produk dan harga per lembar.
-   Keranjang/checkout dan pembuatan pesanan.
-   Persetujuan atau penolakan pesanan oleh admin.
-   Pengelolaan stok siap jual dan kebutuhan produksi.
-   Pencatatan progres dan penyelesaian produksi.
-   Penetapan kurir oleh admin.
-   Pembaruan status pengiriman oleh kurir.
-   Pembayaran transfer dengan verifikasi manual admin dan pembayaran
    COD.
-   Riwayat status pesanan.
-   Notifikasi dalam aplikasi dan pembaruan data sesuai kebutuhan.
-   Dashboard yang berbeda berdasarkan role.

### 4.2 Tidak termasuk MVP / Tahap Lanjutan

-   Integrasi payment gateway otomatis.
-   Pelacakan GPS kurir secara real-time.
-   Optimasi rute pengiriman.
-   Aplikasi iOS.
-   Integrasi marketplace atau platform eksternal.
-   Program loyalitas, voucher, dan referral.
-   Prediksi kebutuhan stok berbasis machine learning.

Fitur di luar MVP tidak boleh dibuat secara otomatis tanpa persetujuan.

## 5. Platform dan Teknologi

  -----------------------------------------------------------------------
  Bagian                              Teknologi
  ----------------------------------- -----------------------------------
  Platform                            Android

  Frontend                            Flutter dan Dart

  Autentikasi                         Supabase Auth

  Database                            Supabase PostgreSQL

  Otorisasi data                      Supabase Row Level Security (RLS)

  Pembaruan data                      Supabase Realtime bila diperlukan

  Backend transaksi                   PostgreSQL function/RPC atau
                                      mekanisme server-side yang aman

  Version control                     Git
  -----------------------------------------------------------------------

Ketentuan: - Gunakan versi dependency yang kompatibel dan stabil pada
saat implementasi. - Jangan menaruh `service_role` key atau rahasia
backend di aplikasi Flutter. - Supabase anon/publishable key boleh
digunakan di aplikasi bersama RLS yang benar. - Operasi sensitif harus
divalidasi di backend/database, bukan hanya di UI.

## 6. Pengguna dan Hak Akses

### 6.1 Pembeli

Pembeli dapat: - Registrasi dan login. - Mengelola profil dan alamat
pengiriman. - Melihat katalog produk, harga, dan informasi
ketersediaan. - Membuat pesanan dan memilih jumlah dalam satuan
lembar. - Memilih metode pembayaran transfer atau COD. - Mengunggah
bukti transfer jika metode transfer digunakan. - Melihat detail dan
riwayat pesanan. - Melihat status pembayaran dan status pesanan. -
Menerima notifikasi terkait pesanan.

Pembeli tidak dapat: - Menyetujui atau menolak pesanan. - Mengubah harga
produk. - Mengubah stok. - Mengubah status produksi atau pengiriman. -
Melihat pesanan milik pembeli lain.

### 6.2 Admin

Admin dapat: - Melihat ringkasan operasional. - Melihat, memeriksa,
menyetujui, atau menolak pesanan. - Memberikan alasan penolakan. -
Mengelola produk dan harga. - Melihat serta mengelola stok sesuai aturan
bisnis. - Memverifikasi pembayaran transfer. - Melihat antrean pesanan
siap dikirim. - Menetapkan kurir untuk pesanan. - Melihat data pembeli
dan riwayat pesanan sesuai kebutuhan operasional. - Melihat laporan dan
riwayat aktivitas.

Admin tidak boleh memanipulasi riwayat transaksi tanpa jejak audit.
Perubahan sensitif harus dicatat.

### 6.3 Kepala Karyawan/Produksi

Kepala karyawan dapat: - Melihat pesanan yang telah disetujui dan
memerlukan pemenuhan. - Melihat jumlah stok yang dialokasikan dan jumlah
yang harus diproduksi. - Memulai proses produksi. - Memperbarui progres
produksi. - Menandai produksi selesai. - Melihat riwayat produksi yang
menjadi tanggung jawabnya.

Kepala karyawan tidak dapat: - Menyetujui atau menolak pesanan
pembeli. - Mengubah harga produk. - Memverifikasi pembayaran. -
Menetapkan kurir. - Mengakses fungsi admin yang tidak terkait produksi.

### 6.4 Kurir

Kurir dapat: - Melihat daftar pengiriman yang ditugaskan kepadanya. -
Melihat detail pesanan dan alamat tujuan yang diperlukan untuk
pengiriman. - Menandai pesanan mulai dikirim. - Menandai pesanan telah
diterima. - Melaporkan kendala pengiriman beserta keterangan.

Kurir tidak dapat: - Melihat seluruh data pesanan yang tidak ditugaskan
kepadanya. - Mengubah jumlah atau harga pesanan. - Mengubah data stok
atau produksi. - Menetapkan tugas kurir lain. - Memverifikasi pembayaran
transfer.

### 6.5 Ketentuan Role

-   Setiap akun memiliki role yang ditetapkan secara aman.
-   Registrasi publik hanya membuat akun Pembeli.
-   Role Admin, Kepala Karyawan, dan Kurir hanya dapat diberikan oleh
    proses administratif yang berwenang.
-   Role tidak boleh ditentukan dari pilihan bebas pada halaman login
    atau registrasi.
-   Semua pemeriksaan hak akses wajib dilakukan di backend melalui RLS
    dan validasi server-side. Menyembunyikan tombol di Flutter saja
    tidak cukup.

## 7. Alur Bisnis Utama

### 7.1 Alur Pesanan

1.  Pembeli login.
2.  Pembeli memilih produk dan jumlah lembar.
3.  Pembeli memilih alamat pengiriman.
4.  Pembeli memilih metode pembayaran.
5.  Sistem menghitung total berdasarkan harga yang berlaku di server.
6.  Pembeli mengirim pesanan.
7.  Sistem menyimpan pesanan dengan status `pending_approval`.
8.  Admin memeriksa pesanan.
9.  Admin menyetujui atau menolak pesanan.
10. Jika disetujui, sistem memproses kebutuhan stok dan produksi.
11. Kepala karyawan menyelesaikan kebutuhan produksi.
12. Setelah seluruh kuantitas siap, pesanan berstatus siap dikirim.
13. Admin menetapkan kurir.
14. Kurir memulai pengiriman.
15. Kurir menandai pesanan telah diterima.
16. Pembeli dapat melihat status akhir dan riwayat pesanan.

### 7.2 Alur Penolakan

-   Admin dapat menolak pesanan yang belum disetujui.
-   Alasan penolakan wajib dicatat.
-   Pembeli dapat melihat alasan penolakan.
-   Pesanan yang ditolak tidak boleh masuk ke antrean produksi atau
    pengiriman.

### 7.3 Alur Pembatalan

Aturan pembatalan perlu diterapkan secara konsisten: - Pembeli dapat
mengajukan pembatalan sebelum pesanan diproses, sesuai kebijakan
operasional. - Setelah pesanan mulai diproduksi atau disiapkan,
pembatalan memerlukan keputusan admin. - Pembatalan harus
memperhitungkan stok yang sudah di-reserve, produksi yang sudah
berjalan, dan pembayaran yang sudah diterima. - Setiap pembatalan harus
memiliki alasan dan riwayat.

## 8. Status Pesanan dan Pembayaran

Status operasional pesanan dan status pembayaran adalah dua hal yang
berbeda dan harus disimpan terpisah.

### 8.1 Status Operasional Pesanan

  Status                  Arti
  ----------------------- --------------------------------
  `pending_approval`      Menunggu pemeriksaan admin
  `rejected`              Ditolak admin
  `approved`              Disetujui admin
  `processing`            Sedang dipenuhi/diproduksi
  `ready_to_ship`         Seluruh kuantitas siap dikirim
  `assigned_to_courier`   Kurir telah ditetapkan
  `in_delivery`           Sedang dikirim
  `delivery_issue`        Ada kendala pengiriman
  `delivered`             Pesanan telah diterima
  `cancelled`             Pesanan dibatalkan

Perubahan status hanya boleh dilakukan melalui transisi yang diizinkan.
Contoh: pesanan tidak boleh langsung berubah dari `pending_approval`
menjadi `delivered`.

### 8.2 Status Pembayaran

Status pembayaran yang disiapkan: - `unpaid` - `pending_verification` -
`partially_paid` - `paid` - `failed` - `refunded` - `partially_refunded`

Status pembayaran tidak boleh otomatis dianggap lunas hanya karena
pembeli mengunggah bukti transfer.

### 8.3 Metode Pembayaran

**Transfer bank** - Pembeli memilih transfer. - Sistem menampilkan
instruksi pembayaran yang dikonfigurasi admin. - Pembeli dapat
mengunggah bukti pembayaran. - Admin memeriksa dan menyetujui atau
menolak bukti. - Status pembayaran berubah berdasarkan hasil verifikasi.

**COD** - Pembeli memilih COD saat checkout. - Pembayaran dicatat sesuai
kebijakan ketika uang diterima. - Sistem harus mencatat siapa yang
mengonfirmasi penerimaan pembayaran dan kapan. - Detail proses
penerimaan uang COD perlu ditetapkan dalam aturan operasional sebelum
rilis.

## 9. Produk, Harga, dan Kuantitas

-   Produk yang dijual adalah kulit lumpia.
-   Satuan harga adalah **per lembar**.
-   Jumlah pesanan menggunakan bilangan bulat lembar; nilai pecahan
    tidak diperbolehkan.
-   Harga produk dikelola admin.
-   Total pesanan dihitung dan divalidasi di backend.
-   Setiap item pesanan menyimpan snapshot nama produk, harga per
    lembar, kuantitas, dan subtotal pada saat pesanan dibuat.
-   Perubahan harga produk tidak boleh mengubah transaksi lama.
-   Aturan minimal pemesanan, maksimal pemesanan, dan kelipatan
    pembelian harus dikonfirmasi pemilik usaha sebelum diterapkan.

## 10. Persediaan Hybrid dan Produksi

Aplikasi menggunakan dua sumber pemenuhan: 1. Stok siap jual. 2.
Produksi berdasarkan kekurangan stok.

### 10.1 Konsep Stok

Gunakan konsep: - `on_hand`: stok fisik yang tercatat. - `reserved`:
stok yang telah dialokasikan untuk pesanan dan belum
dikeluarkan/dipenuhi. - `available`: stok yang masih dapat dialokasikan.

Rumus:

`available = on_hand - reserved`

### 10.2 Contoh Alokasi

Jika pesanan 1.000 lembar dan stok tersedia 300 lembar: - 300 lembar
dialokasikan dari stok. - 700 lembar menjadi kebutuhan produksi. -
Pesanan baru dapat dianggap siap dikirim jika seluruh 1.000 lembar telah
siap.

### 10.3 Ketentuan Keamanan Stok

-   Alokasi stok harus dilakukan secara atomik menggunakan transaksi
    database atau fungsi RPC yang aman.
-   Cegah dua pesanan mengalokasikan stok yang sama.
-   Stok tidak boleh negatif.
-   Perubahan stok harus memiliki alasan dan jejak aktivitas.
-   Pembatalan harus melepaskan reservasi yang masih berlaku.
-   Penyelesaian produksi harus memperbarui catatan produksi dan
    persediaan secara konsisten.
-   Jangan menganggap pesanan siap dikirim hanya karena sebagian produk
    sudah tersedia.

## 11. Modul dan Kebutuhan Fungsional

### 11.1 Autentikasi

-   Registrasi pembeli.
-   Login menggunakan email dan password.
-   Logout.
-   Pemeriksaan sesi saat aplikasi dibuka.
-   Pemulihan password sesuai dukungan Supabase Auth.
-   Pengambilan role pengguna dari sumber data yang terlindungi.
-   Pengalihan ke dashboard sesuai role.
-   Penanganan akun nonaktif atau role tidak valid.

### 11.2 Profil dan Alamat

-   Pembeli dapat melihat dan mengubah data profil yang diizinkan.
-   Pembeli dapat menambah, mengubah, dan menghapus alamat.
-   Pembeli dapat memilih alamat utama.
-   Saat checkout, alamat disalin sebagai snapshot ke pesanan agar
    riwayat transaksi tetap akurat.

### 11.3 Katalog Produk

-   Menampilkan produk aktif.
-   Menampilkan nama, deskripsi, foto jika tersedia, harga per lembar,
    dan informasi ketersediaan.
-   Admin dapat menambah, mengubah, dan menonaktifkan produk.
-   Produk yang sudah digunakan pada transaksi lama tidak boleh
    menghilangkan histori item pesanan.

### 11.4 Pesanan

-   Pembeli membuat pesanan.
-   Admin memeriksa pesanan.
-   Sistem menyimpan item dan snapshot harga.
-   Sistem menghitung total di backend.
-   Sistem menyimpan riwayat status.
-   Pembeli melihat daftar dan detail pesanan.
-   Sistem mencegah duplikasi transaksi akibat pengiriman request
    berulang.

### 11.5 Produksi

-   Kepala karyawan melihat antrean produksi.
-   Sistem menunjukkan kuantitas dari stok dan kuantitas yang harus
    diproduksi.
-   Kepala karyawan memulai dan menyelesaikan produksi.
-   Progres produksi tersimpan.
-   Produksi yang selesai harus tervalidasi sebelum pesanan masuk
    antrean pengiriman.

### 11.6 Pengiriman

-   Admin melihat pesanan siap dikirim.
-   Admin memilih kurir aktif.
-   Kurir hanya melihat tugas miliknya.
-   Kurir memperbarui status pengiriman.
-   Kendala pengiriman dapat dicatat.
-   Riwayat pengiriman tersimpan.

### 11.7 Notifikasi

Notifikasi dalam aplikasi dapat diberikan untuk: - Pesanan berhasil
dibuat. - Pesanan disetujui atau ditolak. - Pesanan mulai diproses. -
Produksi selesai. - Kurir ditetapkan. - Pesanan sedang dikirim. -
Pesanan telah diterima. - Perubahan pembayaran.

Notifikasi harus terkait dengan pengguna yang berhak menerimanya.
Supabase Realtime dapat digunakan untuk pembaruan tampilan, tetapi bukan
pengganti penyimpanan status di database.

### 11.8 Dashboard dan Laporan

Dashboard menampilkan ringkasan yang relevan dengan role: - Pembeli:
pesanan aktif dan riwayat. - Admin: pesanan menunggu persetujuan, proses
produksi, siap dikirim, pengiriman aktif, pembayaran yang perlu
diverifikasi. - Kepala karyawan: antrean produksi dan progres. - Kurir:
tugas pengiriman aktif dan riwayat tugas.

Laporan lanjutan dapat mencakup jumlah pesanan, produk terjual,
kebutuhan produksi, pembayaran, dan pengiriman. Hak akses ekspor dan
detail laporan harus ditentukan sebelum implementasi.

## 12. Rancangan Data Awal

Daftar tabel berikut merupakan rancangan awal dan harus ditinjau sebelum
migration diterapkan.

  Tabel                    Fungsi
  ------------------------ ----------------------------------------------
  `profiles`               Data profil pengguna
  `user_roles`             Role pengguna
  `addresses`              Alamat pembeli
  `products`               Data produk dan harga
  `inventory`              Persediaan produk
  `orders`                 Data utama pesanan
  `order_items`            Rincian item pesanan dan snapshot harga
  `order_allocations`      Catatan alokasi stok dan kebutuhan pemenuhan
  `production_records`     Catatan proses produksi
  `deliveries`             Penugasan dan status pengiriman
  `payments`               Catatan pembayaran
  `order_status_history`   Riwayat perubahan status pesanan
  `notifications`          Notifikasi pengguna

Ketentuan desain database: - Gunakan primary key dan foreign key yang
jelas. - Tambahkan constraint untuk nilai kuantitas, nominal, dan
status. - Gunakan timestamp untuk waktu pembuatan dan perubahan. -
Simpan identitas pelaku untuk perubahan penting. - Pertimbangkan soft
delete atau status aktif/nonaktif untuk data master yang memiliki
histori transaksi. - Hindari menyimpan data yang sama berulang kali
kecuali memang diperlukan sebagai snapshot transaksi. - Tinjau indeks
berdasarkan pola query. - Gunakan migration yang dapat dilacak melalui
Git.

## 13. Keamanan dan Privasi

Persyaratan wajib: 1. Aktifkan RLS pada seluruh tabel yang terekspos ke
client. 2. Pembeli hanya dapat membaca dan mengelola data miliknya. 3.
Kurir hanya dapat membaca tugas pengiriman yang ditugaskan kepadanya. 4.
Kepala karyawan hanya dapat mengakses data yang diperlukan untuk
produksi. 5. Admin memiliki akses sesuai fungsi administratif yang
ditetapkan. 6. Role tidak boleh dapat diubah sendiri oleh pengguna. 7.
Validasi transisi status dan perhitungan nominal dilakukan di backend.
8. `service_role` key tidak boleh berada di source code Flutter, file
konfigurasi client, atau repository. 9. Bukti pembayaran dan file privat
harus menggunakan akses terbatas. 10. Hindari mencatat password, token,
atau data rahasia ke log. 11. Perubahan sensitif harus memiliki audit
trail. 12. Uji RLS menggunakan akun dari setiap role, termasuk percobaan
akses yang tidak sah.

## 14. Kebutuhan UI/UX

-   Desain modern, bersih, profesional, dan mudah dipahami.
-   Prioritaskan penggunaan pada layar Android.
-   Gunakan konsistensi warna, tipografi, spacing, ikon, tombol, dan
    komponen.
-   Tampilkan loading, error, empty state, dan konfirmasi untuk tindakan
    penting.
-   Form memiliki validasi dan pesan kesalahan yang jelas.
-   Tindakan penting seperti menyetujui, menolak, membatalkan, dan
    menyelesaikan pesanan harus memiliki konfirmasi yang sesuai.
-   Navigasi disesuaikan dengan role.
-   Jangan menampilkan menu atau tombol yang tidak memiliki fungsi.
-   Hindari animasi berlebihan yang mengganggu proses operasional.
-   Jangan menganggap desain selesai hanya dari tampilan; uji alur
    penggunaan sebenarnya.

## 15. Arsitektur Flutter

Gunakan pendekatan feature-first. Struktur final dapat disesuaikan
setelah memeriksa project yang tersedia.

Contoh struktur:

``` text
lib/
  app/
    app.dart
    router/
    theme/
  core/
    config/
    constants/
    errors/
    services/
    utils/
    widgets/
  features/
    auth/
      data/
      domain/
      presentation/
    profile/
      data/
      domain/
      presentation/
    products/
      data/
      domain/
      presentation/
    addresses/
      data/
      domain/
      presentation/
    orders/
      data/
      domain/
      presentation/
    inventory/
      data/
      domain/
      presentation/
    production/
      data/
      domain/
      presentation/
    payments/
      data/
      domain/
      presentation/
    deliveries/
      data/
      domain/
      presentation/
    notifications/
      data/
      domain/
      presentation/
```

Ketentuan: - Jangan memaksakan abstraksi yang tidak dibutuhkan. -
Pisahkan widget tampilan dari akses database. - Hindari query Supabase
langsung tersebar di banyak widget. - Gunakan pengelolaan state yang
konsisten dan sesuai kompleksitas aplikasi. - Buat komponen bersama
untuk elemen UI yang digunakan berulang. - Tangani error secara
konsisten.

## 16. Tahapan Implementasi

Pengerjaan wajib dilakukan berurutan dan setiap tahap harus diperiksa
sebelum tahap berikutnya.

  -----------------------------------------------------------------------
  Tahap                   Fokus                   Kriteria selesai
  ----------------------- ----------------------- -----------------------
  1                       Finalisasi aturan       Aturan harga, stok,
                          bisnis                  pembayaran, pembatalan,
                                                  dan operasional
                                                  disetujui

  2                       Perancangan UI/UX       Alur dan rancangan
                                                  halaman setiap role
                                                  ditinjau

  3                       Persiapan Flutter dan   Project dapat
                          Supabase                dijalankan dan koneksi
                                                  aman dikonfigurasi

  4                       Database dan migration  Skema, relasi,
                                                  constraint, dan indeks
                                                  ditinjau serta diuji

  5                       Auth dan RLS            Login, role, sesi, dan
                                                  pembatasan akses teruji

  6                       Fungsi                  Operasi pesanan, stok,
                          backend/transaksi       produksi, pembayaran,
                                                  dan pengiriman
                                                  tervalidasi

  7                       Struktur dan navigasi   Struktur fitur dan
                          Flutter                 route berdasarkan role
                                                  berfungsi

  8                       Fitur pembeli           Profil, alamat,
                                                  katalog, checkout, dan
                                                  riwayat berjalan

  9                       Fitur admin             Persetujuan pesanan,
                                                  produk, pembayaran, dan
                                                  penugasan kurir
                                                  berjalan

  10                      Fitur produksi          Alokasi stok dan proses
                                                  produksi berjalan

  11                      Fitur kurir             Penugasan dan pembaruan
                                                  pengiriman berjalan

  12                      Realtime/notifikasi     Pembaruan informasi
                                                  diterima oleh pengguna
                                                  yang berhak

  13                      Pengujian menyeluruh    Skenario normal, gagal,
                                                  keamanan, dan
                                                  konkurensi lulus

  14                      Uji coba operasional    Alur nyata diuji dan
                                                  temuan diperbaiki

  15                      Build Android           Build release berhasil
                                                  dan diuji pada
                                                  perangkat
  -----------------------------------------------------------------------

## 17. Aturan Kerja untuk AI Coding Assistant

Dokumen ini adalah acuan utama pengembangan aplikasi Kulit Lumpia.

AI coding assistant wajib mengikuti aturan berikut:

1.  Baca `PRD.md` ini sebelum mengerjakan tugas terkait aplikasi.
2.  Periksa struktur project, dependency, konfigurasi, dan kode yang
    sudah ada sebelum melakukan perubahan.
3.  Jangan mengasumsikan file, tabel, fungsi, atau fitur sudah tersedia
    tanpa memeriksanya.
4.  Kerjakan berdasarkan tahapan implementasi dan jangan melompat tahap.
5.  Kerjakan hanya ruang lingkup yang diminta pada tahap aktif.
6.  Jangan membuat seluruh aplikasi sekaligus dalam satu perubahan
    besar.
7.  Jangan menghapus atau menimpa kode yang berfungsi tanpa alasan
    teknis dan persetujuan.
8.  Sebelum mengubah database, jelaskan dampak migration dan hindari
    operasi destruktif.
9.  Jangan membuat data dummy seolah-olah data produksi.
10. Jangan membuat tombol atau fitur yang hanya tampak berfungsi tetapi
    tidak menjalankan proses sebenarnya.
11. Jika ada keputusan bisnis yang belum ditetapkan, tandai sebagai
    **BELUM DIPUTUSKAN** dan tanyakan kepada pemilik produk. Jangan
    membuat asumsi diam-diam.
12. Setelah implementasi, jalankan formatter, analyzer, test, atau
    pemeriksaan relevan.
13. Perbaiki error yang muncul sebelum menyatakan tahap selesai.
14. Laporkan file yang dibuat, diubah, atau dihapus beserta alasannya.
15. Laporkan hasil pengujian secara jujur, termasuk yang belum dapat
    diuji.
16. Jangan melanjutkan ke tahap berikutnya sebelum pengguna meninjau dan
    menyetujuinya.

### Format laporan setiap tahap

Setiap penyelesaian tahap harus melaporkan: - Tujuan tahap. -
Pemeriksaan awal yang dilakukan. - Implementasi yang dikerjakan. -
Daftar file yang berubah. - Perubahan database atau konfigurasi. -
Pengujian yang dijalankan dan hasilnya. - Masalah yang belum selesai. -
Kriteria tahap yang sudah/belum terpenuhi. - Hal yang memerlukan
keputusan pengguna. - Permintaan persetujuan sebelum lanjut.

## 18. Kriteria Penerimaan Produk

Aplikasi MVP dapat dinyatakan siap untuk uji operasional jika: - Empat
role dapat login dan hanya mengakses fungsi masing-masing. - Pembeli
dapat membuat pesanan dengan harga dan alamat yang tersimpan benar. -
Admin dapat menyetujui atau menolak pesanan. - Stok tidak dapat
dialokasikan ganda atau menjadi negatif. - Kekurangan stok masuk ke
proses produksi. - Pesanan tidak dapat dinyatakan siap dikirim sebelum
seluruh kuantitas siap. - Admin dapat menetapkan kurir. - Kurir hanya
dapat memperbarui pengiriman yang ditugaskan kepadanya. - Status pesanan
dan pembayaran tercatat terpisah. - Riwayat perubahan status tersedia. -
RLS dan validasi backend telah diuji untuk semua role. - Tidak ada
rahasia backend yang tertanam di aplikasi. - Skenario error penting
telah diuji. - Build Android release berhasil dan diuji pada perangkat.

## 19. Keputusan yang Masih Harus Dikonfirmasi

Hal berikut belum boleh diasumsikan oleh AI:

1.  Nama, deskripsi, foto, dan variasi produk yang akan dijual.
2.  Harga aktual per lembar.
3.  Minimal, maksimal, dan kelipatan jumlah pemesanan.
4.  Jam operasional dan batas waktu penerimaan pesanan.
5.  Area layanan pengiriman dan biaya pengiriman.
6.  Apakah biaya pengiriman dihitung berdasarkan area, jarak, atau tarif
    tetap.
7.  Rekening bank dan instruksi transfer.
8.  Batas waktu pembayaran transfer.
9.  Kapan COD dianggap lunas dan siapa yang mengonfirmasi uang diterima.
10. Apakah pembeli boleh membatalkan pesanan dan sampai tahap apa.
11. Kebijakan pengembalian dana/refund.
12. Apakah satu pesanan dapat dikirim dalam beberapa pengiriman.
13. Apakah kurir dapat menolak atau mengembalikan tugas pengiriman.
14. Apakah diperlukan foto atau tanda terima sebagai bukti pesanan
    diterima.
15. Data dan format laporan yang dibutuhkan admin.
16. Apakah notifikasi cukup di dalam aplikasi atau membutuhkan push
    notification.

Keputusan tersebut harus dibahas dan disetujui sebelum fitur terkait
diterapkan.

------------------------------------------------------------------------

**Prinsip utama:** bangun aplikasi yang benar-benar berfungsi, aman,
dapat diuji, dan sesuai alur operasional usaha. Prioritaskan integritas
data dan kejelasan proses bisnis daripada memperbanyak fitur atau
mempercantik tampilan lebih dahulu.
