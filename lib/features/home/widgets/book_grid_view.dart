
import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/features/home/cubit/home_cubit.dart';
import 'package:bookia_application/features/home/data/models/best_seller_model.dart';
import 'package:bookia_application/features/home/widgets/book_card.dart';
import 'package:bookia_application/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookGridView extends StatelessWidget {
  const BookGridView({super.key});



  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        LocaleKeys.home_best_seller.tr(),
        style: TextStyle(
          fontFamily: 'DM Serif Display',
          fontSize: 24.sp,
          color: AppColors.darkTextColor,
        ),
      ),
      SizedBox(height: 10.h),
      BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is GetBestSellerLoading ||
            current is GetBestSellerSuccess ||
            current is GetBestSellerError,
           builder: (context, state) {
          final books = state is GetBestSellerSuccess
              ? state.bestSellers
              : <BookProduct>[] ;

        return  GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: books.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 0.58,
              ),
              itemBuilder: (context, index) => BookCard(product: books[index]),
            );
           
        },
      ),
    ],
  );
}