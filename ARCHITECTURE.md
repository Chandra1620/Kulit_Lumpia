# ARCHITECTURE.md — Arsitektur Aplikasi

## Tujuan
Memisahkan UI, aturan bisnis, dan akses data. Sesuaikan rancangan dengan repository aktual; jangan melakukan migrasi arsitektur besar hanya demi mengikuti contoh.

## Gambaran
```text
Flutter Android
  Presentation: screens, widgets, state
  Domain: entities, use cases, repository contracts
  Data: models, repositories, data sources
          |
          v
Supabase
  Auth | PostgreSQL | RLS | SQL functions/RPC | Realtime
```

PostgreSQL adalah sumber kebenaran untuk role, harga transaksi, stok, pesanan, pembayaran, dan status pengiriman. State Flutter hanya merepresentasikan data server.

## Prinsip
- Feature-first.
- Pisahkan presentation, domain, dan data sesuai kebutuhan.
- Hindari overengineering; tidak semua operasi memerlukan use case class.
- Aturan kritis tidak boleh hanya berada di client.
- Operasi yang saling bergantung harus atomik.
- Realtime hanya membantu pembaruan UI, bukan sumber kebenaran.

## Struktur yang disarankan
```text
lib/
  app/                 # app, router, theme
  core/                # config, errors, services, utils, widgets
  features/
    auth/
    profile/
    products/
    addresses/
    orders/
    inventory/
    production/
    payments/
    deliveries/
    notifications/
      data/
      domain/
      presentation/
```
Setiap feature dapat memiliki `data`, `domain`, dan `presentation`. Terapkan struktur tersebut secara konsisten dan tidak berlebihan.

## Tanggung jawab lapisan
**Presentation:** menampilkan data, menerima input, memanggil controller/use case, menampilkan state. Tidak menjadi sumber kebenaran harga atau total.

**Domain:** aturan bisnis yang dapat diuji tanpa UI, entity, kontrak repository, use case kompleks. Tidak bergantung pada Flutter atau Supabase SDK.

**Data:** implementasi repository, mapping model, query/RPC, dan penanganan error.

**Supabase/PostgreSQL:** RLS, integritas data, transaksi, validasi kewenangan, dan operasi atomik.

## Auth dan routing
1. Pengguna login melalui Supabase Auth.
2. Aplikasi mengambil profil dan role dari sumber terlindungi.
3. Router menampilkan area sesuai role.
4. RLS tetap memeriksa setiap akses data.
5. Operasi sensitif divalidasi kembali di backend.

Registrasi publik hanya membuat role pembeli. Role staf diberikan melalui proses tepercaya.

## Checkout
Checkout dilakukan melalui fungsi server-side/RPC:
1. Validasi identitas dan kepemilikan alamat.
2. Ambil harga produk terkini dari database.
3. Validasi produk aktif dan kuantitas.
4. Hitung total di server.
5. Simpan order dan item dengan snapshot harga/alamat.
6. Terapkan idempotency untuk mencegah pesanan ganda.
7. Kembalikan nomor pesanan dan status.

Jangan mempercayai total dari client.

## Stok dan produksi
Gunakan transaksi atomik:
1. Lindungi baris persediaan dari update bersamaan.
2. Hitung `available = on_hand - reserved`.
3. Alokasikan stok tersedia.
4. Catat kekurangan sebagai kebutuhan produksi.
5. Simpan allocation record.
6. Rollback seluruh perubahan jika salah satu langkah gagal.

Contoh: kebutuhan 1.000 lembar, stok tersedia 300, maka 300 dialokasikan dan 700 masuk produksi. Pesanan siap dikirim hanya jika seluruh jumlah telah terpenuhi.

## Status
Status pesanan dan pembayaran terpisah. Transisi divalidasi server-side dan dicatat ke riwayat. Contoh:
- `pending_approval` → `approved` atau `rejected`
- `approved` → `processing`
- `processing` → `ready_to_ship`
- `ready_to_ship` → `assigned_to_courier`
- `assigned_to_courier` → `in_delivery`
- `in_delivery` → `delivered` atau `delivery_issue`

## Realtime dan error
Gunakan Realtime hanya untuk data yang membutuhkan pembaruan cepat. Batasi subscription dan data yang dikirim. Sediakan fallback query ulang. Jangan tampilkan stack trace kepada pengguna dan jangan mencatat token/password ke log.

## Keputusan yang harus dicatat
Dokumentasikan state management, router, dependency injection bila dipakai, strategi migration, file storage, push notification, dan mekanisme server-side. Jangan memilih layanan eksternal tanpa alasan dan persetujuan.
