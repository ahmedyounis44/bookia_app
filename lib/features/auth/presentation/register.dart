import 'package:bookia_application/core/shared_widgets/app_button.dart';
import 'package:bookia_application/core/shared_widgets/app_textform_filed.dart';
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookia_application/core/shared_widgets/app_back_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<Register> {
  bool isPassword = false;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBackButton(),
              SizedBox(height: 29.h),
              Text(LocaleKeys.registertitle.tr(), style: AppTextStyle.title24),

              SizedBox(height: 32.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: LocaleKeys.hint_text_user_name.tr(),
                isPassword: false,
              ),
              SizedBox(height: 15.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: LocaleKeys.hint_text_email.tr(),
                isPassword: false,
              ),
              SizedBox(height: 15.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: LocaleKeys.hint_text_password.tr(),
                isPassword: isPassword = true,
              ),
              SizedBox(height: 15.h),
              AppTextFormFild(
                color: AppColors.hintTextColor,
                hintText: LocaleKeys.hint_text_confirm_password.tr(),
                isPassword: isPassword = true,
              ),
              
              SizedBox(height: 30.h),
              AppButton(
                onPressed: () {},
                color: AppColors.primaryColor,
                title: LocaleKeys.register_now.tr(),
                textStyle: AppTextStyle.text14regular.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 120.h),
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
                      LocaleKeys.already_have_account.tr(),
                      style: AppTextStyle.text14regular,
                    ),
                  ),
                  Text(
                    LocaleKeys.login_now.tr(),
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
  );
}
