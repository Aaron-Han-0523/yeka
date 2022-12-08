class OptionModel {
  int _id;
  int _product_id;
  String _option_title;
  String _option_content;
  String _create_date;
  String _update_date;
  String _delete_date;

  OptionModel({
    int id,
    int product_id,
    String option_title,
    String option_content,
    String create_date,
    String update_date,
    String delete_date,
  }) {
    this._id = id;
    this._product_id = product_id;
    this._option_title = option_title;
    this._option_content = option_content;
    this._create_date = create_date;
    this._update_date = update_date;
    this._delete_date = delete_date;
  }

  OptionModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _product_id = json['product_id'];
    _option_title = json['option_title'];
    _option_content = json['option_content'];
    _create_date = json['create_date'];
    _update_date = json['update_date'];
    _delete_date = json['delete_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_id'] = this._product_id;
    data['option_title'] = this._option_title;
    data['option_content'] = this._option_content;
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

  String get option_content => _option_content;

  set option_content(String value) {
    _option_content = value;
  }

  String get option_title => _option_title;

  set option_title(String value) {
    _option_title = value;
  }

  int get product_id => _product_id;

  set product_id(int value) {
    _product_id = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
