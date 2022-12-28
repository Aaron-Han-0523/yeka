import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/consulting_model.dart';
import 'package:yeka/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsultingRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  ConsultingRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addConsulting(ConsultingModel consultingModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(consultingModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(consultingModel.attachedFilepath1));
    // if(consultingModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(consultingModel.attachedFilepath2));
    // if(consultingModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(consultingModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': consultingModel.title,
      // 'content': consultingModel.content,
      // 'grade': consultingModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_CONSULTING_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateConsulting(ConsultingModel consultingModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': consultingModel.title,
      // 'content': consultingModel.content,
      // 'grade': consultingModel.grade,
      // 'consulting_id': consultingModel.consulting_id,
      // 'custom1': consultingModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_CONSULTING_URI + "/${consultingModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteConsulting(ConsultingModel consultingModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_CONSULTING_URI +
            "/${consultingModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getConsultingList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_CONSULTING_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getConsulting(ConsultingModel consultingModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_CONSULTING_URI + "/${consultingModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getConsultingByClientId(ConsultingModel consultingModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_CONSULTING_BY_CLIENT_ID_URI + "/${consultingModel.client_id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_CONSULTING_URI ="";
// static const String UPDATE_CONSULTING_URI ="";
// static const String DELETE_CONSULTING_URI ="";
// static const String LIST_CONSULTING_URI ="";
// static const String GET_CONSULTING_URI ="";