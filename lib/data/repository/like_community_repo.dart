import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/like_community_model.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikeCommunityRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  LikeCommunityRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addLikeCommunity(LikeCommunityModel likeCommunityModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(likeCommunityModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(likeCommunityModel.attachedFilepath1));
    // if(likeCommunityModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(likeCommunityModel.attachedFilepath2));
    // if(likeCommunityModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(likeCommunityModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': likeCommunityModel.title,
      // 'content': likeCommunityModel.content,
      // 'grade': likeCommunityModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_LIKE_COMMUNITY_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateLikeCommunity(LikeCommunityModel likeCommunityModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': likeCommunityModel.title,
      // 'content': likeCommunityModel.content,
      // 'grade': likeCommunityModel.grade,
      // 'likeCommunity_id': likeCommunityModel.likeCommunity_id,
      // 'custom1': likeCommunityModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_LIKE_COMMUNITY_URI + "/${likeCommunityModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteLikeCommunity(LikeCommunityModel likeCommunityModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_LIKE_COMMUNITY_URI +
            "/${likeCommunityModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getLikeCommunityList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_LIKE_COMMUNITY_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getLikeCommunity(LikeCommunityModel likeCommunityModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_LIKE_COMMUNITY_URI + "/${likeCommunityModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_LIKE_COMMUNITY_URI ="";
// static const String UPDATE_LIKE_COMMUNITY_URI ="";
// static const String DELETE_LIKE_COMMUNITY_URI ="";
// static const String LIST_LIKE_COMMUNITY_URI ="";
// static const String GET_LIKE_COMMUNITY_URI ="";