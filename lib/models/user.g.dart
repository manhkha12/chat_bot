// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['user_id'] as String,
      email: json['email'] as String?,
      name: json['full_name'] as String,
      avatarUrl: json['avatar'] as String?,
      address: json['address'] as String?,
      academicStatus: json['academic_status'] as String?,
      lastContact: json['last_contact'] as String?,
      phoneNumber: json['phone'] as String?,
      studentCode: json['student_code'] as String?,
      faculty: json['faculty'] as String?,
      tokenType: json['token_type'] as String?,
      role: json['role'] as String?,
      className: json['class_name'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'email': instance.email,
      'full_name': instance.name,
      'avatar': instance.avatarUrl,
      'address': instance.address,
      'academic_status': instance.academicStatus,
      'last_contact': instance.lastContact,
      'phone': instance.phoneNumber,
      'student_code': instance.studentCode,
      'faculty': instance.faculty,
      'token_type': instance.tokenType,
      'role': instance.role,
      'class_name': instance.className,
    };
