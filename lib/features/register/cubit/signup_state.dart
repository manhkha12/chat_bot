import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/models/app_error.dart';
part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  factory SignupState({
    String? username,
    String? email,
    String? password,
    String? fullName,
    String? confirmPassword,
    String? studentCode,
    String? className,
    String? faculty,
    @Default(false) bool isLoading,
    @Default(false) bool isSignupSuccess,
    AppError? error,
  }) = _SignupState;
  SignupState._();

  Map<String, dynamic> toRegisterParams() {
    return {
      'email': email,
      'password': password,
      'full_name': fullName,
      'student_code': studentCode,
      'class_name': className,
      'faculty': faculty
    };
  }

  bool get isValid =>
      (email?.isNotEmpty ?? false) &&
      (password?.isNotEmpty ?? false) &&
      (username?.isNotEmpty ?? false);
}
