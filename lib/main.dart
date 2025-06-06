import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// --- Impor Kelas-kelas dari Lokasi Mereka yang Seharusnya ---

// Impor BLOCs
import 'package:ternakkenari/presentation/admin/auth/bloc/get_all_burung_tersedia/get_burung_tersedia_bloc.dart';
import 'package:ternakkenari/presentation/admin/auth/bloc/login/login_bloc.dart'; // Asumsikan Anda punya file ini
import 'package:ternakkenari/presentation/admin/auth/bloc/register/register_bloc.dart'; // Asumsikan Anda punya file ini
import 'package:ternakkenari/presentation/admin/auth/bloc/profile_buyer/profile_buyer_bloc.dart'; // Asumsikan Anda punya file ini
import 'package:ternakkenari/presentation/auth/buyer/profile/bloc/profile_buyer_bloc.dart';

// Impor REPOSITORIES
import 'package:ternakkenari/repositories/auth_repository.dart'; // Asumsikan Anda punya file ini
import 'package:ternakkenari/repositories/profile_buyer_repository.dart'; // Asumsikan Anda punya file ini
import 'package:ternakkenari/repositories/get_all_burung_tersedia_repository.dart'; // Asumsikan Anda punya file ini

// Impor SERVICES
import 'package:ternakkenari/services/service_http_client.dart'; // Asumsikan Anda punya file ini

// Impor UI (Splash Screen)
import 'package:ternakkenari/splash/splash_screen.dart'; // Sesuaikan path jika lokasi SplashScreen Anda berbeda (misal: lib/presentation/splash/splash_screen.dart)

// Jika dibutuhkan (biasanya RegisterRequestModel digunakan di RegisterBloc, bukan langsung di main.dart)
// import 'package:ternakkenari/models/request/register_request_model.dart';


void main() {
  // Inisialisasi ServiceHttpClient sebagai singleton atau di awal
  final ServiceHttpClient serviceHttpClient = ServiceHttpClient();

  // Inisialisasi Repositories, meneruskan instance ServiceHttpClient
  final AuthRepository authRepository = AuthRepository(serviceHttpClient: serviceHttpClient);
  final ProfileBuyerRepository profileBuyerRepository = ProfileBuyerRepository(serviceHttpClient: serviceHttpClient);
  final GetAllBurungTersediaRepository getAllBurungTersediaRepository = GetAllBurungTersediaRepository(serviceHttpClient);

  runApp(
    MultiBlocProvider(
      providers: [
        // Menyediakan instance Bloc ke widget tree
        BlocProvider(
          create: (context) => LoginBloc(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) => ProfileBuyerBloc(profileBuyerRepository: profileBuyerRepository),
        ),
        BlocProvider(
          create: (context) => GetBurungTersediaBloc(getAllBurungTersediaRepository),
        ),
      ],
      child: const MyApp(), // Child dari MultiBlocProvider adalah MyApp
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Direkomendasikan untuk Flutter 3.x
      ),
      home: const SplashScreen(), // Menggunakan SplashScreen sebagai home
    );
  }
}
