    // lib/models/request/register_request_model.dart

    class RegisterRequestModel {
      final String name;
      final String email;
      final String password;
      // Tambahkan properti lain yang relevan untuk pendaftaran
      // String? phoneNumber;
      // String? address;

      RegisterRequestModel({
        required this.name,
        required this.email,
        required this.password,
        // this.phoneNumber,
        // this.address,
      });

      // Metode `toJson` untuk mengubah objek menjadi Map (untuk dikirim sebagai JSON ke API)
      Map<String, dynamic> toJson() {
        return {
          'name': name,
          'email': email,
          'password': password,
          // 'phone_number': phoneNumber,
          // 'address': address,
        };
      }

      // Factory constructor untuk membuat objek dari Map (jika diperlukan untuk parsing dari JSON)
      factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
        return RegisterRequestModel(
          name: json['name'] as String,
          email: json['email'] as String,
          password: json['password'] as String,
          // phoneNumber: json['phone_number'] as String?,
          // address: json['address'] as String?,
        );
      }
    }
    