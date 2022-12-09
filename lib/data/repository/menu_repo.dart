import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/menu_model.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  MenuRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addMenu(MenuModel menuModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(menuModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(menuModel.attachedFilepath1));
    // if(menuModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(menuModel.attachedFilepath2));
    // if(menuModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(menuModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': menuModel.title,
      // 'content': menuModel.content,
      // 'grade': menuModel.grade,
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

  Future<ApiResponse> updateMenu(MenuModel menuModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': menuModel.title,
      // 'content': menuModel.content,
      // 'grade': menuModel.grade,
      // 'menu_id': menuModel.menu_id,
      // 'custom1': menuModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_AUTO_URI + "/${menuModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteMenu(MenuModel menuModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_AUTO_URI +
            "/${menuModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getMenuList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_AUTO_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getMenu(MenuModel menuModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_AUTO_URI + "/${menuModel.id}",
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