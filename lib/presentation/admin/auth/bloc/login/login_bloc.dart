import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ternakkenari/presentation/admin/auth/bloc/login/login_event.dart';
import 'package:ternakkenari/presentation/admin/auth/bloc/login/login_state.dart';
// ignore: duplicate_import
import 'package:ternakkenari/presentation/admin/auth/bloc/login/login_state.dart';
import 'package:ternakkenari/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final result = await authRepository.login(event.requestModel);
    result.fold(
      (l) => emit(LoginFailure(error: l)),
      (r) => emit(LoginSuccess(responseModel: r)),
    );
  }
}