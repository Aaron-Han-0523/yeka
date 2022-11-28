import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/request_model.dart';
import 'package:yeka/data/repository/request_repo.dart';

class RequestProvider extends ChangeNotifier {
  final RequestRepo requestRepo;

  RequestProvider({@required this.requestRepo});

  void addRequest(RequestModel requestModel) {
    requestRepo.addRequest(requestModel);
    notifyListeners();
  }
}
