import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/image_model.dart';
import 'package:yeka/data/repository/image_repo.dart';

import 'package:yeka/data/model/response/base/api_response.dart';
import 'package:yeka/helper/api_checker.dart';

class CustomImageProvider extends ChangeNotifier {
  final ImageRepo imageRepo;

  CustomImageProvider({@required this.imageRepo});

  ImageModel _image;

  ImageModel get image => _image;

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<ImageModel> _latestImageList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<ImageModel> get latestImageList => _latestImageList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  void addImage(ImageModel imageModel) {
    imageRepo.addImage(imageModel);
    notifyListeners();
  }

  void updateImage(ImageModel imageModel) {
    imageRepo.updateImage(imageModel);
    notifyListeners();
  }

  void deleteImage(ImageModel imageModel) {
    imageRepo.deleteImage(imageModel);
    notifyListeners();
  }

  Future<ImageModel> getImage(ImageModel imageModel) async {
    ApiResponse apiResponse = await imageRepo.getImage(imageModel);
    _image = ImageModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _image;
  }

  Future<void> getLatestImageList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestImageList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await imageRepo.getImageList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestImageList.addAll(ImageList.fromList(apiResponse.response.data).imageList);
        _latestPageSize = ImageList.fromList(apiResponse.response.data).count;
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
