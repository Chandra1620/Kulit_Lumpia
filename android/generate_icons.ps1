# Skrip PowerShell untuk menghasilkan file mipmap/ic_launcher.png menggunakan Dart
$ErrorActionPreference = "Stop"

Write-Host "Menghasilkan resource icon Android untuk Kulit Lumpia..." -ForegroundColor Cyan

if (Get-Command dart -ErrorAction SilentlyContinue) {
    dart run tool/generate_icons.dart
} elseif (Get-Command flutter -ErrorAction SilentlyContinue) {
    flutter pub run tool/generate_icons.dart
} else {
    Write-Host "Dart SDK tidak ditemukan di PATH. Pastikan Flutter/Dart terpasang." -ForegroundColor Red
}

