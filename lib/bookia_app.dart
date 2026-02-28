
import 'package:bookia_application/core/routs/app_routers.dart';
import 'package:bookia_application/core/routs/app_routs.dart';
import 'package:bookia_application/features/on_boarding/presentation/welcome.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key, this.token});
    final String? token;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(fontFamily: 'dmserif'),
          debugShowCheckedModeBanner: false,
         initialRoute: startRout(),
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }

   String startRout() {
    if (token == null) {
      return AppRoutes.onboarding;
    } else {
      return AppRoutes.home;
    }
  }
}
