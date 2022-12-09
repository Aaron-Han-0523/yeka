import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'auto_model.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TargetRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  TargetRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addTarget(AutoModel targetModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(targetModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(targetModel.attachedFilepath1));
    // if(targetModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(targetModel.attachedFilepath2));
    // if(targetModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(targetModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': targetModel.title,
      // 'content': targetModel.content,
      // 'grade': targetModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_TARGET_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateTarget(AutoModel targetModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': targetModel.title,
      // 'content': targetModel.content,
      // 'grade': targetModel.grade,
      // 'target_id': targetModel.target_id,
      // 'custom1': targetModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_TARGET_URI + "/${targetModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteTarget(AutoModel targetModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_TARGET_URI +
            "/${targetModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getTargetList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_TARGET_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getTarget(int id) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_TARGET_URI + "/$id",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_TARGET_URI ="";
// static const String UPDATE_TARGET_URI ="";
// static const String DELETE_TARGET_URI ="";
// static const String LIST_TARGET_URI ="";
// static const String GET_TARGET_URI ="";