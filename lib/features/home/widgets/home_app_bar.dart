import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          SvgPicture.asset("assets/images/logo.png", width: 24.w, height: 24.h),
          SizedBox(width: 7.w),
        ],
      ),
      SvgPicture.asset("assets/images/search-normal.png", width: 24.w),
    ],
  );
}