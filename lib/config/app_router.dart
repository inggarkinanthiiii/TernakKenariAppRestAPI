// lib/config/app_router.dart
import 'package:auto_route/auto_route.dart';
import 'package:ternakkenari/presentation/home/home_screen.dart';
import 'package:ternakkenari/presentation/admin/auth/login_screen.dart'; // <--- Impor LoginScreen Anda

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: LoginRoute.page, path: '/login'), // <--- Tambahkan rute ini
        // Tambahkan rute lain di sini
      ];
}