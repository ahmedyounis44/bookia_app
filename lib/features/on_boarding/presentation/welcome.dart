import 'package:bookia_application/core/routs/app_routs.dart';
import 'package:bookia_application/core/shared_widgets/app_button.dart';
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/core/theme/app_text_style.dart';
import 'package:bookia_application/core/utils/extenstions.dart';
import 'package:bookia_application/features/auth/presentation/login.dart';
import 'package:bookia_application/features/auth/presentation/register.dart';
import 'package:bookia_application/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/welcomebackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Row(
                children: [
                  InkWell(
                    child: Icon(Icons.language, color: AppColors.accentColor),
                    onTap: () {
                      if (context.locale.languageCode == 'en') {
                        context.setLocale(const Locale('ar'));
                      } else {
                        context.setLocale(const Locale('en'));
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 115.h),
              Image.asset("assets/images/logo.png"),
              SizedBox(height: 28.h),
              Text(
                LocaleKeys.welcometitle.tr(),
                style: AppTextStyle.text20regular,
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: AppButton(
                  onPressed: () {
                     context.pushNamed(AppRoutes.login);
                  },
                  color: AppColors.primaryColor,
                  title: LocaleKeys.login.tr(),
                  textStyle: AppTextStyle.text14regular.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: AppButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.register);
                  },
                  color: AppColors.secondaryColor,
                  title: LocaleKeys.register.tr(),
                  textStyle: AppTextStyle.text14regular
                  
                ),
              ),
              SizedBox(height: 94.h),
            ],
          ),
        ),
      ),
    );
  }
}
