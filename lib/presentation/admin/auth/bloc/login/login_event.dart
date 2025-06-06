// lib/presentation/admin/auth/bloc/login/login_event.dart

import 'package:ternakkenari/models/request/login_request_model.dart'; // Impor definisi yang benar

sealed class LoginEvent {}

class LoginRequested extends LoginEvent {
  final LoginRequestModel requestModel;

  LoginRequested({required this.requestModel});
}

// HAPUS DEFINISI KELAS LoginRequestModel {} DARI SINI.
// Kelas LoginRequestModel HANYA BOLEH didefinisikan di
// lib/models/request/login_request_model.dart.
