import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/body/login_model.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/response/user_model.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> registration(UserModel register) async {
    try {
      Response response = await dioClient.post(
        AppConstants.REGISTRATION_URI,
        data: register.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> login(LoginModel loginBody) async {
    try {
      Response response = await dioClient.post(
        AppConstants.LOGIN_URI,
        data: loginBody.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.USER_USERNAME);
  }

  Future<bool> clearSharedData() async {
    //sharedPreferences.remove(AppConstants.CART_LIST);
    sharedPreferences.remove(AppConstants.CURRENCY);
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.USER);
    // FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
    return true;
  }

  // for verify Username
  Future<ApiResponse> checkUsername(String username) async {
    try {
      Response response = await dioClient.post(AppConstants.CHECK_USERNAME_URI,
          data: {"username": username});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> verifyUsername(String username) async {
    try {
      Response response = await dioClient.post(AppConstants.VERIFY_USERNAME_URI,
          data: {
            "username": username,
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> resetPassword(String identity, String otp,
      String password, String confirmPassword) async {
    print('======Password====>$password');
    try {
      Response response =
          await dioClient.post(AppConstants.RESET_PASSWORD_URI, data: {
        "_method": "put",
        "identity": identity.trim(),
        "otp": otp,
        "password": password,
        "confirm_password": confirmPassword
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // for  Remember Username
  Future<void> saveUserUsername(String username) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_USERNAME, username);
    } catch (e) {
      throw e;
    }
  }

  String getUserUsername() {
    return sharedPreferences.getString(AppConstants.USER_USERNAME) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

  Future<bool> clearUserUsernameAndPassword() async {
    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(AppConstants.USER_USERNAME);
  }

  Future<ApiResponse> forgetPassword(String identity) async {
    try {
      Response response = await dioClient
          .post(AppConstants.FORGET_PASSWORD_URI, data: {"identity": identity});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
