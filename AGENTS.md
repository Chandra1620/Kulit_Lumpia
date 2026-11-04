# AGENTS.md — Aturan Kerja AI

`PRD.md` adalah sumber utama kebutuhan produk. Dokumen ini mengatur cara AI bekerja di repository Kulit Lumpia.

## Wajib dilakukan
1. Baca `PRD.md` dan dokumen relevan sebelum mengerjakan task.
2. Periksa struktur repository, dependency, konfigurasi, dan pola kode yang sudah ada.
3. Kerjakan satu tahap dan satu ruang lingkup dalam satu waktu.
4. Jangan mengarang file, tabel, API, hasil test, atau status implementasi.
5. Jangan menimpa kode yang berfungsi tanpa alasan dan persetujuan.
6. Jangan lanjut ke tahap berikutnya sebelum pengguna menyetujui hasil tahap aktif.
7. Jika aturan bisnis belum jelas, tandai **BELUM DIPUTUSKAN** dan tanyakan; jangan berasumsi.
8. Jangan menambahkan dependency tanpa alasan dan pemeriksaan kompatibilitas.
9. Jangan membuat UI dummy seolah-olah sudah terhubung ke backend.
10. Jangan menaruh secret atau service-role key di aplikasi Flutter.

## Sebelum coding
- Baca PRD dan dokumen arsitektur/desain/keamanan yang terkait.
- Periksa file yang akan diubah dan dependensinya.
- Identifikasi risiko regresi.
- Buat rencana singkat dan acceptance criteria.

## Standar implementasi
- Ikuti `ARCHITECTURE.md`, `TECHSTACK.md`, `SECURITY.md`, `DESIGN.md`, dan `STYLEGUIDE.md`.
- Pisahkan UI, business logic, dan data access.
- Tangani loading, empty, error, success, serta retry state.
- Validasi UX di client dan validasi otoritatif di backend.
- Operasi stok, harga, pembayaran, dan status harus tervalidasi server-side.
- Hindari widget raksasa, duplikasi logika, dan abstraksi berlebihan.
- Gunakan migration untuk perubahan database. Hindari operasi destruktif tanpa persetujuan.

## Anti-AI-slop
- Jangan memakai gradient, glassmorphism, glow, blur, floating blobs, atau animasi dekoratif tanpa tujuan.
- Jangan memenuhi layar dengan card, badge, statistik, dan divider yang tidak membantu.
- Hindari emoji sebagai ikon antarmuka.
- Gunakan Bahasa Indonesia yang alami dan sesuai konteks usaha.
- Prioritaskan hierarki informasi, keterbacaan, dan penyelesaian tugas.

## Pemeriksaan
Sesuai perubahan, jalankan `dart format`, `flutter analyze`, `flutter test`, widget/integration test, serta pemeriksaan migration dan RLS bila relevan. Jangan mengklaim test lulus jika tidak dijalankan.

## Laporan setiap tahap
Cantumkan tujuan, pemeriksaan awal, implementasi, file berubah, migration/config berubah, perintah dan hasil test, masalah tersisa, keputusan yang dibutuhkan, serta status selesai/sebagian/terblokir.

Fitur dianggap selesai hanya jika acceptance criteria terpenuhi, data berasal dari sumber yang benar, otorisasi berjalan, error ditangani, dan pengujian relevan dilakukan.
