import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/community_model.dart';
import 'package:yeka/util/app_constants.dart';

class CommunityFreeBoardRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  CommunityFreeBoardRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addCommunity(CommunityModel communityModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(communityModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(communityModel.attachedFilepath1));
    // if(communityModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(communityModel.attachedFilepath2));
    // if(communityModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(communityModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': communityModel.title,
      // 'content': communityModel.content,
      // 'grade': communityModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

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
      "id" : communityModel.id,
      "community_type" : communityModel.community_type,
      "community_title" : communityModel.community_title,
      "community_content" : communityModel.community_content,
      "community_link" : communityModel.community_link,
      "views" : communityModel.views,
      "writer" : communityModel.writer,
      "create_date" : communityModel.create_date,
      "update_date" : communityModel.update_date,
      "delete_date" : communityModel.delete_date,
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
  Future<ApiResponse> getLatestCommunityFreeBoardList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_COMMUNITY_FREE_BOARD_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCommunityFreeBoardList(int pageNum) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_COMMUNITY_FREE_BOARD_URI + "?pageNum=$pageNum",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCommunityFreeBoardNewsList(CommunityModel communityModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_COMMUNITY_FREE_BOARD_NEWS_URI + "/${communityModel.id}",
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

// static const String ADD_COMMUNITY_URI ="";
// static const String UPDATE_COMMUNITY_URI ="";
// static const String DELETE_COMMUNITY_URI ="";
// static const String LIST_COMMUNITY_URI ="";
// static const String GET_COMMUNITY_URI ="";