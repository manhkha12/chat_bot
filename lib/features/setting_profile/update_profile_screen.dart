import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/features/setting_profile/cubit/profile_student_cubit.dart';
import 'package:smart_home/features/setting_profile/cubit/profile_student_state.dart';
import 'package:smart_home/gen/assets.gen.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/shared/extensions/extensions.dart';
import 'package:smart_home/shared/utils/validate_form.dart';
import 'package:smart_home/shared/widgets/app_text.dart';

class UpdateProfileScreenArguments {
  final ProfileStudentCubit cubit;
  final User user;

  UpdateProfileScreenArguments({
    required this.cubit,
    required this.user,
  });
}

class UpdateProfileScreen extends StatefulWidget {
  final User user;
  const UpdateProfileScreen({super.key, required this.user});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();

    // Khởi tạo controllers với dữ liệu từ user
    _nameController = TextEditingController(
      text: widget.user.name,
    );
    _emailController = TextEditingController(
      text: widget.user.email ?? '',
    );
    _phoneController = TextEditingController(
      text: widget.user.phoneNumber ?? '',
    );
    _addressController = TextEditingController(
      text: widget.user.address ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const AppText(
          'Cập nhật thông tin',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: BlocListener<ProfileStudentCubit, ProfileStudentState>(
        listenWhen: (previous, current) {
          // Chỉ listen khi isSignupSuccess thay đổi từ false -> true
          return !previous.isSignupSuccess && current.isSignupSuccess;
        },
        listener: (context, state) {
          if (state.isSignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cập nhật thông tin thành công!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Avatar Section
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.colors.easyColor.withOpacity(0.3),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: widget.user.avatarUrl != null &&
                                  widget.user.avatarUrl!.isNotEmpty
                              ? Image.network(
                                  widget.user.avatarUrl!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Assets.images.accountOwner.image(
                                      fit: BoxFit.cover,
                                    );
                                  },
                                )
                              : Assets.images.accountOwner.image(
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            // TODO: Implement image picker
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Chọn ảnh đại diện'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: context.colors.easyColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      context.colors.easyColor.withOpacity(0.3),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Form Fields
                  _buildTextField(
                    controller: _nameController,
                    label: 'Họ và tên',
                    icon: Icons.person_outline_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập họ tên';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập email';
                      }
                      return Validation.validateEmail(value);
                    },
                  ),

                  const SizedBox(height: 16),

                  _buildTextField(
                    controller: _phoneController,
                    label: 'Số điện thoại',
                    icon: Icons.phone_outlined,
                    hint: _phoneController.text.isEmpty
                        ? 'Chưa có thông tin'
                        : null,
                    onChanged: (value) {
                      context.read<ProfileStudentCubit>().setPhoneNumber(value);
                    },
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 16),

                  _buildTextField(
                    controller: _addressController,
                    label: 'Địa chỉ',
                    icon: Icons.location_on_outlined,
                    hint: _addressController.text.isEmpty
                        ? 'Chưa có thông tin'
                        : null,
                    onChanged: (value) {
                      context.read<ProfileStudentCubit>().setAddress(value);
                    },
                  ),

                  const SizedBox(height: 40),

                  // Save Button with BlocBuilder
                  BlocBuilder<ProfileStudentCubit, ProfileStudentState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<ProfileStudentCubit>()
                                        .updateProfileStudent();
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.colors.easyColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                            disabledBackgroundColor:
                                context.colors.easyColor.withOpacity(0.5),
                          ),
                          child: state.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Lưu thay đổi',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
          prefixIcon: Icon(icon, color: context.colors.easyColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
