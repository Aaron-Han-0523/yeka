import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/user_model.dart';
import 'package:yeka/data/repository/user_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class UserProvider extends ChangeNotifier {
  final UserRepo userRepo;

  UserProvider({@required this.userRepo});

  UserModel _user;
  UserModel _superuser;

  UserModel get user => _user;
  UserModel get superuser => _superuser;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<UserModel> _latestUserList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<UserModel> get latestUserList => _latestUserList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addUser(UserModel userModel) {
    userRepo.addUser(userModel);
    notifyListeners();
  }

  void updateUser(UserModel userModel) {
    userRepo.updateUser(userModel);
    notifyListeners();
  }

  void deleteUser(UserModel userModel) {
    userRepo.deleteUser(userModel);
    notifyListeners();
  }

  Future<UserModel> getUser(UserModel userModel) async {
    ApiResponse apiResponse = await userRepo.getUser(userModel);
    _user = UserModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _user;
  }

  Future<UserModel> getSuperUser() async {
    ApiResponse apiResponse = await userRepo.getSuperUser();
    _superuser = UserModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _superuser;
  }

  Future<void> getLatestUserList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestUserList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await userRepo.getUserList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestUserList.addAll(UserList.fromList(apiResponse.response.data).userList);
        _latestPageSize = UserList.fromList(apiResponse.response.data).count;
        _filterFirstLoading = false;
        _filterIsLoading = false;
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    } else {
      if (_filterIsLoading) {
        _filterIsLoading = false;
        notifyListeners();
      }
    }
  }
}
