// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'user_id')
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_status')
  String? get academicStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_contact')
  String? get lastContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_code')
  String? get studentCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'faculty')
  String? get faculty => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String? get tokenType => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'class_name')
  String? get className => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String id,
      String? email,
      @JsonKey(name: 'full_name') String name,
      @JsonKey(name: 'avatar') String? avatarUrl,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'academic_status') String? academicStatus,
      @JsonKey(name: 'last_contact') String? lastContact,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'student_code') String? studentCode,
      @JsonKey(name: 'faculty') String? faculty,
      @JsonKey(name: 'token_type') String? tokenType,
      String? role,
      @JsonKey(name: 'class_name') String? className});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? address = freezed,
    Object? academicStatus = freezed,
    Object? lastContact = freezed,
    Object? phoneNumber = freezed,
    Object? studentCode = freezed,
    Object? faculty = freezed,
    Object? tokenType = freezed,
    Object? role = freezed,
    Object? className = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      academicStatus: freezed == academicStatus
          ? _value.academicStatus
          : academicStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      lastContact: freezed == lastContact
          ? _value.lastContact
          : lastContact // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCode: freezed == studentCode
          ? _value.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      faculty: freezed == faculty
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      className: freezed == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String id,
      String? email,
      @JsonKey(name: 'full_name') String name,
      @JsonKey(name: 'avatar') String? avatarUrl,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'academic_status') String? academicStatus,
      @JsonKey(name: 'last_contact') String? lastContact,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'student_code') String? studentCode,
      @JsonKey(name: 'faculty') String? faculty,
      @JsonKey(name: 'token_type') String? tokenType,
      String? role,
      @JsonKey(name: 'class_name') String? className});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? address = freezed,
    Object? academicStatus = freezed,
    Object? lastContact = freezed,
    Object? phoneNumber = freezed,
    Object? studentCode = freezed,
    Object? faculty = freezed,
    Object? tokenType = freezed,
    Object? role = freezed,
    Object? className = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      academicStatus: freezed == academicStatus
          ? _value.academicStatus
          : academicStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      lastContact: freezed == lastContact
          ? _value.lastContact
          : lastContact // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCode: freezed == studentCode
          ? _value.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      faculty: freezed == faculty
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      className: freezed == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  _$UserImpl(
      {@JsonKey(name: 'user_id') required this.id,
      this.email,
      @JsonKey(name: 'full_name') required this.name,
      @JsonKey(name: 'avatar') this.avatarUrl,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'academic_status') this.academicStatus,
      @JsonKey(name: 'last_contact') this.lastContact,
      @JsonKey(name: 'phone') this.phoneNumber,
      @JsonKey(name: 'student_code') this.studentCode,
      @JsonKey(name: 'faculty') this.faculty,
      @JsonKey(name: 'token_type') this.tokenType,
      this.role,
      @JsonKey(name: 'class_name') this.className});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String id;
  @override
  final String? email;
  @override
  @JsonKey(name: 'full_name')
  final String name;
  @override
  @JsonKey(name: 'avatar')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'academic_status')
  final String? academicStatus;
  @override
  @JsonKey(name: 'last_contact')
  final String? lastContact;
  @override
  @JsonKey(name: 'phone')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'student_code')
  final String? studentCode;
  @override
  @JsonKey(name: 'faculty')
  final String? faculty;
  @override
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @override
  final String? role;
  @override
  @JsonKey(name: 'class_name')
  final String? className;

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, avatarUrl: $avatarUrl, address: $address, academicStatus: $academicStatus, lastContact: $lastContact, phoneNumber: $phoneNumber, studentCode: $studentCode, faculty: $faculty, tokenType: $tokenType, role: $role, className: $className)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.academicStatus, academicStatus) ||
                other.academicStatus == academicStatus) &&
            (identical(other.lastContact, lastContact) ||
                other.lastContact == lastContact) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.studentCode, studentCode) ||
                other.studentCode == studentCode) &&
            (identical(other.faculty, faculty) || other.faculty == faculty) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.className, className) ||
                other.className == className));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      name,
      avatarUrl,
      address,
      academicStatus,
      lastContact,
      phoneNumber,
      studentCode,
      faculty,
      tokenType,
      role,
      className);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {@JsonKey(name: 'user_id') required final String id,
      final String? email,
      @JsonKey(name: 'full_name') required final String name,
      @JsonKey(name: 'avatar') final String? avatarUrl,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'academic_status') final String? academicStatus,
      @JsonKey(name: 'last_contact') final String? lastContact,
      @JsonKey(name: 'phone') final String? phoneNumber,
      @JsonKey(name: 'student_code') final String? studentCode,
      @JsonKey(name: 'faculty') final String? faculty,
      @JsonKey(name: 'token_type') final String? tokenType,
      final String? role,
      @JsonKey(name: 'class_name') final String? className}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get id;
  @override
  String? get email;
  @override
  @JsonKey(name: 'full_name')
  String get name;
  @override
  @JsonKey(name: 'avatar')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'academic_status')
  String? get academicStatus;
  @override
  @JsonKey(name: 'last_contact')
  String? get lastContact;
  @override
  @JsonKey(name: 'phone')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'student_code')
  String? get studentCode;
  @override
  @JsonKey(name: 'faculty')
  String? get faculty;
  @override
  @JsonKey(name: 'token_type')
  String? get tokenType;
  @override
  String? get role;
  @override
  @JsonKey(name: 'class_name')
  String? get className;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
