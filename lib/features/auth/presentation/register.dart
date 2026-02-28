import 'package:bookia_application/core/services/validator_service.dart';
import 'package:bookia_application/core/shared_widgets/app_button.dart';
import 'package:bookia_application/core/shared_widgets/app_textform_filed.dart';
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/features/auth/cubit/auth_cubit.dart';
import 'package:bookia_application/features/home/presentation/home.dart';
import 'package:bookia_application/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookia_application/core/shared_widgets/app_back_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<Register> {
  bool isPassword = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBackButton(),
                SizedBox(height: 29.h),
                Text(
                  LocaleKeys.registertitle.tr(),
                  style: AppTextStyle.title24,
                ),

                SizedBox(height: 32.h),
                AppTextFormFild(
                  color: AppColors.hintTextColor,
                  hintText: LocaleKeys.hint_text_user_name.tr(),
                  isPassword: false,
                  controller: _userNameController,
                  validator: ValidatorService.validateName,
                ),
                SizedBox(height: 15.h),
                AppTextFormFild(
                  color: AppColors.hintTextColor,
                  hintText: LocaleKeys.hint_text_email.tr(),
                  isPassword: false,
                  controller: _emailController,
                  validator: ValidatorService.validateEmail,
                ),
                SizedBox(height: 15.h),
                AppTextFormFild(
                  color: AppColors.hintTextColor,
                  hintText: LocaleKeys.hint_text_password.tr(),
                  isPassword: isPassword = true,
                  controller: _passwordController,
                  validator: ValidatorService.validatePassword,
                ),
                SizedBox(height: 15.h),
                AppTextFormFild(
                  color: AppColors.hintTextColor,
                  hintText: LocaleKeys.hint_text_confirm_password.tr(),
                  isPassword: isPassword = true,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30.h),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSucessState) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } else if (state is AuthErrorState) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(title: Text('Register Error')),
                      );
                    }
                  },
                  child: AppButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().authRegister(
                          email: _emailController.text,
                          password: _passwordController.text,
                          passwordConfirmation: _confirmPasswordController.text,
                          name: _userNameController.text,
                        );
                      }
                    },
                    color: AppColors.primaryColor,
                    title: LocaleKeys.register.tr(),
                    textStyle: AppTextStyle.text14regular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 120.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.already_have_account.tr(),
                      style: AppTextStyle.text14regular,
                    ),
                    TextButton(
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          // ignore: inference_failure_on_instance_creation
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );*/
                      },
                      child: Text(
                        LocaleKeys.login_now.tr(),
                        style: AppTextStyle.text14regular.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
