import 'package:bookia_application/core/services/dio_helper_service.dart';
import 'package:bookia_application/core/utils/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response =  await DioHelperService.post(
        endPoint: ApiConstants.loginEndpoint,
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        debugPrint(response.data['data']['token'].toString());
        await saveToken(response.data['data']['token'].toString());
        return true;
      } else {
        return false;
      }
    }   catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> register({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String name,
  }) async {
    try {
      final response = await DioHelperService.post(
        endPoint: ApiConstants.registerEndpoint,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
          "address": "cairo",
          "city": "cairo",
        },
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("Error response data: ${e.toString()}");
      return false;
    }
  }

  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
