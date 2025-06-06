// lib/models/anak_request_model.dart

class AnakRequestModel {
  // Properti (variabel) yang akan dimiliki oleh objek AnakRequestModel
  // Contoh:
  String? id;
  String? nama;
  int? usia;
  // Anda bisa menambahkan properti lain sesuai kebutuhan aplikasi Anda
  // Contoh: String? jenisKelamin; String? tanggalLahir;

  // Constructor untuk membuat objek AnakRequestModel
  // `required` bisa ditambahkan jika properti tersebut wajib diisi
  AnakRequestModel({
    this.id,
    this.nama,
    this.usia,
    // this.jenisKelamin,
    // this.tanggalLahir,
  });

  // Metode `fromJson` (factory constructor) untuk membuat objek dari Map (biasanya dari JSON)
  // Ini berguna ketika Anda menerima data JSON dari API dan ingin mengubahnya menjadi objek Dart.
  factory AnakRequestModel.fromJson(Map<String, dynamic> json) {
    return AnakRequestModel(
      id: json['id'] as String?, // Pastikan tipe data sesuai
      nama: json['nama'] as String?,
      usia: json['usia'] as int?,
      // jenisKelamin: json['jenis_kelamin'] as String?,
      // tanggalLahir: json['tanggal_lahir'] as String?,
    );
  }

  // Metode `toJson` untuk mengubah objek menjadi Map (biasanya untuk dikirim sebagai JSON ke API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'usia': usia,
      // 'jenis_kelamin': jenisKelamin,
      // 'tanggal_lahir': tanggalLahir,
    };
  }
}