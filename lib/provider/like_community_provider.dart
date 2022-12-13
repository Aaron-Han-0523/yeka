import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/like_community_model.dart';
import 'package:yeka/data/repository/like_community_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class LikeCommunityProvider extends ChangeNotifier {
  final LikeCommunityRepo likeCommunityRepo;

  LikeCommunityProvider({@required this.likeCommunityRepo});

  LikeCommunityModel _likeCommunity;

  LikeCommunityModel get likeCommunity => _likeCommunity;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<LikeCommunityModel> _latestLikeCommunityList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<LikeCommunityModel> get latestLikeCommunityList => _latestLikeCommunityList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addLikeCommunity(LikeCommunityModel likeCommunityModel) {
    likeCommunityRepo.addLikeCommunity(likeCommunityModel);
    notifyListeners();
  }

  void updateLikeCommunity(LikeCommunityModel likeCommunityModel) {
    likeCommunityRepo.updateLikeCommunity(likeCommunityModel);
    notifyListeners();
  }

  void deleteLikeCommunity(LikeCommunityModel likeCommunityModel) {
    likeCommunityRepo.deleteLikeCommunity(likeCommunityModel);
    notifyListeners();
  }

  Future<LikeCommunityModel> getLikeCommunity(LikeCommunityModel likeCommunityModel) async {
    ApiResponse apiResponse = await likeCommunityRepo.getLikeCommunity(likeCommunityModel);
    _likeCommunity = LikeCommunityModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _likeCommunity;
  }

  Future<void> getLatestLikeCommunityList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestLikeCommunityList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await likeCommunityRepo.getLikeCommunityList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestLikeCommunityList.addAll(LikeCommunityList.fromList(apiResponse.response.data).likeCommunityList);
        _latestPageSize = LikeCommunityList.fromList(apiResponse.response.data).count;
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
