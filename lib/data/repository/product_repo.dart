import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/product_model.dart';
import 'package:yeka/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  ProductRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addProduct(ProductModel productModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(productModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(productModel.attachedFilepath1));
    // if(productModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(productModel.attachedFilepath2));
    // if(productModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(productModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': productModel.title,
      // 'content': productModel.content,
      // 'grade': productModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_PRODUCT_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateProduct(ProductModel productModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': productModel.title,
      // 'content': productModel.content,
      // 'grade': productModel.grade,
      // 'product_id': productModel.product_id,
      // 'custom1': productModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_PRODUCT_URI + "/${productModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteProduct(ProductModel productModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_PRODUCT_URI +
            "/${productModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getProductList(int limit, int skip, int user_id) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_PRODUCT_URI + "?limit=$limit&skip=$skip&user_id=$user_id",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getProductMyFavoriteList(int limit, int skip, int user_id) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_PRODUCT_MY_FAVORITE_URI + "?limit=$limit&skip=$skip&user_id=$user_id",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getProduct(ProductModel productModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_PRODUCT_URI + "/${productModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_PRODUCT_URI ="";
// static const String UPDATE_PRODUCT_URI ="";
// static const String DELETE_PRODUCT_URI ="";
// static const String LIST_PRODUCT_URI ="";
// static const String GET_PRODUCT_URI ="";