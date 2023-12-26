// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:financemanagement/core/errors/failure.dart';
import 'package:financemanagement/src/domain/usecases/login_usecase.dart';
import 'package:financemanagement/src/domain/usecases/signup_usecase.dart';

import '../../../domain/entities/user_entity.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  AuthCubit({required this.loginUseCase, required this.signupUseCase})
      : super(const AuthState(isLoading: false, isSuccess: false, error: ''));

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, error: ''));

    Either<Failure, UserEntity> result = await loginUseCase(email, password);

    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false,
            isSuccess: false,
            error: l.toString())), (r) async {
      emit(state.copyWith(isLoading: false, isSuccess: true, user: r));
    });
  }

  Future<void> signUp({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, error: ''));
    Either<Failure, UserEntity> result = await signupUseCase(email, password);
    result.fold(
        (error) => emit(state.copyWith(
            isLoading: false,
            isSuccess: false,
            error: error.toString())), (user) async {
      emit(state.copyWith(isLoading: false, isSuccess: true, user: user));
    });
  }
}
