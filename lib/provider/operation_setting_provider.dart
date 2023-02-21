import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/operation_setting_model.dart';
import 'package:yeka/data/repository/operation_setting_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class OperationSettingProvider extends ChangeNotifier {
  final OperationSettingRepo operationSettingRepo;

  OperationSettingProvider({@required this.operationSettingRepo});

  OperationSettingModel _operationSetting;

  OperationSettingModel get operationSetting => _operationSetting;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<OperationSettingModel> _latestOperationSettingList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<OperationSettingModel> get latestOperationSettingList => _latestOperationSettingList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addOperationSetting(OperationSettingModel operationSettingModel) {
    operationSettingRepo.addOperationSetting(operationSettingModel);
    notifyListeners();
  }

  void updateOperationSetting(OperationSettingModel operationSettingModel) {
    operationSettingRepo.updateOperationSetting(operationSettingModel);
    notifyListeners();
  }

  void deleteOperationSetting(OperationSettingModel operationSettingModel) {
    operationSettingRepo.deleteOperationSetting(operationSettingModel);
    notifyListeners();
  }

  Future<OperationSettingModel> getOperationSetting() async {
    ApiResponse apiResponse = await operationSettingRepo.getOperationSetting();
    if (apiResponse.response != null) {
      _operationSetting =
          OperationSettingModel.fromJson(apiResponse.response.data);
    } else {
      _operationSetting = OperationSettingModel();
    }

    notifyListeners();
    return _operationSetting;
  }

  Future<void> getLatestOperationSettingList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestOperationSettingList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await operationSettingRepo.getOperationSettingList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestOperationSettingList.addAll(OperationSettingList.fromList(apiResponse.response.data).operationSettingList);
        _latestPageSize = OperationSettingList.fromList(apiResponse.response.data).count;
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
