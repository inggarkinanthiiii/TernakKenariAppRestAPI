    // lib/models/request/buyer_profile_request_model.dart

    class BuyerProfileRequestModel {
      // Properti (variabel) yang akan dimiliki oleh objek BuyerProfileRequestModel
      String? idPembeli;
      String? namaPembeli;
      String? email;
      String? alamat;
      // ... tambahkan properti lain yang relevan untuk request profil pembeli

      // Constructor untuk membuat objek BuyerProfileRequestModel
      BuyerProfileRequestModel({
        this.idPembeli,
        this.namaPembeli,
        this.email,
        this.alamat,
        // ...
      });

      // Factory constructor untuk membuat objek dari Map (biasanya untuk dikirim sebagai JSON)
      factory BuyerProfileRequestModel.fromJson(Map<String, dynamic> json) {
        return BuyerProfileRequestModel(
          idPembeli: json['id_pembeli'] as String?,
          namaPembeli: json['nama_pembeli'] as String?,
          email: json['email'] as String?,
          alamat: json['alamat'] as String?,
          // ...
        );
      }

      // Metode `toJson` untuk mengubah objek menjadi Map (untuk dikirim sebagai JSON ke API)
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
    