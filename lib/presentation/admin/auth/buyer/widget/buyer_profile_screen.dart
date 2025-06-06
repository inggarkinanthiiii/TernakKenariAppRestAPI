import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// --- Placeholder untuk kelas-kelas yang tidak ada di gambar ini ---
// Anda harus memastikan definisi sebenarnya ada di proyek Anda.

sealed class ProfileBuyerEvent {}
class GetProfileBuyerEvent extends ProfileBuyerEvent {}
class AddProfileBuyerEvent extends ProfileBuyerEvent {
  final BuyerProfileRequestModel requestModel;
  AddProfileBuyerEvent({required this.requestModel});
}

sealed class ProfileBuyerState {}
class ProfileBuyerInitial extends ProfileBuyerState {}
class ProfileBuyerLoading extends ProfileBuyerState {}
class ProfileBuyerLoaded extends ProfileBuyerState {
  final BuyerProfileResponseModel profile;
  ProfileBuyerLoaded({required this.profile});
}
class ProfileBuyerAdded extends ProfileBuyerState {
  final BuyerProfileResponseModel profile;
  ProfileBuyerAdded({required this.profile});
}
class ProfileBuyerError extends ProfileBuyerState {
  final String message;
  ProfileBuyerError({required this.message});
}
class ProfileBuyerAddError extends ProfileBuyerState {
  final String message;
  ProfileBuyerAddError({required this.message});
}

class ProfileBuyerBloc extends Bloc<ProfileBuyerEvent, ProfileBuyerState> {
  ProfileBuyerBloc() : super(ProfileBuyerInitial());
}

class BuyerProfileRequestModel {
  // Define properties as needed
}

class BuyerProfileResponseModel {
  final DataProfile data;
  BuyerProfileResponseModel({required this.data});
}

class DataProfile {
  final String name;
  final String address;
  final String phone;

  DataProfile({required this.name, required this.address, required this.phone});

  bool get isNotEmpty => name.isNotEmpty || address.isNotEmpty || phone.isNotEmpty;
}

class ProfileViewBuyer extends StatelessWidget {
  final DataProfile profile;
  const ProfileViewBuyer({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile View Buyer"));
  }
}

class ProfileBuyerInputForm extends StatelessWidget {
  const ProfileBuyerInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Buyer Input Form"));
  }
}
// --- Akhir Placeholder ---

class BuyerProfileScreen extends StatefulWidget {
  const BuyerProfileScreen({super.key});

  @override
  State<BuyerProfileScreen> createState() => _BuyerProfileScreenState();
}

class _BuyerProfileScreenState extends State<BuyerProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Ambil profil pembeli saat halaman dimuat
    context.read<ProfileBuyerBloc>().add(GetProfileBuyerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Pembeli")),
      body: BlocListener<ProfileBuyerBloc, ProfileBuyerState>(
        listener: (context, state) {
          if (state is ProfileBuyerAdded) {
            // Refresh profil setelah tambah
            context.read<ProfileBuyerBloc>().add(GetProfileBuyerEvent());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Profil berhasil ditambahkan")),
            );
          }
        },
        child: BlocBuilder<ProfileBuyerBloc, ProfileBuyerState>(
          builder: (context, state) {
            if (state is ProfileBuyerLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfileBuyerLoaded && state.profile.data.isNotEmpty) {
              final profile = state.profile.data;
              return ProfileViewBuyer(profile: profile);
            }

            // Default ke form jika tidak ada data atau error
            return const ProfileBuyerInputForm();
          },
        ),
      ),
    );
  }
}