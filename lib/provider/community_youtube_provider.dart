import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/community_model.dart';
import 'package:yeka/data/repository/community_youtube_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class CommunityYoutubeProvider extends ChangeNotifier {
  final CommunityYoutubeRepo communityRepo;

  CommunityYoutubeProvider({@required this.communityRepo});

  CommunityModel _community;

  CommunityModel get community => _community;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<CommunityModel> _latestCommunityList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<CommunityModel> get latestCommunityList => _latestCommunityList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addCommunity(CommunityModel communityModel) {
    communityRepo.addCommunity(communityModel);
    notifyListeners();
  }

  void updateCommunity(CommunityModel communityModel) {
    communityRepo.updateCommunity(communityModel);
    notifyListeners();
  }

  void deleteCommunity(CommunityModel communityModel) {
    communityRepo.deleteCommunity(communityModel);
    notifyListeners();
  }

  Future<CommunityModel> getCommunity(CommunityModel communityModel) async {
    ApiResponse apiResponse = await communityRepo.getCommunity(communityModel);
    _community = CommunityModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _community;
  }

  Future<void> getLatestCommunityList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestCommunityList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await communityRepo.getCommunityYoutubeList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestCommunityList.addAll(CommunityList.fromList(apiResponse.response.data).communityList);
        _latestPageSize = CommunityList.fromList(apiResponse.response.data).count;
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
