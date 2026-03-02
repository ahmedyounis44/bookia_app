import 'package:bookia_application/core/services/dio_helper_service.dart';
import 'package:bookia_application/core/utils/api_constants.dart';
import 'package:bookia_application/features/home/data/models/home_slider_model.dart';


class HomeSliderRepo {

  static Future<SliderModel?> gethomeSliders() async {
    try {
      final response = await DioHelperService.get(endPoint: ApiConstants.homeSliderEndpoint);
      if (response.statusCode == 200) {
        return SliderModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
