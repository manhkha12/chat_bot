import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/features/register/cubit/signup_cubit.dart';
import 'package:smart_home/features/register/cubit/signup_state.dart';
import 'package:smart_home/gen/assets.gen.dart';
import 'package:smart_home/routes.dart';
import 'package:smart_home/shared/extensions/extensions.dart';
import 'package:smart_home/shared/utils/validate_form.dart';
import 'package:smart_home/shared/widgets/app_layout.dart';
import 'package:smart_home/shared/widgets/app_text.dart';
import 'package:smart_home/shared/widgets/app_text_form_field.dart';
import 'package:smart_home/shared/widgets/buttons/app_button.dart';
import 'package:smart_home/shared/widgets/simple_toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _passwordVisibleNotifier = ValueNotifier(false);
  final ValueNotifier<bool> _rePasswordVisibleNotifier = ValueNotifier(false);
  final TextEditingController passwordController = TextEditingController();
  late final SignupCubit signupCubit;

  @override
  void initState() {
    signupCubit = context.read<SignupCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;

    return AppLayout(
      child: SafeArea(
        child: Form(
          key: formKey,
          child: BlocListener<SignupCubit, SignupState>(
            listener: (context, state) {
              state.error?.whenOrNull(
                data: (error, _) => showErrorToast(error),
              );
              if (state.isSignupSuccess) {
                showSuccessToast('Đăng ký thành công');

                Navigator.of(context).pushReplacementNamed(RouteName.login);
              }
            },
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.06, vertical: height * 0.02),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              decoration: BoxDecoration(
                                color: context.colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Assets.icons.leftChevon.svg()),
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          AppText(
                            'Create Your Account',
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.bold,
                            color: context.colors.black,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: height * 0.02),

                          // Full Name Field
                          AppTextFormField(
                            borderRadius: BorderRadius.circular(width * 0.025),
                            onChanged: (value) =>
                                signupCubit.setFullName(value),
                            hintText: 'Enter Your Full Name',
                            prefixIcon: SizedBox(
                              width: width * 0.05,
                              height: width * 0.05,
                              child: Center(
                                child: Icon(
                                  Icons.person_outline,
                                  size: width * 0.05,
                                  color: context.colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),

                          // Student Code Field
                          AppTextFormField(
                            borderRadius: BorderRadius.circular(width * 0.025),
                            onChanged: (value) =>
                                signupCubit.setStudentCode(value),
                            hintText: 'Enter Your Student Code',
                            prefixIcon: SizedBox(
                              width: width * 0.05,
                              height: width * 0.05,
                              child: Center(
                                child: Icon(
                                  Icons.badge_outlined,
                                  size: width * 0.05,
                                  color: context.colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),

                          // Class Name Field
                          AppTextFormField(
                            borderRadius: BorderRadius.circular(width * 0.025),
                            hintText: 'Enter Your Class Name',
                            onChanged: (value) =>
                                signupCubit.setClassName(value),
                            prefixIcon: SizedBox(
                              width: width * 0.05,
                              height: width * 0.05,
                              child: Center(
                                child: Icon(
                                  Icons.class_outlined,
                                  size: width * 0.05,
                                  color: context.colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),

                          // Faculty Field
                          AppTextFormField(
                            borderRadius: BorderRadius.circular(width * 0.025),
                            onChanged: (value) => signupCubit.setFaculty(value),
                            hintText: 'Enter Your Faculty',
                            prefixIcon: SizedBox(
                              width: width * 0.05,
                              height: width * 0.05,
                              child: Center(
                                child: Icon(
                                  Icons.school_outlined,
                                  size: width * 0.05,
                                  color: context.colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),

                          // Email Field
                          AppTextFormField(
                            borderRadius: BorderRadius.circular(width * 0.025),
                            onChanged: (value) => signupCubit.setEmail(value),
                            validator: (value) {
                              return Validation.validateEmail(value);
                            },
                            hintText: 'Enter Your Email',
                            prefixIcon: SizedBox(
                              width: width * 0.05,
                              height: width * 0.05,
                              child: Center(
                                child: Assets.icons.email.svg(
                                  width: width * 0.05,
                                  height: width * 0.05,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),

                          // Password Field
                          ValueListenableBuilder<bool>(
                            valueListenable: _passwordVisibleNotifier,
                            builder: (context, isOn, _) {
                              return AppTextFormField(
                                onChanged: (value) =>
                                    signupCubit.setPassword(value),
                                prefixIcon: SizedBox(
                                  width: width * 0.05,
                                  height: width * 0.05,
                                  child: Center(
                                    child: Assets.icons.lock.svg(
                                      width: width * 0.05,
                                      height: width * 0.05,
                                    ),
                                  ),
                                ),
                                borderRadius:
                                    BorderRadius.circular(width * 0.025),
                                controller: passwordController,
                                hintText: 'Enter Your Password',
                                validator: (value) {
                                  return Validation.validatePass(value);
                                },
                                obscured: !isOn,
                                suffixIcon: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    _passwordVisibleNotifier.value = !isOn;
                                  },
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                        maxWidth: 34, maxHeight: 34),
                                    child: Center(
                                      child: (!isOn
                                              ? Assets.icons.eyeOff
                                              : Assets.icons.eyeOn)
                                          .svg(
                                        width: 18,
                                        color: context.colors.placeholderColor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: height * 0.02),

                          // Repeat Password Field
                          ValueListenableBuilder<bool>(
                            valueListenable: _rePasswordVisibleNotifier,
                            builder: (context, isOn, _) {
                              return AppTextFormField(
                                prefixIcon: SizedBox(
                                  width: width * 0.05,
                                  height: width * 0.05,
                                  child: Center(
                                    child: Assets.icons.lock.svg(
                                      width: width * 0.05,
                                      height: width * 0.05,
                                    ),
                                  ),
                                ),
                                borderRadius:
                                    BorderRadius.circular(width * 0.025),
                                hintText: 'Repeat Your Password',
                                obscured: !isOn,
                                validator: (value) {
                                  return Validation.validateRePass(
                                      value, passwordController.text);
                                },
                                suffixIcon: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    _rePasswordVisibleNotifier.value = !isOn;
                                  },
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                        maxWidth: 34, maxHeight: 34),
                                    child: Center(
                                      child: (!isOn
                                              ? Assets.icons.eyeOff
                                              : Assets.icons.eyeOn)
                                          .svg(
                                        width: 18,
                                        color: context.colors.placeholderColor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: height * 0.04),

                          // Register Button
                          BlocBuilder<SignupCubit, SignupState>(
                              builder: (context, state) {
                            final isValid = state.isValid;
                            return AppButton(
                                label: 'Register',
                                radius: BorderRadius.circular(width * 0.025),
                                primaryColor: context.colors.black,
                                onPressed: () {
                                  var valid = formKey.currentState!.validate();
                                  if (valid) {
                                    signupCubit.register();
                                  }
                                });
                          }),
                          SizedBox(height: height * 0.02),

                          // Sign In Link
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Already Have An Account? ",
                                style: TextStyle(
                                  color: context.colors.black.withOpacity(0.5),
                                  fontSize: width * 0.04,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: AppText(
                                        'Sign In',
                                        style: TextStyle(
                                          color: context.colors.black,
                                          fontSize: width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(height: height * 0.03),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: context.colors.divider,
                  height: 1,
                ),
                SizedBox(height: height * 0.02),
                AppText(
                  'Continue with Accounts',
                  fontSize: width * 0.04,
                  color: context.colors.black.withOpacity(0.5),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Assets.icons.google.svg(
                        width: width * 0.09,
                        height: width * 0.09,
                      ),
                    ),
                    SizedBox(width: width * 0.08),
                    IconButton(
                      onPressed: () {},
                      icon: Assets.icons.team.svg(
                        width: width * 0.1,
                        height: width * 0.1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
