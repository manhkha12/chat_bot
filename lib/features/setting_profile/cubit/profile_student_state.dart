import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/models/app_error.dart';
import 'package:smart_home/models/user.dart';
part 'profile_student_state.freezed.dart';
@freezed
class ProfileStudentState with _$ProfileStudentState{
  factory ProfileStudentState({
    final User? user,
    final String? avatarUrl,
    final String? address,
    final String? phoneNumber,
    @Default(false) bool isLoading,
    @Default(false) bool isSignupSuccess,
    AppError? error,
  }) = _ProfileStudentState;

  ProfileStudentState._();
  Map<String, dynamic> updateProfileParams() {
    return {
  
      'avatar': avatarUrl,
      'address': address,
      'phone': phoneNumber,
   


    };
  }
}