// lib/models/request/admin/admin_profil_request.dart

class AdminProfileRequest { // Atau AdminProfileRequestModel jika Anda sudah mengubah namanya
  String? idAdmin;
  String? namaLengkap;
  String? email;
  // ... properti lainnya

  AdminProfileRequest({
    this.idAdmin,
    this.namaLengkap,
    this.email,
  });

  // Metode `toJson` untuk mengubah objek menjadi Map (untuk dikirim sebagai JSON)
  // Ini adalah pengganti yang tepat untuk `toMap` jika Anda ingin mengonversi ke JSON.
  Map<String, dynamic> toJson() { // <--- Ubah ini dari `get toMap`
    return {
      'id_admin': idAdmin,
      'nama_lengkap': namaLengkap,
      'email': email,
      // ... tambahkan semua properti yang relevan di sini
    };
  }

  // Factory constructor (jika ada)
  factory AdminProfileRequest.fromJson(Map<String, dynamic> json) {
    return AdminProfileRequest(
      idAdmin: json['id_admin'] as String?,
      namaLengkap: json['nama_lengkap'] as String?,
      email: json['email'] as String?,
    );
  }
}