import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/datasource/remote/dio/dio_client.dart';
import 'package:yeka/data/datasource/remote/exception/api_error_handler.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/onboarding_model.dart';
import 'package:yeka/localization/language_constrants.dart';
import 'package:yeka/utill/app_constants.dart';

import '../../utill/images.dart';

class OnBoardingRepo{
  final DioClient dioClient;
  OnBoardingRepo({@required this.dioClient});

  Future<ApiResponse> getOnBoardingList(BuildContext context) async {
    try {
      List<OnboardingModel> onBoardingList = [
        OnboardingModel(
          Images.consult,
          'not used',
          'not used',
        ),
        OnboardingModel(
          Images.consult,
          'not used',
          'not used',
        ),
        OnboardingModel(
          Images.consult,
          'not used',
          'not used',
        ),
        OnboardingModel(
          Images.consult,
          'not used',
          'not used',
        ),
      ];

      Response response = Response(requestOptions: RequestOptions(path: ''), data: onBoardingList,statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}