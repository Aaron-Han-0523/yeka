import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/auto_model.dart';
import 'package:yeka/data/repository/auto_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class AutoProvider extends ChangeNotifier {
  final AutoRepo autoRepo;

  AutoProvider({@required this.autoRepo});

  AutoModel _auto;

  AutoModel get auto => _auto;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<AutoModel> _latestAutoList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<AutoModel> get latestAutoList => _latestAutoList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addAuto(AutoModel autoModel) {
    autoRepo.addAuto(autoModel);
    notifyListeners();
  }

  void updateAuto(AutoModel autoModel) {
    autoRepo.updateAuto(autoModel);
    notifyListeners();
  }

  void deleteAuto(AutoModel autoModel) {
    autoRepo.deleteAuto(autoModel);
    notifyListeners();
  }

  Future<AutoModel> getAuto(AutoModel autoModel) async {
    ApiResponse apiResponse = await autoRepo.getAuto(autoModel);
    _auto = AutoModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _auto;
  }

  Future<void> getLatestAutoList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestAutoList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await autoRepo.getAutoList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestAutoList.addAll(AutoList.fromList(apiResponse.response.data).autoList);
        _latestPageSize = AutoList.fromList(apiResponse.response.data).count;
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
