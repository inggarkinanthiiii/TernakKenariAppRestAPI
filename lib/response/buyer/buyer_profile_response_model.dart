// lib/response/buyer/buyer_profile_response_model.dart

class BuyerProfileResponseModel {
  String? idPembeli;
  String? namaPembeli;
  String? email;
  String? alamat;
  // ... tambahkan properti lain yang relevan untuk respons profil pembeli

  BuyerProfileResponseModel({
    this.idPembeli,
    this.namaPembeli,
    this.email,
    this.alamat,
    // ...
  });

  // Factory constructor untuk membuat objek dari Map (dari JSON respons API)
  factory BuyerProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return BuyerProfileResponseModel(
      idPembeli: json['id_pembeli'] as String?,
      namaPembeli: json['nama_pembeli'] as String?,
      email: json['email'] as String?,
      alamat: json['alamat'] as String?,
      // ...
    );
  }

  // Metode `toJson` jika diperlukan (misalnya, untuk mengubah kembali menjadi JSON)
  Map<String, dynamic> toJson() {
    return {
      'id_pembeli': idPembeli,
      'nama_pembeli': namaPembeli,
      'email': email,
      'alamat': alamat,
      // ...
    };
  }
}