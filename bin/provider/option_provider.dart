import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/option_model.dart';
import 'package:yeka/data/repository/option_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class OptionProvider extends ChangeNotifier {
  final OptionRepo optionRepo;

  OptionProvider({@required this.optionRepo});

  OptionModel _option;

  OptionModel get option => _option;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<OptionModel> _latestOptionList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<OptionModel> get latestOptionList => _latestOptionList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addOption(OptionModel optionModel) {
    optionRepo.addOption(optionModel);
    notifyListeners();
  }

  void updateOption(OptionModel optionModel) {
    optionRepo.updateOption(optionModel);
    notifyListeners();
  }

  void deleteOption(OptionModel optionModel) {
    optionRepo.deleteOption(optionModel);
    notifyListeners();
  }

  Future<OptionModel> getOption(OptionModel optionModel) async {
    ApiResponse apiResponse = await optionRepo.getOption(optionModel);
    _option = OptionModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _option;
  }

  Future<void> getLatestOptionList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestOptionList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await optionRepo.getOptionList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestOptionList.addAll(OptionList.fromJson(apiResponse.response.data).optionList);
        _latestPageSize = OptionList.fromJson(apiResponse.response.data).count;
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
