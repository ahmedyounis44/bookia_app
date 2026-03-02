import 'package:bloc/bloc.dart';
import 'package:bookia_application/features/home/data/models/home_slider_model.dart';
import 'package:bookia_application/features/home/data/repo/home_slider_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

 
  getHomeSliders() async {
    emit(GethomeSliderLoading());
    final response = await HomeSliderRepo.gethomeSliders();
    if (response is SliderModel) {
      emit(GethomeSliderSucess(response.data?.sliders ?? []));
    } else {
      emit(GethomeSliderError());
    }
  }
}
