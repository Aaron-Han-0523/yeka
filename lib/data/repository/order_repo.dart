import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/order_model.dart';
import 'package:yeka/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  OrderRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addOrder(OrderModel orderModel) async {

    List<MultipartFile> uploadFiles = [];

    // if(orderModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(orderModel.attachedFilepath1));
    // if(orderModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(orderModel.attachedFilepath2));
    // if(orderModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(orderModel.attachedFilepath3));

    var formData = FormData.fromMap({
      // 'files' : uploadFiles,
      // 'title': orderModel.title,
      // 'content': orderModel.content,
      // 'grade': orderModel.grade,
      // 'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      var response = await dioClient.post(
        AppConstants.ADD_ORDER_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateOrder(OrderModel orderModel) async {
    Map<String, dynamic> _data = {
      // 'clients_id': sharedPreferences.getInt("clients_id"),
      // 'title': orderModel.title,
      // 'content': orderModel.content,
      // 'grade': orderModel.grade,
      // 'order_id': orderModel.order_id,
      // 'custom1': orderModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_ORDER_URI + "/${orderModel.id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteOrder(OrderModel orderModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.DELETE_ORDER_URI +
            "/${orderModel.id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getOrderList(int limit, int skip, int user_id) async {
    try {
      final response = await dioClient.get(
        AppConstants.LIST_ORDER_URI + "?limit=$limit&skip=$skip&user_id=$user_id",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getOrder(OrderModel orderModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.GET_ORDER_URI + "/${orderModel.id}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

// static const String ADD_ORDER_URI ="";
// static const String UPDATE_ORDER_URI ="";
// static const String DELETE_ORDER_URI ="";
// static const String LIST_ORDER_URI ="";
// static const String GET_ORDER_URI ="";