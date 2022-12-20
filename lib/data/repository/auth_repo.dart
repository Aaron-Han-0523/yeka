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
      Response response = await dioClient
          .post(AppConstants.CHECK_USERNAME_URI, data: {"username": username});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> verifyUsername(String username) async {
    try {
      Response response =
          await dioClient.post(AppConstants.VERIFY_USERNAME_URI, data: {
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

  // for  Remember User info
  Future<void> saveUser(Map map) async {
    try {
      await sharedPreferences.setInt(
        AppConstants.USER_ID,
        map["id"],
      );
      await sharedPreferences.setInt(
        AppConstants.USER_USER_TYPE,
        map["user_type"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_USERNAME,
        map["username"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_NAME,
        map["name"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_PHONE,
        map["phone"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_EMAIL,
        map["email"],
      );
      await sharedPreferences.setInt(
        AppConstants.USER_GENDER,
        map["gender"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_ADDRESS1,
        map["address1"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_ADDRESS2,
        map["address2"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_ADDRESS3,
        map["address3"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_BUSINESS_REGISTRATION_NUMBER,
        map["business_registration_number"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_BUSINESS_REGISTRATION_FILE,
        map["business_registration_file"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_HASHTAG,
        map["hashtag"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_RESUME,
        map["resume"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_WORKING_HOUR,
        map["working_hour"],
      );
      await sharedPreferences.setInt(
        AppConstants.USER_WITHDRAWAL,
        map["withdrawal"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_BANK1,
        map["bank1"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_BANK2,
        map["bank2"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_BANK3,
        map["bank3"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_CREATE_DATE,
        map["create_date"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_UPDATE_DATE,
        map["update_date"],
      );
      await sharedPreferences.setString(
        AppConstants.USER_DELETE_DATE,
        map["delete_date"],
      );
    } catch (e) {
      throw e;
    }
  }

  Map getUser() {
    Map map = {};
    map["id"] = sharedPreferences.getInt(
          AppConstants.USER_ID,
        ) ??
        null;
    map["user_type"] = sharedPreferences.getInt(
          AppConstants.USER_USER_TYPE,
        ) ??
        null;
    map["username"] = sharedPreferences.getString(
          AppConstants.USER_USERNAME,
        ) ??
        "";
    map["name"] = sharedPreferences.getString(
          AppConstants.USER_NAME,
        ) ??
        "";
    map["phone"] = sharedPreferences.getString(
          AppConstants.USER_PHONE,
        ) ??
        "";
    map["email"] = sharedPreferences.getString(
          AppConstants.USER_EMAIL,
        ) ??
        "";
    map["GENDER"] = sharedPreferences.getInt(
          AppConstants.USER_GENDER,
        ) ??
        null;
    map["address1"] = sharedPreferences.getString(
          AppConstants.USER_ADDRESS1,
        ) ??
        "";
    map["address2"] = sharedPreferences.getString(
          AppConstants.USER_ADDRESS2,
        ) ??
        "";
    map["address3"] = sharedPreferences.getString(
          AppConstants.USER_ADDRESS3,
        ) ??
        "";
    map["hashtag"] = sharedPreferences.getString(
          AppConstants.USER_HASHTAG,
        ) ??
        "";
    map["resume"] = sharedPreferences.getString(
          AppConstants.USER_RESUME,
        ) ??
        "";
    map["working_hour"] = sharedPreferences.getString(
          AppConstants.USER_WORKING_HOUR,
        ) ??
        "";
    map["withdrawal"] = sharedPreferences.getInt(
          AppConstants.USER_WITHDRAWAL,
        ) ??
        null;
    map["bank1"] = sharedPreferences.getString(
          AppConstants.USER_BANK1,
        ) ??
        "";
    map["bank2"] = sharedPreferences.getString(
          AppConstants.USER_BANK2,
        ) ??
        "";
    map["bank3"] = sharedPreferences.getString(
          AppConstants.USER_BANK3,
        ) ??
        "";
    map["create_date"] = sharedPreferences.getString(
          AppConstants.USER_CREATE_DATE,
        ) ??
        "";
    map["update_date"] = sharedPreferences.getString(
          AppConstants.USER_UPDATE_DATE,
        ) ??
        "";
    map["delete_date"] = sharedPreferences.getString(
          AppConstants.USER_DELETE_DATE,
        ) ??
        "";
    return map;
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

  Future<bool> clearUser() async {
    await sharedPreferences.remove(
      AppConstants.USER_ID,
    );
    await sharedPreferences.remove(
      AppConstants.USER_USER_TYPE,
    );
    await sharedPreferences.remove(
      AppConstants.USER_USERNAME,
    );
    await sharedPreferences.remove(
      AppConstants.USER_NAME,
    );
    await sharedPreferences.remove(
      AppConstants.USER_PHONE,
    );
    await sharedPreferences.remove(
      AppConstants.USER_EMAIL,
    );
    await sharedPreferences.remove(
      AppConstants.USER_GENDER,
    );
    await sharedPreferences.remove(
      AppConstants.USER_ADDRESS1,
    );
    await sharedPreferences.remove(
      AppConstants.USER_ADDRESS2,
    );
    await sharedPreferences.remove(
      AppConstants.USER_ADDRESS3,
    );
    await sharedPreferences.remove(
      AppConstants.USER_BUSINESS_REGISTRATION_NUMBER,
    );
    await sharedPreferences.remove(
      AppConstants.USER_BUSINESS_REGISTRATION_FILE,
    );
    await sharedPreferences.remove(
      AppConstants.USER_HASHTAG,
    );
    await sharedPreferences.remove(
      AppConstants.USER_RESUME,
    );
    await sharedPreferences.remove(
      AppConstants.USER_WORKING_HOUR,
    );
    await sharedPreferences.remove(
      AppConstants.USER_WITHDRAWAL,
    );
    await sharedPreferences.remove(
      AppConstants.USER_BANK1,
    );
    await sharedPreferences.remove(
      AppConstants.USER_BANK2,
    );
    await sharedPreferences.remove(
      AppConstants.USER_BANK3,
    );
    await sharedPreferences.remove(
      AppConstants.USER_CREATE_DATE,
    );
    await sharedPreferences.remove(
      AppConstants.USER_UPDATE_DATE,
    );
    await sharedPreferences.remove(
      AppConstants.USER_DELETE_DATE,
    );
    return true;
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
