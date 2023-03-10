import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/product_model.dart';
import 'package:yeka/data/repository/product_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo productRepo;

  ProductProvider({@required this.productRepo});

  ProductModel _product;

  ProductModel get product => _product;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;
  int _latestMyFavoritePageSize;

  List<ProductModel> _latestProductList = [];
  List<ProductModel> _latestProductMyFavoriteList = [];
  List<int> _offsetList = [];
  List<int> _offsetMyFavoriteList = [];
  int _lOffset = 0;
  int _lMyFavoriteOffset = 0;
  int limit = 6;

  List<ProductModel> get latestProductList => _latestProductList;
  List<ProductModel> get latestProductMyFavoriteList => _latestProductMyFavoriteList;

  int get lOffset => _lOffset;
  int get lMyFavoriteOffset => _lMyFavoriteOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;
  int get latestMyFavoritePageSize => _latestMyFavoritePageSize;

  void addProduct(ProductModel productModel) {
    productRepo.addProduct(productModel);
    notifyListeners();
  }

  void updateProduct(ProductModel productModel) {
    productRepo.updateProduct(productModel);
    notifyListeners();
  }

  void deleteProduct(ProductModel productModel) {
    productRepo.deleteProduct(productModel);
    notifyListeners();
  }

  Future<ProductModel> getProduct(ProductModel productModel) async {
    ApiResponse apiResponse = await productRepo.getProduct(productModel);
    _product = ProductModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _product;
  }

  Future<void> getLatestProductList(int offset, int user_id, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestProductList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await productRepo.getProductList(limit, offset * limit, user_id);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestProductList.addAll(ProductList.fromList(apiResponse.response.data).productList);
        _latestPageSize = ProductList.fromList(apiResponse.response.data).count;
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

  Future<void> getLatestProductMyFavoriteList(int offset, int user_id, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetMyFavoriteList = [];
      _latestProductMyFavoriteList = [];
    }

    _lMyFavoriteOffset = offset;

    if (!_offsetMyFavoriteList.contains(offset)) {
      _offsetMyFavoriteList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await productRepo.getProductMyFavoriteList(limit, offset * limit, user_id);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestProductMyFavoriteList.addAll(ProductList.fromList(apiResponse.response.data).productList);
        _latestMyFavoritePageSize = ProductList.fromList(apiResponse.response.data).count;
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
