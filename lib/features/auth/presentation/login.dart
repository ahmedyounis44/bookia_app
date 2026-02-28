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

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  bool isPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                Text(LocaleKeys.Logintitle.tr(), style: AppTextStyle.title24),

                SizedBox(height: 32.h),
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
                SizedBox(height: 13.h),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        LocaleKeys.forgot_password.tr(),
                        style: AppTextStyle.text14regular,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13.h),
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
                            AlertDialog(title: Text('Login Error')),
                      );
                    }
                  },
                  child: AppButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().authLogin(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
                    color: AppColors.primaryColor,
                    title: LocaleKeys.login.tr(),
                    textStyle: AppTextStyle.text14regular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                const Divider(),
                Center(child: Text(LocaleKeys.or.tr())),
                SizedBox(height: 34.h),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300.w,
                        height: 65.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: BoxBorder.all(color: Colors.grey, width: 1.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.g_mobiledata,
                              size: 20.w,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10.w),
                            Text(LocaleKeys.login_with_google.tr()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300.w,
                        height: 65.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: BoxBorder.all(color: Colors.grey, width: 1.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.apple, size: 20.w, color: Colors.black),
                            SizedBox(width: 10.w),
                            Text(LocaleKeys.login_with_apple.tr()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 34.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        LocaleKeys.dont_have_account.tr(),
                        style: AppTextStyle.text14regular,
                      ),
                    ),
                    Text(
                      LocaleKeys.register_now.tr(),
                      style: AppTextStyle.text14regular.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
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
