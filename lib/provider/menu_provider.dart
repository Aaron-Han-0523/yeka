import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/data/model/response/menu_model.dart';
import 'package:yeka/data/repository/menu_repo.dart';
import 'package:yeka/helper/api_checker.dart';

class MenuProvider extends ChangeNotifier {
  final MenuRepo menuRepo;

  MenuProvider({@required this.menuRepo});

  MenuModel _menu;

  MenuModel get menu => _menu;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<MenuModel> _latestMenuList = [];
  List<MenuModel> _menuList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<MenuModel> get latestMenuList => _latestMenuList;
  List<MenuModel> get menuList => _menuList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addMenu(MenuModel menuModel) {
    menuRepo.addMenu(menuModel);
    notifyListeners();
  }

  void updateMenu(MenuModel menuModel) {
    menuRepo.updateMenu(menuModel);
    notifyListeners();
  }

  void deleteMenu(MenuModel menuModel) {
    menuRepo.deleteMenu(menuModel);
    notifyListeners();
  }

  Future<MenuModel> getMenu(MenuModel menuModel) async {
    ApiResponse apiResponse = await menuRepo.getMenu(menuModel);
    _menu = MenuModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _menu;
  }

  Future<void> getLatestMenuList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestMenuList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await menuRepo.getLatestMenuList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestMenuList.addAll(MenuList.fromList(apiResponse.response.data).menuList);
        _latestPageSize = MenuList.fromList(apiResponse.response.data).count;
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

  Future<void> getMenuList(MenuModel menuModel, BuildContext context,) async {
    _menuList = [];
    _filterFirstLoading = true;
    _filterIsLoading = true;

    ApiResponse apiResponse = await menuRepo.getMenuList(menuModel);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _menuList.addAll(MenuList.fromList(apiResponse.response.data).menuList);
      _filterFirstLoading = false;
      _filterIsLoading = false;
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }
}
