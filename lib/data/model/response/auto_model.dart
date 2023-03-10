class AutoModel {
  int _id;
  String _title;
  String _description;
  int _price;
  int _delivery_fee;
  String _tag;
  String _create_date;
  String _update_date;
  String _delete_date;

  AutoModel({
    int id,
    String title,
    String description,
    int price,
    int delivery_fee,
    String tag,
    String create_date,
    String update_date,
    String delete_date,
  }) {
    this._id = id;
    this._title = title;
    this._description = description;
    this._price = price;
    this._delivery_fee = delivery_fee;
    this._tag = tag;
    this._create_date = create_date;
    this._update_date = update_date;
    this._delete_date = delete_date;
  }

  AutoModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _delivery_fee = json['delivery_fee'];
    _tag = json['tag'];
    _create_date = json['create_date'];
    _update_date = json['update_date'];
    _delete_date = json['delete_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['delivery_fee'] = this.delivery_fee;
    data['tag'] = this.tag;
    data['create_date'] = this.create_date;
    data['update_date'] = this.update_date;
    data['delete_date'] = this.delete_date;
    return data;
  }

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get price => _price;

  int get delivery_fee => _delivery_fee;

  String get tag => _tag;

  String get create_date => _create_date;

  String get update_date => _update_date;

  String get delete_date => _delete_date;

  set id(int value) {
    _id = value;
  }

  set title(String value) {
    _title = value;
  }

  set description(String value) {
    _description = value;
  }

  set price(int value) {
    _price = value;
  }

  set delivery_fee(int value) {
    _delivery_fee = value;
  }

  set tag(String value) {
    _tag = value;
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

class AutoList {
  int _count;
  List<AutoModel> _autoList;

  AutoList({int count, List<AutoModel> autoList}) {
    this._count = count;
    this._autoList = autoList;
  }

  int get count => _count;

  List<AutoModel> get autoList => _autoList;

  AutoList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _autoList = [];
      json['rows'].forEach((v) {
        _autoList.add(new AutoModel.fromJson(v));
      });
    }
  }

  AutoList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _autoList = [];
      iter.forEach((v) {
        _autoList.add(new AutoModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._autoList != null) {
      data['autoList'] = this._autoList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
