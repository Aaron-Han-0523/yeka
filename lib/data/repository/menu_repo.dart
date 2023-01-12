import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/menu_model.dart';
import 'package:yeka/util/app_constants.dart';

class MenuRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  MenuRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addMenu(MenuModel menuModel) async {
    // var formData = FormData.fromMap(menuModel.toJsonNotNull());
    var formData = {
      // 'file': await MultipartFile.fromFile(imageModel.path),
      'menu_title': menuModel.menu_title,
      'menu_amount': menuModel.menu_amount,
      'menu_content': menuModel.menu_content,
      'menu_image': menuModel.menu_image,
      'consultant_id': menuModel.consultant_id,
      'create_date': menuModel.create_date,
    };

    try {
      var response = await dioClient.post(
        AppConstants.ADD_MENU_URI,
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
          await dioClient.put(AppConstants.UPDATE_MENU_URI + "/${menuModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteMenu(MenuModel menuModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_MENU_URI +
            "/${menuModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getLatestMenuList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_MENU_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getMenuList(MenuModel menuModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_MENU_CONSULTANT_URI + "?consultant_id=${menuModel.consultant_id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getMenu(MenuModel menuModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_MENU_URI + "/${menuModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_MENU_URI ="";
// static const String UPDATE_MENU_URI ="";
// static const String DELETE_MENU_URI ="";
// static const String LIST_MENU_URI ="";
// static const String GET_MENU_URI ="";