// lib/models/request/induk_request_model.dart

class IndukRequestModel {
  // Properti (variabel) yang akan dimiliki oleh objek IndukRequestModel
  String? idInduk;
  String? namaInduk;
  // tambahkan properti lain yang relevan, contoh:
  // String? jenisKelamin;
  // int? jumlahAnak;

  // Constructor untuk membuat objek IndukRequestModel
  IndukRequestModel({
    this.idInduk,
    this.namaInduk,
    // this.jenisKelamin,
    // this.jumlahAnak,
  });

  // Metode `fromJson` (factory constructor) untuk membuat objek dari Map (biasanya dari JSON)
  factory IndukRequestModel.fromJson(Map<String, dynamic> json) {
    return IndukRequestModel(
      idInduk: json['id_induk'] as String?,
      namaInduk: json['nama_induk'] as String?,
      // jenisKelamin: json['jenis_kelamin'] as String?,
      // jumlahAnak: json['jumlah_anak'] as int?,
    );
  }

  // Metode `toJson` untuk mengubah objek menjadi Map (biasanya untuk dikirim sebagai JSON ke API)
  Map<String, dynamic> toJson() {
    return {
      'id_induk': idInduk,
      'nama_induk': namaInduk,
      // 'jenis_kelamin': jenisKelamin,
      // 'jumlah_anak': jumlahAnak,
    };
  }
}