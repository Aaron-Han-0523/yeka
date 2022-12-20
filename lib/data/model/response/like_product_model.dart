class LikeProductModel {
  int _id;
  int _user_id;
  int _product_id;
  String _create_date;
  String _update_date;
  String _delete_date;

  LikeProductModel({
    int id,
    int user_id,
    int product_id,
    String create_date,
    String update_date,
    String delete_date,
  }) {
    this._id = id;
    this._user_id = user_id;
    this._product_id = product_id;
    this._create_date = create_date;
    this._update_date = update_date;
    this._delete_date = delete_date;
  }

  LikeProductModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _user_id = json['user_id'];
    _product_id = json['product_id'];
    _create_date = json['create_date'];
    _update_date = json['update_date'];
    _delete_date = json['delete_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['product_id'] = this.product_id;
    data['create_date'] = this.create_date;
    data['update_date'] = this.update_date;
    data['delete_date'] = this.delete_date;
    return data;
  }

  int get id => _id;

  int get user_id => _user_id;

  int get product_id => _product_id;

  String get create_date => _create_date;

  String get update_date => _update_date;

  String get delete_date => _delete_date;

  set id(int value) {
    _id = value;
  }

  set user_id(int value) {
    _user_id = value;
  }

  set product_id(int value) {
    _product_id = value;
  }

  set create_date(String value) {
    _create_date = value;
  }

  set update_date(String value) {
    _update_date = value;
  }

  set delete_date(String value) {
    _delete_date = value;
  }
}

class LikeProductList {
  int _count;
  List<LikeProductModel> _likeProductList;

  LikeProductList({int count, List<LikeProductModel> likeProductList}) {
    this._count = count;
    this._likeProductList = likeProductList;
  }

  int get count => _count;

  List<LikeProductModel> get likeProductList => _likeProductList;

  LikeProductList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _likeProductList = [];
      json['rows'].forEach((v) {
        _likeProductList.add(new LikeProductModel.fromJson(v));
      });
    }
  }

  LikeProductList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _likeProductList = [];
      iter.forEach((v) {
        _likeProductList
            .add(new LikeProductModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._likeProductList != null) {
      data['likeProductList'] =
          this._likeProductList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
