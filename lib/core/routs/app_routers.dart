import 'package:bookia_application/core/routs/app_routs.dart';
import 'package:bookia_application/features/auth/cubit/auth_cubit.dart';
import 'package:bookia_application/features/auth/presentation/login.dart';
import 'package:bookia_application/features/auth/presentation/register.dart';
import 'package:bookia_application/features/on_boarding/presentation/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const Welcome());
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: Login(),
          ),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: Register(),
          ),
        );
      /*case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit()..getHomeSliders(),
            child: HomeScreen(),
          ),
        );*/
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
