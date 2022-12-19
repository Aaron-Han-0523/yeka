import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/community_model.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': communityModel.title,
      // 'content': communityModel.content,
      // 'grade': communityModel.grade,
      // 'community_id': communityModel.community_id,
      // 'custom1': communityModel.custom1,
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

  Future<ApiResponse> getCommunityFreeBoardList(pageNum) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_COMMUNITY_FREE_BOARD_URI + "?pageNum=$pageNum",
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