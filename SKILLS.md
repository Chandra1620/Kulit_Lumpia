# SKILLS.md — Kompetensi AI Coding Assistant

Dokumen ini menetapkan kompetensi kerja yang diharapkan. AI tidak boleh mengklaim kemampuan atau tindakan yang tidak benar-benar dilakukan.

## Analisis produk
- Membaca PRD dan memahami alur bisnis.
- Menemukan konflik dan aturan yang belum diputuskan.
- Menyusun acceptance criteria yang dapat diuji.
- Memisahkan MVP dan fitur lanjutan.

## Flutter/Dart
- Mengikuti null safety dan idiom Dart.
- Membuat widget terfokus.
- Memisahkan UI dan business logic.
- Menangani lifecycle, loading, error, dan state.
- Memperhatikan performa list dan rebuild.
- Menulis unit/widget test untuk bagian penting.
- Memeriksa kompatibilitas dependency dengan project.

## Supabase/PostgreSQL
- Memahami Auth, PostgreSQL, RLS, Storage, dan Realtime.
- Merancang relasi, constraint, indeks, dan migration.
- Menulis SQL yang aman dan dapat ditinjau.
- Membuat RPC/transaksi atomik.
- Menguji policy berdasarkan role.
- Memahami bahwa publishable key tidak menggantikan RLS.

## UI/UX
- Merancang alur berdasarkan tugas setiap role.
- Mengutamakan efisiensi operasional.
- Menyediakan empty/loading/error/success state.
- Menggunakan design token konsisten.
- Menghindari dekorasi berlebihan dan tampilan generik.
- Menggunakan Bahasa Indonesia alami.

## Security
- Menerapkan least privilege.
- Mengidentifikasi data sensitif.
- Tidak menaruh secret di client.
- Menerapkan RLS dan validasi server-side.
- Menguji manipulasi role, harga, stok, status, dan request berulang.

## QA
- Menguji aturan bisnis dan skenario kegagalan.
- Menguji akses lintas role.
- Menguji race condition alokasi stok.
- Menjalankan formatter, analyzer, dan test.
- Melaporkan keterbatasan pengujian secara jujur.

## Dokumentasi dan komunikasi
- Menjelaskan rencana sebelum perubahan besar.
- Melaporkan file yang berubah.
- Memisahkan fakta, asumsi, dan keputusan.
- Tidak menyatakan fitur tersedia jika belum diimplementasikan.
- Menunggu persetujuan sebelum berpindah tahap.

## Alur kerja
Baca `PRD.md` → baca dokumen relevan → periksa repository → susun rencana dan acceptance criteria → implementasi → test → laporkan hasil. Jika tool tidak tersedia, jelaskan keterbatasannya.
