import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/features/setting_profile/cubit/profile_student_state.dart';
import 'package:smart_home/models/app_error.dart';
import 'package:smart_home/repository/user_repository.dart';

class ProfileStudentCubit extends Cubit<ProfileStudentState> {
  final UserRepository userRepository;
  ProfileStudentCubit({
    required this.userRepository,
  }) : super(ProfileStudentState());

  void setPhoneNumber(String phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }
  void setAddress(String address) {
    emit(state.copyWith(address: address));
  }
  void setAvatarUrl(String avatarUrl) {
    emit(state.copyWith(avatarUrl: avatarUrl));
  }


  Future<void> getProfileStudent() async {
    try {
      emit(state.copyWith(isLoading: true,isSignupSuccess: false));

      final user = await userRepository.profileStudent();
      emit(state.copyWith(isLoading: false, user: user,isSignupSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isSignupSuccess: false));
    }
  }

  Future<void> updateProfileStudent() async {
    try {
      emit(state.copyWith(isLoading: true,isSignupSuccess: false));
      final params = state.updateProfileParams();
      final user = await userRepository.updateProfileStudent(params);
      emit(state.copyWith(isLoading: false, user: user,isSignupSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isSignupSuccess: false));
    }
  }
}