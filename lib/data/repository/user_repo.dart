import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/user_model.dart';
import 'package:yeka/util/app_constants.dart';

class UserRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  UserRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addUser(UserModel userModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(userModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(userModel.attachedFilepath1));
    // if(userModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(userModel.attachedFilepath2));
    // if(userModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(userModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': userModel.title,
      // 'content': userModel.content,
      // 'grade': userModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_USER_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateUser(UserModel userModel) async {
    Map<String, dynamic> _data = userModel.toJsonNotNull();

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_USER_URI + "/${userModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteUser(UserModel userModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_USER_URI +
            "/${userModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getUserList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_USER_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getConsultantList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_USER_CONSULTANT_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getConsultantListWithAddress(int limit, int skip, String sido, String dong) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_USER_CONSULTANT_ADDRESS_URI + "?limit=$limit&skip=$skip&sido=$sido&dong=$dong",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getUser(UserModel userModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_USER_URI + "/${userModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSuperUser() async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_SUPER_USER_URI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_USER_URI ="";
// static const String UPDATE_USER_URI ="";
// static const String DELETE_USER_URI ="";
// static const String LIST_USER_URI ="";
// static const String GET_USER_URI ="";