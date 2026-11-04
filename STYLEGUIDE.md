# STYLEGUIDE.md — Standar Kode dan Konten

## Bahasa
- Bahasa UI: Bahasa Indonesia.
- Gunakan istilah teknis Inggris bila umum dan lebih jelas.
- Kalimat singkat, spesifik, sopan.
- Jangan tampilkan istilah database kepada pengguna.
- Pesan error harus menjelaskan masalah dan langkah berikutnya bila memungkinkan.

Contoh label: “Masuk”, “Jumlah pesanan”, “Menunggu persetujuan”, “Pesanan berhasil dibuat”, “Coba lagi”.

## Penamaan
- Class/type Dart: `PascalCase`.
- Variable dan method: `lowerCamelCase`.
- File Dart: `snake_case.dart`.
- Tabel/kolom database: `snake_case`.
- Status internal mengikuti daftar pada PRD.

## Widget
- Gunakan `const` bila memungkinkan.
- Pecah widget bila meningkatkan keterbacaan atau reuse.
- Hindari satu file screen berisi seluruh aplikasi.
- Pisahkan widget presentasi dari akses repository.
- Hindari abstraksi generik untuk kasus tunggal.
- Gunakan theme/design token, bukan hardcode berulang.

## State dan asynchronous
- Tampilkan loading, error, empty, dan success state.
- Cegah submit berulang.
- Jangan menganggap timeout berarti transaksi pasti gagal; periksa status sebelum mengulang operasi yang berisiko duplikasi.
- Tangani lifecycle sesuai pola Flutter.
- Jangan membuang input pengguna saat request gagal.

## Form
- Label field harus jelas.
- Tampilkan satuan untuk jumlah dan harga.
- Validasi client untuk UX dan backend untuk keamanan.
- Tampilkan error dekat field.
- Konfirmasi tindakan yang sulit dibatalkan.

## Format data
- Tampilkan Rupiah, misalnya `Rp25.000`.
- Simpan uang sebagai tipe numerik yang tepat, bukan string tampilan.
- Jumlah produk memakai satuan “lembar”.
- Gunakan pemisah ribuan konsisten.
- Simpan timestamp secara konsisten dan tampilkan sesuai konteks lokal.

## Komentar dan Git
- Komentar menjelaskan alasan/batasan, bukan mengulang kode.
- Dokumentasikan aturan bisnis kritis.
- Perbarui dokumen saat perilaku berubah.
- Perubahan harus fokus dan mudah ditinjau.
- Jangan commit `.env`, secret, file build, atau kredensial.
- Migration harus ditinjau dan dicatat.

## Checklist selesai
- [ ] Kode terformat.
- [ ] Tidak ada error analyzer baru.
- [ ] Test relevan dijalankan.
- [ ] Loading/empty/error state tersedia.
- [ ] Bahasa UI konsisten.
- [ ] Tidak ada secret/data sensitif di log.
- [ ] Akses role diuji.
- [ ] Dokumentasi diperbarui bila perlu.
