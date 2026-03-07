import 'package:bookia_application/features/home/cubit/home_cubit.dart';
import 'package:bookia_application/features/home/data/models/home_slider_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeState>(
    buildWhen: (previous, current) =>
        current is GethomeSliderLoading ||
        current is GethomeSliderSucess ||
        current is GethomeSliderError,

    builder: (context, state) {
      final isLoading =
          state is GethomeSliderLoading ;
      final sliders = state is GethomeSliderSucess
          ? state.sliders
          : <SliderImages>[];

      return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 150.h,
              autoPlay: !isLoading,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: isLoading
                ? [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        width: double.infinity,
                        height: 150.h,
                        color: Colors.grey,
                      ),
                    ),
                  ]
                : sliders
                      .map(
                        (slider) => ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(
                            slider.image ?? '',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .toList(),
          ),
          SizedBox(height: 12.h),
        ],
      );
    },
  );


}
