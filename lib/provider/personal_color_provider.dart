import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/personal_color_model.dart';
import 'package:yeka/data/repository/personal_color_repo.dart';
import 'package:yeka/helper/api_checker.dart';

class PersonalColorProvider extends ChangeNotifier {
  final PersonalColorRepo personalColorRepo;

  PersonalColorProvider({@required this.personalColorRepo});

  PersonalColorModel _personalColor;

  PersonalColorModel get personalColor => _personalColor;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<PersonalColorModel> _latestPersonalColorList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<PersonalColorModel> get latestPersonalColorList => _latestPersonalColorList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addPersonalColor(PersonalColorModel personalColorModel) {
    personalColorRepo.addPersonalColor(personalColorModel);
    notifyListeners();
  }

  void updatePersonalColor(PersonalColorModel personalColorModel) {
    personalColorRepo.updatePersonalColor(personalColorModel);
    notifyListeners();
  }

  void deletePersonalColor(PersonalColorModel personalColorModel) {
    personalColorRepo.deletePersonalColor(personalColorModel);
    notifyListeners();
  }

  Future<PersonalColorModel> getPersonalColor(PersonalColorModel personalColorModel) async {
    ApiResponse apiResponse = await personalColorRepo.getPersonalColor(personalColorModel);
    _personalColor = PersonalColorModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _personalColor;
  }

  Future<PersonalColorModel> getPersonalColorCondition(PersonalColorModel personalColorModel) async {
    ApiResponse apiResponse = await personalColorRepo.getPersonalColorCondition(personalColorModel);
    _personalColor = PersonalColorModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _personalColor;
  }

  Future<void> getLatestPersonalColorList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestPersonalColorList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await personalColorRepo.getPersonalColorList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestPersonalColorList.addAll(PersonalColorList.fromList(apiResponse.response.data).personalColorList);
        _latestPageSize = PersonalColorList.fromList(apiResponse.response.data).count;
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
