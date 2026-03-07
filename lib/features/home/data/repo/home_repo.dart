import 'package:bookia_application/core/services/dio_helper_service.dart';
import 'package:bookia_application/core/utils/api_constants.dart';
import 'package:bookia_application/features/home/data/models/best_seller_model.dart';
import 'package:bookia_application/features/home/data/models/home_slider_model.dart';
import 'package:flutter/material.dart';


class HomeRepo {

  static Future<SliderModel?> gethomeSliders() async {
    try {
      final response = await DioHelperService.get(endPoint: ApiConstants.homeSliderEndpoint);
       if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SliderModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

   static Future<BestSellerModel?> getBestSellers() async {
    try {
      final response = await DioHelperService.get(endPoint: ApiConstants.bestSellersEndPoint);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return BestSellerModel.fromJson(response.data!);
      } else {
        debugPrint(response.data.toString());
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
