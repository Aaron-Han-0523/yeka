import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/option_model.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OptionRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  OptionRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addOption(OptionModel optionModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(optionModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(optionModel.attachedFilepath1));
    // if(optionModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(optionModel.attachedFilepath2));
    // if(optionModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(optionModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': optionModel.title,
      // 'content': optionModel.content,
      // 'grade': optionModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_OPTION_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateOption(OptionModel optionModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': optionModel.title,
      // 'content': optionModel.content,
      // 'grade': optionModel.grade,
      // 'option_id': optionModel.option_id,
      // 'custom1': optionModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_OPTION_URI + "/${optionModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteOption(OptionModel optionModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_OPTION_URI +
            "/${optionModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getLatestOptionList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_OPTION_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getOptionList() async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_OPTION_URI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getOption(OptionModel optionModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_OPTION_URI + "/${optionModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_OPTION_URI ="";
// static const String UPDATE_OPTION_URI ="";
// static const String DELETE_OPTION_URI ="";
// static const String LIST_OPTION_URI ="";
// static const String GET_OPTION_URI ="";