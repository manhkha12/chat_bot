import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    @JsonKey(name: 'user_id') required String id,
    String? email,
    @JsonKey(name: 'full_name') required String name,
    @JsonKey(name: 'avatar') String? avatarUrl,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'academic_status') String? academicStatus,
    @JsonKey(name: 'last_contact') String? lastContact,
    @JsonKey(name: 'phone') String? phoneNumber,
    @JsonKey(name: 'student_code') String? studentCode,
    @JsonKey(name: 'faculty') String? faculty,
    @JsonKey(name: 'token_type') String? tokenType,
    String? role,
    @JsonKey(name: 'class_name') String? className,
    // @JsonKey(name: 'phone_number') String? phoneNumber,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
