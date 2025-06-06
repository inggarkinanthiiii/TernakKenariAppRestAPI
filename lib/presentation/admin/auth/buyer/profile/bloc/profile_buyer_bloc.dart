import 'package:bloc/bloc.dart';

sealed class ProfileBuyerEvent {}

class AddProfileBuyerEvent extends ProfileBuyerEvent {
  final BuyerProfileRequestModel requestModel;
  AddProfileBuyerEvent({required this.requestModel});
}

class GetProfileBuyerEvent extends ProfileBuyerEvent {}

sealed class ProfileBuyerState {}

final class ProfileBuyerInitial extends ProfileBuyerState {}

final class ProfileBuyerLoading extends ProfileBuyerState {}

final class ProfileBuyerLoaded extends ProfileBuyerState {
  final BuyerProfileResponseModel profile;
  ProfileBuyerLoaded({required this.profile});
}

final class ProfileBuyerError extends ProfileBuyerState {
  final String message;
  ProfileBuyerError({required this.message});
}

final class ProfileBuyerAdded extends ProfileBuyerState {
  final BuyerProfileResponseModel profile;
  ProfileBuyerAdded({required this.profile});
}

final class ProfileBuyerAddError extends ProfileBuyerState {
  final String message;
  ProfileBuyerAddError({required this.message});
}

class BuyerProfileRequestModel {
  // Define properties as needed
}

class BuyerProfileResponseModel {
  // Define properties as needed
}

abstract class Either<L, R> {
  const Either._();

  factory Either.left(L value) = Left<L, R>;
  factory Either.right(R value) = Right<L, R>;

  T fold<T>(T Function(L l) ifLeft, T Function(R r) ifRight);
}

class Left<L, R> extends Either<L, R> {
  final L value;
  const Left(this.value) : super._();

  @override
  T fold<T>(T Function(L l) ifLeft, T Function(R r) ifRight) => ifLeft(value);
}

class Right<L, R> extends Either<L, R> {
  final R value;
  const Right(this.value) : super._();

  @override
  T fold<T>(T Function(L l) ifLeft, T Function(R r) ifRight) => ifRight(value);
}

class ProfileBuyerRepository {
  Future<Either<String, BuyerProfileResponseModel>> addProfileBuyer(BuyerProfileRequestModel requestModel) async {
    await Future.delayed(Duration(seconds: 2));
    return Right(BuyerProfileResponseModel());
  }

  Future<Either<String, BuyerProfileResponseModel>> getProfileBuyer() async {
    await Future.delayed(Duration(seconds: 2));
    return Right(BuyerProfileResponseModel());
  }
}

class ProfileBuyerBloc extends Bloc<ProfileBuyerEvent, ProfileBuyerState> {
  final ProfileBuyerRepository profileBuyerRepository;

  ProfileBuyerBloc({required this.profileBuyerRepository}) : super(ProfileBuyerInitial()) {
    on<AddProfileBuyerEvent>(_addProfileBuyer);
    on<GetProfileBuyerEvent>(_getProfileBuyer);
  }

  Future<void> _addProfileBuyer(
    AddProfileBuyerEvent event,
    Emitter<ProfileBuyerState> emit,
  ) async {
    emit(ProfileBuyerLoading());
    final result = await profileBuyerRepository.addProfileBuyer(
      event.requestModel,
    );
    result.fold(
      (error) => emit(ProfileBuyerAddError(message: error)),
      (profile) => emit(ProfileBuyerAdded(profile: profile)),
    );
  }

  Future<void> _getProfileBuyer(
    GetProfileBuyerEvent event,
    Emitter<ProfileBuyerState> emit,
  ) async {
    emit(ProfileBuyerLoading());
    final result = await profileBuyerRepository.getProfileBuyer();
    result.fold(
      (error) => emit(ProfileBuyerError(message: error)),
      (profile) => emit(ProfileBuyerLoaded(profile: profile)),
    );
  }
}