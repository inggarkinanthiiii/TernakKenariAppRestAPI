import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:ternakkenari/services/service_http_client.dart';

sealed class GetBurungTersediaEvent {}
class GetAllBurungTersediaEvent extends GetBurungTersediaEvent {}

sealed class GetBurungTersediaState {}
final class GetBurungTersediaInitial extends GetBurungTersediaState {}
final class GetBurungTersediaLoading extends GetBurungTersediaState {}
final class GetBurungTersediaLoaded extends GetBurungTersediaState {
  final BurungSemuaTersediaModel burungTersedia;
  GetBurungTersediaLoaded({required this.burungTersedia});
}
final class GetBurungTersediaError extends GetBurungTersediaState {
  final String message;
  GetBurungTersediaError({required this.message});
}

class BurungSemuaTersediaModel {
  final List<String> daftarBurung;
  BurungSemuaTersediaModel({required this.daftarBurung});
}

class Either<L, R> {
  final L? _left;
  final R? _right;

  Either._(this._left, this._right);

  factory Either.left(L left) => Either._(left, null);
  factory Either.right(R right) => Either._(null, right);

  bool get isLeft => _left != null;
  bool get isRight => _right != null;

  T fold<T>(T Function(L) ifLeft, T Function(R) ifRight) {
    if (isLeft) {
      return ifLeft(_left as L);
    } else {
      return ifRight(_right as R);
    }
  }
}

class GetAllBurungTersediaRepository {
  GetAllBurungTersediaRepository(ServiceHttpClient serviceHttpClient);

  Future<Either<String, BurungSemuaTersediaModel>> getAllBurungTersedia() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final data = BurungSemuaTersediaModel(daftarBurung: ['Lovebird', 'Kenari', 'Parkit']);
      return Either.right(data);
    } catch (e) {
      return Either.left(e.toString());
    }
  }
}


class GetBurungTersediaBloc extends Bloc<GetBurungTersediaEvent, GetBurungTersediaState> {
  final GetAllBurungTersediaRepository getAllBurungTersediaRepository;

  GetBurungTersediaBloc(this.getAllBurungTersediaRepository)
      : super(GetBurungTersediaInitial()) {
    on<GetAllBurungTersediaEvent>(_getAllBurungTersedia);
  }

  Future<void> _getAllBurungTersedia(
    GetAllBurungTersediaEvent event,
    Emitter<GetBurungTersediaState> emit,
  ) async {
    emit(GetBurungTersediaLoading());
    final result = await getAllBurungTersediaRepository.getAllBurungTersedia();
    result.fold(
      (error) => emit(GetBurungTersediaError(message: error)),
      (burungTersedia) => emit(GetBurungTersediaLoaded(burungTersedia: burungTersedia)),
    );
  }
}