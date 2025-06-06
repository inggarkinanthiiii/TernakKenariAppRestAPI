import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ternakkenari/presentation/admin/auth/bloc/register/register_event.dart';
import 'package:ternakkenari/presentation/admin/auth/bloc/register/register_state.dart';
import 'package:ternakkenari/repositories/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository}) : super(RegisterInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    final result = await authRepository.register(event.requestModel);
    result.fold(
      (l) => emit(RegisterFailure(error: l)),
      (r) => emit(RegisterSuccess(message: r)),
    );
  }
}