class ProductModel {
  int _id;
  String _title;
  String _description;
  int _price;
  int _delivery_fee;
  String _tag;
  String _create_date;
  String _update_date;
  String _delete_date;

  ProductModel({
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

  ProductModel.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['price'] = this._price;
    data['delivery_fee'] = this._delivery_fee;
    data['tag'] = this._tag;
    data['create_date'] = this._create_date;
    data['update_date'] = this._update_date;
    data['delete_date'] = this._delete_date;
    return data;
  }

  String get delete_date => _delete_date;

  set delete_date(String value) {
    _delete_date = value;
  }

  String get update_date => _update_date;

  set update_date(String value) {
    _update_date = value;
  }

  String get create_date => _create_date;

  set create_date(String value) {
    _create_date = value;
  }

  String get tag => _tag;

  set tag(String value) {
    _tag = value;
  }

  int get delivery_fee => _delivery_fee;

  set delivery_fee(int value) {
    _delivery_fee = value;
  }

  int get price => _price;

  set price(int value) {
    _price = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
