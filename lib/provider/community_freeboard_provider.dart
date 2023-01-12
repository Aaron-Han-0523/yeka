import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/community_model.dart';
import 'package:yeka/data/repository/community_freeboard_repo.dart';
import 'package:yeka/helper/api_checker.dart';

class CommunityFreeBoardProvider extends ChangeNotifier {
  final CommunityFreeBoardRepo communityRepo;

  CommunityFreeBoardProvider({@required this.communityRepo});

  CommunityModel _community;

  CommunityModel get community => _community;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;
  int _totalPageSize;
  int _currentPageNum = 0;

  List<CommunityModel> _latestCommunityList = [];
  List<CommunityModel> _communityNewsList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<CommunityModel> get latestCommunityList => _latestCommunityList;
  List<CommunityModel> get communityNewsList => _communityNewsList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;
  int get totalPageSize => _totalPageSize;
  int get currentPageNum => _currentPageNum;

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

/*
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
      ApiResponse apiResponse = await communityRepo.getLatestCommunityFreeBoardList(limit, offset * limit);
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
*/

  Future<void> getCommunityList(int pageNum, BuildContext context,) async {
    _latestCommunityList = [];

    _filterFirstLoading = true;
    _filterIsLoading = true;

    ApiResponse apiResponse = await communityRepo.getCommunityFreeBoardList(pageNum);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _latestCommunityList.addAll(CommunityList.fromList(apiResponse.response.data["rows"]).communityList);
      _totalPageSize = apiResponse.response.data["count"];
      _currentPageNum = pageNum;
      _filterFirstLoading = false;
      _filterIsLoading = false;
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }

  Future<void> getCommunityNewsList(CommunityModel communityModel, BuildContext context,) async {
    _communityNewsList = [];

    _filterFirstLoading = true;
    _filterIsLoading = true;

    ApiResponse apiResponse = await communityRepo.getCommunityFreeBoardNewsList(communityModel);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _communityNewsList.addAll(CommunityList.fromList(apiResponse.response.data["rows"]).communityList);
      _filterFirstLoading = false;
      _filterIsLoading = false;
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }
}
