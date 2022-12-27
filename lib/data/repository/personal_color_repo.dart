import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/personal_color_model.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalColorRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  PersonalColorRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addPersonalColor(PersonalColorModel personalColorModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(personalColorModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(personalColorModel.attachedFilepath1));
    // if(personalColorModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(personalColorModel.attachedFilepath2));
    // if(personalColorModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(personalColorModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': personalColorModel.title,
      // 'content': personalColorModel.content,
      // 'grade': personalColorModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_PERSONAL_COLOR_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updatePersonalColor(PersonalColorModel personalColorModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': personalColorModel.title,
      // 'content': personalColorModel.content,
      // 'grade': personalColorModel.grade,
      // 'personalColor_id': personalColorModel.personalColor_id,
      // 'custom1': personalColorModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_PERSONAL_COLOR_URI + "/${personalColorModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deletePersonalColor(PersonalColorModel personalColorModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_PERSONAL_COLOR_URI +
            "/${personalColorModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getPersonalColorList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_PERSONAL_COLOR_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getPersonalColor(PersonalColorModel personalColorModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_PERSONAL_COLOR_URI + "/${personalColorModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getPersonalColorCondition(PersonalColorModel personalColorModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_PERSONAL_COLOR_CONDITION_URI + "?season=${personalColorModel.season}&detail_season_type=${personalColorModel.detail_season_type}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
