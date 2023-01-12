import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/like_product_model.dart';
import 'package:yeka/data/repository/like_product_repo.dart';
import 'package:yeka/helper/api_checker.dart';

class LikeProductProvider extends ChangeNotifier {
  final LikeProductRepo likeProductRepo;

  LikeProductProvider({@required this.likeProductRepo});

  LikeProductModel _likeProduct;

  LikeProductModel get likeProduct => _likeProduct;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<LikeProductModel> _latestLikeProductList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<LikeProductModel> get latestLikeProductList => _latestLikeProductList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addLikeProduct(LikeProductModel likeProductModel) async {
    await likeProductRepo.addLikeProduct(likeProductModel);
    notifyListeners();
  }

  void updateLikeProduct(LikeProductModel likeProductModel) {
    likeProductRepo.updateLikeProduct(likeProductModel);
    notifyListeners();
  }

  void deleteLikeProduct(LikeProductModel likeProductModel) async {
    await likeProductRepo.deleteLikeProduct(likeProductModel);
    notifyListeners();
  }

  Future<LikeProductModel> getLikeProduct(LikeProductModel likeProductModel) async {
    ApiResponse apiResponse = await likeProductRepo.getLikeProduct(likeProductModel);
    _likeProduct = LikeProductModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _likeProduct;
  }

  Future<void> getLatestLikeProductList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestLikeProductList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await likeProductRepo.getLikeProductList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestLikeProductList.addAll(LikeProductList.fromList(apiResponse.response.data).likeProductList);
        _latestPageSize = LikeProductList.fromList(apiResponse.response.data).count;
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
