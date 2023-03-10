import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/like_product_model.dart';
import 'package:yeka/util/app_constants.dart';

class LikeProductRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  LikeProductRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addLikeProduct(LikeProductModel likeProductModel) async {
    // var formData = FormData.fromMap({
    //   'user_id' : likeProductModel.user_id,
    //   'product_id': likeProductModel.product_id,
    // });

    var _data = {
      'user_id' : likeProductModel.user_id,
      'product_id': likeProductModel.product_id,
    };

    try {
      var response = await dioClient.post(
        AppConstants.ADD_LIKE_PRODUCT_URI,
        data: _data,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateLikeProduct(LikeProductModel likeProductModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': likeProductModel.title,
      // 'content': likeProductModel.content,
      // 'grade': likeProductModel.grade,
      // 'likeProduct_id': likeProductModel.likeProduct_id,
      // 'custom1': likeProductModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_LIKE_PRODUCT_URI + "/${likeProductModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteLikeProduct(LikeProductModel likeProductModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_LIKE_PRODUCT_URI +
            "?user_id=${likeProductModel.user_id}&product_id=${likeProductModel.product_id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getLikeProductList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_LIKE_PRODUCT_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getLikeProduct(LikeProductModel likeProductModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_LIKE_PRODUCT_URI + "/${likeProductModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_LIKE_PRODUCT_URI ="";
// static const String UPDATE_LIKE_PRODUCT_URI ="";
// static const String DELETE_LIKE_PRODUCT_URI ="";
// static const String LIST_LIKE_PRODUCT_URI ="";
// static const String GET_LIKE_PRODUCT_URI ="";