import 'package:bloc/bloc.dart';
import '../repo/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      await authRepository.login(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> signup(String email, String password, String role, {required String name, required String location, required String occupation, required int age} ) async {
    try {
      emit(AuthLoading());
      await authRepository.signup(email, password, role, name: name, location: location, occupation: occupation, age: age);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
