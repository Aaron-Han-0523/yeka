import 'package:flutter/material.dart';
import 'package:yeka/data/model/body/login_model.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/base/error_response.dart';
import 'package:yeka/data/model/response/response_model.dart';
import 'package:yeka/data/repository/auth_repo.dart';
import 'package:yeka/helper/api_checker.dart';

import '../data/model/response/user_model.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({@required this.authRepo});

  bool _isLoading = false;
  bool _isRemember = false;

  bool get isLoading => _isLoading;

  bool get isRemember => _isRemember;

  void updateRemember(bool value) {
    _isRemember = value;
    notifyListeners();
  }

  Future registration(UserModel register, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.registration(register);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      Map map = apiResponse.response.data;
      String temporaryToken = '';
      String token = '';
      String message = '';
      try {
        message = map["message"];
      } catch (e) {}

      callback(true, token, temporaryToken, message);
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      callback(false, '', '', errorMessage);
      notifyListeners();
    }
  }

  Future login(LoginModel loginBody, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.login(loginBody);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      Map map = apiResponse.response.data;
      String message = '';

      try {
        message = map["message"];
      } catch (e) {}
      saveUserUsername(loginBody.username);
      //   route(bool isRoute, String token, String temporaryToken, String errorMessage) async {
      callback(true, message);
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      callback(false, errorMessage);
      notifyListeners();
    }
  }

  //username
  Future<ResponseModel> checkUsername(
      String username, String temporaryToken) async {
    _verificationMsg = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepo.checkUsername(username);
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel(apiResponse.response.data['token'], true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage, false);
      _verificationMsg = errorMessage;
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> verifyUsername(String username) async {
    _verificationMsg = '';
    notifyListeners();
    ApiResponse apiResponse =
        await authRepo.verifyUsername(username);
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel('Successful', true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage, false);
      _verificationMsg = errorMessage;
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> resetPassword(String identity, String otp,
      String password, String confirmPassword) async {
    _verificationMsg = '';
    notifyListeners();
    ApiResponse apiResponse =
        await authRepo.resetPassword(identity, otp, password, confirmPassword);
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel(apiResponse.response.data["message"], true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage, false);
      _verificationMsg = errorMessage;
    }
    notifyListeners();
    return responseModel;
  }

  String _verificationMsg = '';

  String get verificationMessage => _verificationMsg;
  String _username = '';

  String get username => _username;

  updateUsername(String username) {
    _username = username;
    notifyListeners();
  }

  updatePhone(String phone) {
    notifyListeners();
  }

  void clearVerificationMessage() {
    _verificationMsg = '';
  }

  // for verification Code
  String _verificationCode = '';

  String get verificationCode => _verificationCode;
  bool _isEnableVerificationCode = false;

  bool get isEnableVerificationCode => _isEnableVerificationCode;

  updateVerificationCode(String query) {
    if (query.length == 4) {
      _isEnableVerificationCode = true;
    } else {
      _isEnableVerificationCode = false;
    }
    _verificationCode = query;
    notifyListeners();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future<bool> clearSharedData() async {
    return await authRepo.clearSharedData();
  }

  // for  Remember Username
  void saveUserUsername(String username) {
    authRepo.saveUserUsername(username);
  }

  String getUserUsername() {
    return authRepo.getUserUsername() ?? "";
  }

  Future<bool> clearUserUsernameAndPassword() async {
    return authRepo.clearUserUsernameAndPassword();
  }

  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }

  Future<ResponseModel> forgetPassword(String username) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.forgetPassword(username);
    _isLoading = false;
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel(apiResponse.response.data["message"], true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage, false);
    }
    return responseModel;
  }
}
