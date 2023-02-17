import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/operation_setting_model.dart';
import 'package:yeka/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OperationSettingRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  OperationSettingRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addOperationSetting(OperationSettingModel operationSettingModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(operationSettingModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(operationSettingModel.attachedFilepath1));
    // if(operationSettingModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(operationSettingModel.attachedFilepath2));
    // if(operationSettingModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(operationSettingModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': operationSettingModel.title,
      // 'content': operationSettingModel.content,
      // 'grade': operationSettingModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_OPERATION_SETTING_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateOperationSetting(OperationSettingModel operationSettingModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': operationSettingModel.title,
      // 'content': operationSettingModel.content,
      // 'grade': operationSettingModel.grade,
      // 'operationSetting_id': operationSettingModel.operationSetting_id,
      // 'custom1': operationSettingModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_OPERATION_SETTING_URI + "/${operationSettingModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteOperationSetting(OperationSettingModel operationSettingModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_OPERATION_SETTING_URI +
            "/${operationSettingModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getOperationSettingList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_OPERATION_SETTING_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getOperationSetting() async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_OPERATION_SETTING_URI
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_OPERATION_SETTING_URI ="";
// static const String UPDATE_OPERATION_SETTING_URI ="";
// static const String DELETE_OPERATION_SETTING_URI ="";
// static const String LIST_OPERATION_SETTING_URI ="";
// static const String GET_OPERATION_SETTING_URI ="";