# Features Layer

Direktori ini memuat seluruh modul fitur aplikasi berbasis **Feature-First Architecture** sesuai spesifikasi pada `ARCHITECTURE.md` Bagian 6:

- `auth`: Autentikasi dan sesi (login, register buyer, logout, reset password).
- `profile`: Data profil dan role yang dilindungi RLS.
- `addresses`: Manajemen alamat pengiriman pembeli.
- `catalog`: Tampilan produk, varian, dan ketersediaan stok.
- `cart`: Pengelolaan item keranjang belanja.
- `checkout`: Validasi transaksi dan pembuatan pesanan (min 10, kelipatan 10, upload struk).
- `orders`: Pelacakan pesanan, riwayat, dan timeline status.
- `payments`: Bukti transfer, verifikasi admin, dan pencatatan COD 2-tahap.
- `admin`: Dashboard operasional, review pesanan, dan penugasan kurir.
- `production`: Antrean kerja kepala karyawan dan penyelesaian produksi.
- `delivery`: Penugasan pengirim, bukti serah terima foto + penerima, dan konfirmasi delivered.
- `notifications`: Inbox notifikasi in-app dan status baca.
- `reports`: Ringkasan transaksi dan laporan operasional.

Struktur internal setiap modul fitur mengikuti pola:
```text
feature_name/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── pages/
    ├── providers/
    └── widgets/
```
Modul fitur akan diimplementasikan secara modular pada tahapan Stage berikutnya (Stage 3 s/d Stage 10).
