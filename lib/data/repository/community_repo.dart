import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/community_model.dart';
import 'package:yeka/util/app_constants.dart';

class CommunityRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  CommunityRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addCommunity(CommunityModel communityModel) async {
    var formData = {
      "community_type": communityModel.community_type,
      "community_title": communityModel.community_title,
      "community_content": communityModel.community_content,
      "community_link": communityModel.community_link,
      "views": communityModel.views,
      "writer": communityModel.writer,
      "create_date": communityModel.create_date,
    };

    try {
      var response = await dioClient.post(
        AppConstants.ADD_COMMUNITY_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateCommunity(CommunityModel communityModel) async {
    Map<String, dynamic> _data = {
      "community_type": communityModel.community_type,
      "community_title": communityModel.community_title,
      "community_content": communityModel.community_content,
      "community_link": communityModel.community_link,
      "views": communityModel.views,
      "writer": communityModel.writer,
      "update_date": communityModel.update_date,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_COMMUNITY_URI + "/${communityModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteCommunity(CommunityModel communityModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_COMMUNITY_URI +
            "/${communityModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getCommunityList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_COMMUNITY_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCommunity(CommunityModel communityModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_COMMUNITY_URI + "/${communityModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}