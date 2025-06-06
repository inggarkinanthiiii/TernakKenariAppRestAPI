// lib/presentation/home/home_screen.dart (contoh lokasi)
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage() // Atau @MaterialRoute(), dll. tergantung versi auto_route
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('Welcome Home!'),
      ),
    );
  }
}