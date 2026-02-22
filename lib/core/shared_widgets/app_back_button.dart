import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => Navigator.pop(context),
    child: Container(
      width: 41.w,
      height: 41.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey, 
          width: .5.w, 
        ),
      ),
      child: Center(child: Icon(Icons.arrow_back_ios_new, size: 24.w)),
    ),
  );
}
