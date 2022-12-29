import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/image_model.dart';
import 'package:yeka/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  ImageRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addImage(ImageModel imageModel) async {
    String url = AppConstants.ADD_IMAGE_URI;
    String uploadBasePath = "uploads";

    if (imageModel.image_type == 0 || imageModel.image_type == 1) {
      url = AppConstants.ADD_IMAGE_PRODUCT_URI;
      uploadBasePath += "/product/";
    } else if (imageModel.image_type == 2 || imageModel.image_type == 3) {
      url = AppConstants.ADD_IMAGE_USER_URI;
      uploadBasePath += "/user/";
    } else {
      url = AppConstants.ADD_IMAGE_COMMUNITY_URI;
      uploadBasePath += "/community/";
    }

    MultipartFile multipartFile = await MultipartFile.fromFile(imageModel.path);

    var formData = await FormData.fromMap({
      'file': await MultipartFile.fromFile(imageModel.path),
      'path': uploadBasePath + multipartFile.filename,
      'community_id': imageModel.community_id,
      'consultant_id': imageModel.consultant_id,
      'create_date': imageModel.create_date,
      'image_type': imageModel.image_type ?? 99,
    });

    try {
      var response = await dioClient.post(
        url,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> addImages(List<ImageModel> images) async {
    List<MultipartFile> uploadFiles = [];

    for (var image in images) {
      uploadFiles.add(await MultipartFile.fromFile(image.path));
    }

    var formData = FormData.fromMap({
      'files': uploadFiles,
      'community_id': images[0].community_id,
      'create_date': images[0].create_date,
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_IMAGE_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateImage(ImageModel imageModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': imageModel.title,
      // 'content': imageModel.content,
      // 'grade': imageModel.grade,
      // 'image_id': imageModel.image_id,
      // 'custom1': imageModel.custom1,
    };

    try {
      final response = await dioClient.put(
          AppConstants.UPDATE_IMAGE_URI + "/${imageModel.id}",
          data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteImage(ImageModel imageModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_IMAGE_URI +
            "/${imageModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getImageListByProductId(ImageModel imageModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_IMAGE_PRODUCT_URI + "/${imageModel.product_id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getImageListByConsultantId(ImageModel imageModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_IMAGE_CONSULTANT_URI + "/${imageModel.consultant_id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getImageListByCommunityId(ImageModel imageModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_IMAGE_COMMUNITY_URI + "/${imageModel.community_id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getImage(ImageModel imageModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_IMAGE_URI + "/${imageModel.product_id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_IMAGE_URI ="";
// static const String UPDATE_IMAGE_URI ="";
// static const String DELETE_IMAGE_URI ="";
// static const String LIST_IMAGE_URI ="";
// static const String GET_IMAGE_URI ="";
