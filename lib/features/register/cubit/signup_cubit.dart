import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/features/register/cubit/signup_state.dart';
import 'package:smart_home/repository/auth_repository.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;
  SignupCubit({
    required this.authRepository,
  }) : super(SignupState());

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void setFaculty(String faculty) {
    emit(state.copyWith(faculty: faculty));
  }

  void setStudentCode(String studentCode) {
    emit(state.copyWith(studentCode: studentCode));
  }

  void setFullName(String fullName) {
    emit(state.copyWith(fullName: fullName));
  }

  void setClassName(String className) {
    emit(state.copyWith(className: className));
  }

  Future<void> register() async {
    try {
      emit(state.copyWith(isLoading: true, isSignupSuccess: false));

      final params = state.toRegisterParams();
      await authRepository.register(params);
      emit(state.copyWith(isLoading: false, isSignupSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
