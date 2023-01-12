import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/util/app_constants.dart';

class SplashRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  SplashRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> getConfig() async {
    try {
      final response = await dioClient.get(AppConstants.CONFIG_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  void initSharedData() async {
    if (!sharedPreferences.containsKey(AppConstants.INTRO)) {
      sharedPreferences.setBool(AppConstants.INTRO, true);
    }
  }

  String getCurrency() {
    return sharedPreferences.getString(AppConstants.CURRENCY) ?? '';
  }

  void setCurrency(String currencyCode) {
    sharedPreferences.setString(AppConstants.CURRENCY, currencyCode);
  }

  void disableIntro() {
    sharedPreferences.setBool(AppConstants.INTRO, false);
  }

  void enableIntro() {
    sharedPreferences.setBool(AppConstants.INTRO, true);
  }

  bool showIntro() {
    return sharedPreferences.getBool(AppConstants.INTRO);
  }


}
