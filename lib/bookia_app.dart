import 'package:bookia_application/features/home/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(fontFamily: 'dmserif'),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
