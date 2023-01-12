import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/auto_model.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/util/app_constants.dart';

class AutoRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AutoRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addAuto(AutoModel autoModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(autoModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(autoModel.attachedFilepath1));
    // if(autoModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(autoModel.attachedFilepath2));
    // if(autoModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(autoModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': autoModel.title,
      // 'content': autoModel.content,
      // 'grade': autoModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_AUTO_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateAuto(AutoModel autoModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': autoModel.title,
      // 'content': autoModel.content,
      // 'grade': autoModel.grade,
      // 'auto_id': autoModel.auto_id,
      // 'custom1': autoModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_AUTO_URI + "/${autoModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteAuto(AutoModel autoModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_AUTO_URI +
            "/${autoModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getAutoList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_AUTO_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getAuto(AutoModel autoModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_AUTO_URI + "/${autoModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_AUTO_URI ="";
// static const String UPDATE_AUTO_URI ="";
// static const String DELETE_AUTO_URI ="";
// static const String LIST_AUTO_URI ="";
// static const String GET_AUTO_URI ="";