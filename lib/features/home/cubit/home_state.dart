part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GethomeSliderLoading extends HomeState {}

final class GethomeSliderError extends HomeState {}

final class GethomeSliderSucess extends HomeState {
final List<SliderImages> sliders;

  GethomeSliderSucess(this.sliders);
}

final class GetBestSellerLoading extends HomeState {}

final class GetBestSellerError extends HomeState {}

final class GetBestSellerSuccess extends HomeState {
  GetBestSellerSuccess(this.bestSellers);
  final List<BookProduct> bestSellers;
}