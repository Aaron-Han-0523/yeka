import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/order_model.dart';
import 'package:yeka/data/repository/order_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class OrderProvider extends ChangeNotifier {
  final OrderRepo orderRepo;

  OrderProvider({@required this.orderRepo});

  OrderModel _order;

  OrderModel get order => _order;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<OrderModel> _latestOrderList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<OrderModel> get latestOrderList => _latestOrderList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addOrder(OrderModel orderModel) {
    orderRepo.addOrder(orderModel);
    notifyListeners();
  }

  void updateOrder(OrderModel orderModel) {
    orderRepo.updateOrder(orderModel);
    notifyListeners();
  }

  void deleteOrder(OrderModel orderModel) {
    orderRepo.deleteOrder(orderModel);
    notifyListeners();
  }

  Future<OrderModel> getOrder(OrderModel orderModel) async {
    ApiResponse apiResponse = await orderRepo.getOrder(orderModel);
    _order = OrderModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _order;
  }

  Future<void> getLatestOrderList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestOrderList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await orderRepo.getOrderList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestOrderList.addAll(OrderList.fromJson(apiResponse.response.data).orderList);
        _latestPageSize = OrderList.fromJson(apiResponse.response.data).count;
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
