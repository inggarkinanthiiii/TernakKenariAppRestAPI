import 'package:flutter/material.dart';

class ProfileViewBuyer extends StatelessWidget {
  final Data profile;

  const ProfileViewBuyer({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nama: ${profile.name}",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Alamat: ${profile.address}",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            Text(
              "No HP: ${profile.phone}",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                context.pushAndRemoveUntil(
                  const BuyerHomeScreen(),
                  (route) => false,
                );
              },
              child: const Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}

// Assuming you have a Data class and BuyerHomeScreen defined elsewhere
// For example:
class Data {
  final String name;
  final String address;
  final String phone;

  Data({required this.name, required this.address, required this.phone});
}

class BuyerHomeScreen extends StatelessWidget {
  const BuyerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buyer Home Screen')),
      body: const Center(child: Text('Welcome to Buyer Home!')),
    );
  }
}

// You might also need an extension for Navigator, or use Navigator.pushAndRemoveUntil directly
extension NavigationExtension on BuildContext {
  void pushAndRemoveUntil(Widget screen, bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      predicate,
    );
  }
}