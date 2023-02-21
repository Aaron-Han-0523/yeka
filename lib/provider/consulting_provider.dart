import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/consulting_model.dart';
import 'package:yeka/data/repository/consulting_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class ConsultingProvider extends ChangeNotifier {
  final ConsultingRepo consultingRepo;

  ConsultingProvider({@required this.consultingRepo});

  ConsultingModel _consulting;

  ConsultingModel get consulting => _consulting;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<ConsultingModel> _latestConsultingList = [];
  List<ConsultingModel> _consultingList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<ConsultingModel> get latestConsultingList => _latestConsultingList;
  List<ConsultingModel> get consultingList => _consultingList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;

  bool get filterFirstLoading => _filterFirstLoading;

  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addConsulting(ConsultingModel consultingModel) {
    consultingRepo.addConsulting(consultingModel);
    notifyListeners();
  }

  void updateConsulting(ConsultingModel consultingModel) {
    consultingRepo.updateConsulting(consultingModel);
    notifyListeners();
  }

  void deleteConsulting(ConsultingModel consultingModel) {
    consultingRepo.deleteConsulting(consultingModel);
    notifyListeners();
  }

  Future<ConsultingModel> getConsulting(ConsultingModel consultingModel) async {
    ApiResponse apiResponse =
        await consultingRepo.getConsulting(consultingModel);
    _consulting = ConsultingModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _consulting;
  }

  Future<ConsultingModel> getConsultingByClientId(
      ConsultingModel consultingModel) async {
    ApiResponse apiResponse =
        await consultingRepo.getConsultingByClientId(consultingModel);
    if (apiResponse.response != null)
      _consulting = ConsultingModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _consulting;
  }

  Future<void> getLatestConsultingList(int offset, int user_id, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestConsultingList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await consultingRepo.getConsultingList(
          limit, offset * limit, user_id);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestConsultingList.addAll(
            ConsultingList.fromList(apiResponse.response.data).consultingList);
        _latestPageSize =
            ConsultingList.fromList(apiResponse.response.data).count;
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

  Future<void> getConsultingByClientIdList(ConsultingModel consultingModel,
      {bool reload = false}) async {
    if (reload) {
      _consultingList = [];
    }
    ApiResponse apiResponse =
        await consultingRepo.getConsultingByClientIdList(consultingModel);
    if (apiResponse.response != null) {
      _consultingList.addAll(
          ConsultingList.fromList(apiResponse.response.data).consultingList);
      return _consultingList;
    }
  }
}
