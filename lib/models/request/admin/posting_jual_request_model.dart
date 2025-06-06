// lib/models/request/posting_jual_request_model.dart
// Impor library yang mungkin dibutuhkan, seperti 'dart:convert' jika Anda memiliki properti kompleks
// import 'package:ternakkenari/models/anak_request_model.dart'; // Contoh jika PostingJual punya properti AnakRequestModel

class PostingJualRequestModel {
  // Properti yang akan dimiliki oleh objek PostingJualRequestModel
  String? judulPosting;
  String? deskripsi;
  int? harga;
  // List<AnakRequestModel>? daftarAnak; // Contoh jika ada relasi dengan model lain
  // String? idPengguna;

  // Constructor untuk membuat objek PostingJualRequestModel
  PostingJualRequestModel({
    this.judulPosting,
    this.deskripsi,
    this.harga,
    // this.daftarAnak,
    // this.idPengguna,
  });

  // Metode `fromJson` (factory constructor) untuk membuat objek dari Map (biasanya dari JSON)
  factory PostingJualRequestModel.fromJson(Map<String, dynamic> json) {
    return PostingJualRequestModel(
      judulPosting: json['judul_posting'] as String?,
      deskripsi: json['deskripsi'] as String?,
      harga: json['harga'] as int?,
      // daftarAnak: (json['daftar_anak'] as List<dynamic>?)
      //     ?.map((e) => AnakRequestModel.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      // idPengguna: json['id_pengguna'] as String?,
    );
  }

  // Metode `toJson` untuk mengubah objek menjadi Map (biasanya untuk dikirim sebagai JSON ke API)
  Map<String, dynamic> toJson() {
    return {
      'judul_posting': judulPosting,
      'deskripsi': deskripsi,
      'harga': harga,
      // 'daftar_anak': daftarAnak?.map((e) => e.toJson()).toList(),
      // 'id_pengguna': idPengguna,
    };
  }
}