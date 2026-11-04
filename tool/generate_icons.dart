import 'dart:io';
import 'dart:typed_data';

/// Skrip mandiri untuk menghasilkan file PNG mipmap ic_launcher aplikasi Kulit Lumpia.
/// Menggunakan dart:io murni tanpa dependensi eksternal.
void main() {
  final Map<String, int> densities = {
    'mipmap-mdpi': 48,
    'mipmap-hdpi': 72,
    'mipmap-xhdpi': 96,
    'mipmap-xxhdpi': 144,
    'mipmap-xxxhdpi': 192,
  };

  const String baseResPath = 'android/app/src/main/res';

  for (final entry in densities.entries) {
    final String folder = entry.key;
    final int size = entry.value;

    final Directory dir = Directory('$baseResPath/$folder');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    final File pngFile = File('${dir.path}/ic_launcher.png');
    final Uint8List pngBytes = generatePng(size, size, 178, 94, 26); // #B25E1A
    pngFile.writeAsBytesSync(pngBytes);
    // ignore: avoid_print
    print('Berhasil membuat: ${pngFile.path} (${size}x$size px)');
  }

  // ignore: avoid_print
  print('\nSemua resource ic_launcher.png berhasil digenerate.');
}

/// Menghasilkan format biner PNG standar valid dengan zlib kompresi.
Uint8List generatePng(int width, int height, int r, int g, int b) {
  final BytesBuilder builder = BytesBuilder();

  // 1. PNG Signature (8 bytes)
  builder.add([137, 80, 78, 71, 13, 10, 26, 10]);

  // 2. IHDR Chunk (Header)
  final ByteData ihdrData = ByteData(13);
  ihdrData.setUint32(0, width);
  ihdrData.setUint32(4, height);
  ihdrData.setUint8(8, 8); // bit depth 8
  ihdrData.setUint8(9, 2); // color type 2: RGB TrueColor
  ihdrData.setUint8(10, 0); // compression method 0
  ihdrData.setUint8(11, 0); // filter method 0
  ihdrData.setUint8(12, 0); // interlace 0
  writeChunk(builder, 'IHDR', ihdrData.buffer.asUint8List());

  // 3. Raw Scanlines (1 filter byte + width * 3 bytes per baris)
  final int bytesPerRow = 1 + width * 3;
  final Uint8List rawData = Uint8List(bytesPerRow * height);
  final int pad = (width * 0.15).round();

  for (int y = 0; y < height; y++) {
    final int rowOffset = y * bytesPerRow;
    rawData[rowOffset] = 0; // Filter Type 0 (None)
    for (int x = 0; x < width; x++) {
      final int pixelOffset = rowOffset + 1 + x * 3;
      // Gambar border/inner box dengan warna putih & krim
      if (x >= pad && x < width - pad && y >= pad && y < height - pad) {
        if (x == pad || x == width - pad - 1 || y == pad || y == height - pad - 1) {
          rawData[pixelOffset] = 255;
          rawData[pixelOffset + 1] = 255;
          rawData[pixelOffset + 2] = 255; // White border
        } else {
          rawData[pixelOffset] = 251;
          rawData[pixelOffset + 1] = 234;
          rawData[pixelOffset + 2] = 219; // #FBEADB Cream
        }
      } else {
        rawData[pixelOffset] = r;
        rawData[pixelOffset + 1] = g;
        rawData[pixelOffset + 2] = b; // #B25E1A Primary Background
      }
    }
  }

  // 4. IDAT Chunk (Compressed Data)
  final List<int> compressed = zlib.encode(rawData);
  writeChunk(builder, 'IDAT', Uint8List.fromList(compressed));

  // 5. IEND Chunk
  writeChunk(builder, 'IEND', Uint8List(0));

  return builder.toBytes();
}

void writeChunk(BytesBuilder builder, String type, Uint8List data) {
  // Length
  final ByteData lengthBytes = ByteData(4)..setUint32(0, data.length);
  builder.add(lengthBytes.buffer.asUint8List());

  // Type
  final Uint8List typeBytes = Uint8List.fromList(type.codeUnits);
  builder.add(typeBytes);

  // Data
  if (data.isNotEmpty) {
    builder.add(data);
  }

  // CRC-32 over Type + Data
  final int crc = calculateCrc32(typeBytes, data);
  final ByteData crcBytes = ByteData(4)..setUint32(0, crc);
  builder.add(crcBytes.buffer.asUint8List());
}

int calculateCrc32(Uint8List type, Uint8List data) {
  int crc = 0xFFFFFFFF;
  void update(int byte) {
    crc ^= byte;
    for (int i = 0; i < 8; i++) {
      if ((crc & 1) != 0) {
        crc = (crc >>> 1) ^ 0xEDB88320;
      } else {
        crc >>>= 1;
      }
    }
  }

  for (final b in type) {
    update(b);
  }
  for (final b in data) {
    update(b);
  }
  return crc ^ 0xFFFFFFFF;
}
