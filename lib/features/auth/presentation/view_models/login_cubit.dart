import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/features/auth/domain/auth_repository.dart';
import 'package:flutter_application_2/features/auth/presentation/view_models/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginStateInitial());

  final repo = GetIt.instance.get<AuthRepository>();

  Future<void> logIn(String email, String password) async {
    try {
      emit(LoginStateLoading());
      User? user = await repo.tryLoginWithEmailAndPassword(email, password);
      emit(LoginStateSuccess(user));
    } catch (e) {
      emit(LoginStateFailure(e.toString()));
    }
  }
}
