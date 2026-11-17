# SECURITY.md

## 1. Tujuan dan Cakupan

Dokumen ini menetapkan persyaratan keamanan aplikasi Kulit Lumpia, termasuk Flutter, Supabase Auth, PostgreSQL, RLS, RPC, Edge Functions, Realtime, dan Storage.

Keamanan bukan fitur tambahan. Aplikasi menangani identitas pengguna, alamat rumah, nomor telepon, transaksi, bukti transfer, dan bukti penerimaan.

## 2. Prinsip Keamanan

- Least privilege.
- Server-authoritative business rules.
- Deny by default.
- Defense in depth.
- Data minimization.
- Auditability.
- Secure file access.
- No secrets in client.
- Validate every state transition.

## 3. Klasifikasi Data

| Kategori | Contoh | Perlindungan |
|---|---|---|
| Publik | Foto dan deskripsi produk yang memang dipublikasikan | Boleh dibaca tanpa login jika kebijakan mengizinkan |
| Internal | Data stok, antrean kerja, laporan operasional | Login dan RLS |
| Pribadi | Nama, nomor telepon, alamat rumah | RLS ketat, akses sesuai kebutuhan |
| Transaksi | Pesanan, pembayaran, harga, histori | RLS, constraint, audit |
| Sensitif operasional | Bukti transfer, bukti penerimaan | Bucket privat, signed URL, authorization |
| Secret | Service role key, API secret | Server-side only |

Jangan menyimpan data yang tidak dibutuhkan untuk menjalankan fitur.

## 4. Authentication

- Gunakan Supabase Auth.
- **Registrasi Publik Terbatas (D-05):** Registrasi publik HANYA untuk role `buyer`. Formulir registrasi publik tidak menyediakan pilihan role.
- **Akun Staf Tertutup (D-05):** Akun staf (`admin`, `production_lead`, `courier`) dibuat secara tertutup oleh admin melalui mekanisme administratif yang aman.
- Role default pengguna baru pada database trigger ditetapkan sebagai `buyer`.
- Sediakan logout dan pemulihan password.
- Jangan menyimpan password di tabel aplikasi.
- Jangan mencatat access token atau refresh token ke log.
- Tangani sesi kedaluwarsa dengan aman.
- Jangan menganggap keberadaan sesi sebagai bukti bahwa pengguna berhak atas suatu record.

## 5. Authorization dan Role

Role aplikasi (Tepat 4 Role Resmi):
- `buyer`
- `admin`
- `production_lead`
- `courier`

Nama enum final harus konsisten antara database, aplikasi, dan policy.

Aturan:
- Role ditetapkan oleh proses tepercaya (database trigger / admin auth).
- Pengguna tidak dapat menaikkan role melalui update profil.
- Jangan mempercayai role dari SharedPreferences, request body, atau parameter UI.
- RLS harus memeriksa identitas dan hubungan data yang relevan.
- Akses admin harus dibatasi pada akun admin yang sah.
- Perubahan role harus dicatat dalam audit log.

## 6. Row Level Security

Aktifkan RLS untuk semua tabel yang terekspos melalui Supabase Data API.

Matriks akses konseptual:

| Data | Buyer | Admin | Production Lead | Courier |
|---|---|---|---|---|
| Profil sendiri | Baca/ubah field aman | Kelola sesuai kebijakan | Baca/ubah field aman | Baca/ubah field aman |
| Katalog aktif | Baca | Kelola | Baca seperlunya | Baca seperlunya |
| Pesanan | Milik sendiri | Operasional | Antrean yang ditugaskan/diizinkan | Tugas yang ditugaskan |
| Pembayaran | Milik sendiri, field terbatas | Verifikasi/kelola | Tidak | Tidak, kecuali kebutuhan terbatas |
| Bukti transfer | Milik sendiri | Verifikasi | Tidak | Tidak |
| Bukti pengiriman | Pesanan sendiri | Baca operasional | Tidak | Tugas sendiri |
| Stok | Ketersediaan publik yang aman | Kelola | Baca sesuai tugas | Tidak |
| Audit log | Tidak | Baca sesuai kewenangan | Tidak | Tidak |

Matriks ini adalah arah kebijakan. Policy aktual harus disusun dan diuji berdasarkan schema final. Jangan menyalin matriks ini menjadi policy tanpa memeriksa kolom dan relasi tabel.

### Pengujian RLS wajib
- Buyer A tidak dapat membaca pesanan Buyer B.
- Buyer tidak dapat mengubah total, status, atau role.
- Production lead tidak dapat mengubah pembayaran.
- Courier A tidak dapat membaca atau mengubah tugas Courier B.
- Courier tidak dapat mengonfirmasi pesanan yang tidak ditugaskan kepadanya.
- Pengguna anonim tidak dapat membaca data privat.
- Admin yang tidak sah tidak memperoleh akses admin.

## 7. Secret Management

- Supabase URL dan anon/publishable key dapat berada di client hanya dengan RLS yang benar.
- `service_role` key tidak boleh masuk ke APK.
- Jangan commit `.env` berisi secret.
- Jangan menaruh secret di `--dart-define` untuk APK publik.
- Secret pihak ketiga disimpan di Supabase Edge Function secrets atau secret manager server.
- Rotasi secret jika terlanjur terekspos.
- Jangan mengirim secret melalui chat, issue publik, atau screenshot.

## 8. Business Logic Protection

Operasi berikut harus divalidasi server-side:
- Pembuatan pesanan (`create_order`) dan perhitungan harga server-side; bukti transfer wajib terunggah saat checkout jika metode transfer (D-07).
- Persetujuan/penolakan pesanan oleh admin (`approve_order` / `reject_order`).
- Alokasi stok (`reserved`) dan pelepasan stok.
- Mulai dan selesai produksi oleh kepala karyawan (`start_production` / `complete_production`).
- Penugasan pengirim oleh admin (`assign_courier`).
- Mulai pengiriman (`start_delivery`).
- Konfirmasi pesanan sampai (`confirm_delivery`): wajib validasi keberadaan foto bukti penerimaan dan nama penerima barang (D-06).
- Verifikasi bukti transfer oleh admin (`verify_transfer_payment`).
- Konfirmasi pembayaran COD 2-tahap: laporan kurir (`report_cod_receipt`) dan pencatatan verifikasi admin (`record_cod_payment`).
- Pembatalan pesanan (`cancel_order`): validasi pembeli hanya boleh membatalkan saat `pending_approval` (D-02); admin berwenang membatalkan dengan alasan wajib dan inisiasi karantina sisa produksi (D-01).
- Pencatatan refund transfer (`process_refund`): verifikasi role admin dan pencatatan data transfer manual (D-03).

Validasi minimal:
- Identitas pengguna.
- Role.
- Kepemilikan atau assignment.
- Status sebelumnya.
- Input dan batas nilai.
- Konsistensi total.
- Ketersediaan stok.
- Bukti yang diwajibkan.
- Idempotency/request duplication.

Jangan percaya nilai harga, total, role, status, atau pemilik file yang dikirim client.

## 9. Database Integrity

- Gunakan foreign key.
- Gunakan unique constraint untuk nomor pesanan dan identifier penting.
- Gunakan check constraint untuk kuantitas dan nominal yang valid.
- Gunakan transaction untuk perubahan yang saling terkait.
- Gunakan locking/strategi concurrency yang sesuai untuk alokasi stok.
- Jangan menggunakan floating point untuk nominal Rupiah.
- Simpan snapshot transaksi.
- Histori status dan audit log tidak boleh dapat diubah pengguna biasa.

## 10. Storage Security

Bucket:
- `product-images`: dapat dibuat publik hanya jika memang tidak mengandung data privat.
- `payment-proofs`: privat.
- `delivery-proofs`: privat.

Kontrol:
- Validasi MIME type dan ukuran file.
- Gunakan path yang tidak mudah ditebak, tetapi jangan mengandalkan kerahasiaan path.
- RLS Storage harus memeriksa akses ke pesanan terkait.
- Gunakan signed URL dengan masa berlaku terbatas untuk file privat.
- Hindari URL publik untuk bukti transaksi.
- Jangan menerima file executable.
- Pertimbangkan pembatasan jumlah upload dan penghapusan file sementara.

## 11. Input Validation

Validasi di client untuk UX dan di server untuk keamanan.

Contoh:
- Kuantitas minimal 10 dan kelipatan 10.
- Harga tidak boleh negatif.
- Alamat dan nomor telepon memiliki batas panjang.
- ID harus merujuk record yang sah.
- Alasan penolakan/pembatalan wajib dan memiliki batas panjang.
- Upload file dibatasi tipe dan ukuran.
- Jangan merender teks pengguna sebagai HTML/markup yang tidak disanitasi.

## 12. Payment Security

- Bukti transfer bukan bukti final bahwa uang telah diterima.
- Admin memverifikasi nominal dan referensi transaksi secara manual; tidak ada auto-cancel timeout pada MVP (D-07).
- Jangan menerima status `paid` dari aplikasi pembeli.
- **Konfirmasi Pembayaran COD 2-Tahap:** Kurir di lapangan hanya melaporkan penerimaan fisik uang COD (tahap 1); kurir tidak berwenang mengubah status pembayaran menjadi lunas. Admin memverifikasi setoran fisik uang COD (tahap 2) sebelum status berubah menjadi `cod_collected`.
- COD tidak otomatis lunas saat barang sampai (`delivered`).
- **Pencatatan Refund Transfer (D-03):** Pengembalian dana dilakukan manual oleh admin via transfer bank. Sistem mencatat: nominal, tanggal, nomor referensi transaksi, catatan refund, dan bukti transfer refund jika ada. Status pembayaran hanya boleh menjadi `refunded` setelah transfer dicatat di sistem; pembatalan pesanan tidak otomatis membuat status pembayaran menjadi `refunded`.
- Jika payment gateway ditambahkan di masa depan, verifikasi signature webhook di server.
- Lindungi webhook dari replay dan request palsu.

## 13. Audit Logging

Catat:
- User ID dan role pelaku.
- Jenis aksi.
- Entitas dan ID terkait.
- Timestamp server.
- Nilai sebelum/sesudah bila relevan.
- Alasan penolakan/pembatalan.
- Referensi request/idempotency bila relevan.

Jangan mencatat:
- Password.
- Access/refresh token.
- Service role key.
- Secret API.
- Bukti transfer dalam bentuk base64.
- Data pribadi yang tidak diperlukan.

## 14. Network dan Client

- Gunakan HTTPS endpoint Supabase.
- Jangan menonaktifkan validasi TLS.
- Tangani error jaringan tanpa menampilkan detail internal.
- Jangan menyimpan data transaksi sensitif secara lokal tanpa kebutuhan.
- SharedPreferences hanya untuk preferensi non-sensitif.
- Jika kelak menyimpan token/data sensitif sendiri, gunakan secure storage dan evaluasi threat model.

## 15. Threat Scenarios

| Ancaman | Kontrol |
|---|---|
| Pengguna mengubah harga dari APK | Harga dihitung server |
| Buyer membaca pesanan lain | RLS ownership |
| Courier mengakses tugas lain | RLS berdasarkan assignment |
| Staf menaikkan role | Role hanya dapat diubah proses tepercaya |
| Bukti transfer palsu | Verifikasi admin |
| Request checkout ganda | Idempotency dan constraint |
| Overselling stok | Transaction dan concurrency control |
| File bukti bocor | Bucket privat dan signed URL |
| Status pesanan dimanipulasi | RPC dengan state transition validation |
| Secret bocor dari APK | Tidak menyimpan secret server di client |

## 16. Security Release Checklist

- [ ] RLS aktif di seluruh tabel yang terekspos.
- [ ] Policy diuji untuk semua role.
- [ ] Tidak ada service role key di source atau APK.
- [ ] Storage bukti transfer privat.
- [ ] Storage bukti penerimaan privat.
- [ ] Harga dan total dihitung server-side.
- [ ] Transisi status divalidasi server-side.
- [ ] Operasi stok aman dari race condition.
- [ ] Pembayaran tidak dapat dipalsukan melalui client.
- [ ] Audit log aktif untuk tindakan penting.
- [ ] Log tidak berisi token atau secret.
- [ ] Error tidak membocorkan detail internal.
- [ ] Backup dan prosedur pemulihan database ditinjau.
- [ ] Akun staf dan proses pencabutan akses diuji.

Dokumen ini tidak menggantikan security review dan pengujian langsung pada project Supabase production.
