class MenuModel {
  int _id;
  int _consultant_id;
  String _menu_title;
  int _menu_amount;
  String _menu_content;
  String _menu_image;
  String _create_date;
  String _update_date;
  String _delete_date;

  MenuModel({
    int id,
    int consultant_id,
    String menu_title,
    int menu_amount,
    String menu_content,
    String menu_image,
    String create_date,
    String update_date,
    String delete_date,
  }) {
    this._id = id;
    this._consultant_id = consultant_id;
    this._menu_title = menu_title;
    this._menu_amount = menu_amount;
    this._menu_content = menu_content;
    this._menu_image = menu_image;
    this._create_date = create_date;
    this._update_date = update_date;
    this._delete_date = delete_date;
  }

  MenuModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _consultant_id = json['consultant_id'];
    _menu_title = json['menu_title'];
    _menu_amount = json['menu_amount'];
    _menu_content = json['menu_content'];
    _menu_image = json['menu_image'];
    _create_date = json['create_date'];
    _update_date = json['update_date'];
    _delete_date = json['delete_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['consultant_id'] = this._consultant_id;
    data['menu_title'] = this._menu_title;
    data['menu_amount'] = this._menu_amount;
    data['menu_content'] = this._menu_content;
    data['menu_image'] = this._menu_image;
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

  String get menu_image => _menu_image;

  set menu_image(String value) {
    _menu_image = value;
  }

  String get menu_content => _menu_content;

  set menu_content(String value) {
    _menu_content = value;
  }

  int get menu_amount => _menu_amount;

  set menu_amount(int value) {
    _menu_amount = value;
  }

  String get menu_title => _menu_title;

  set menu_title(String value) {
    _menu_title = value;
  }

  int get consultant_id => _consultant_id;

  set consultant_id(int value) {
    _consultant_id = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
