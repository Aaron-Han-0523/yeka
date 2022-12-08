class ImageModel {
  int _id;
  int _image_type;
  int _product_id;
  int _consultant_id;
  int _community_id;
  String _title;
  String _content;
  String _create_date;
  String _update_date;
  String _delete_date;

  ImageModel({
    int id,
    int image_type,
    int product_id,
    int consultant_id,
    int community_id,
    String title,
    String content,
    String create_date,
    String update_date,
    String delete_date,
  }) {
    this._id = id;
    this._image_type = image_type;
    this._product_id = product_id;
    this._consultant_id = consultant_id;
    this._community_id = community_id;
    this._title = title;
    this._content = content;
    this._create_date = create_date;
    this._update_date = update_date;
    this._delete_date = delete_date;
  }

  ImageModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image_type = json['image_type'];
    _product_id = json['product_id'];
    _consultant_id = json['consultant_id'];
    _community_id = json['community_id'];
    _title = json['title'];
    _content = json['content'];
    _create_date = json['create_date'];
    _update_date = json['update_date'];
    _delete_date = json['delete_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['image_type'] = this._image_type;
    data['product_id'] = this._product_id;
    data['consultant_id'] = this._consultant_id;
    data['community_id'] = this._community_id;
    data['title'] = this._title;
    data['content'] = this._content;
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

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get community_id => _community_id;

  set community_id(int value) {
    _community_id = value;
  }

  int get consultant_id => _consultant_id;

  set consultant_id(int value) {
    _consultant_id = value;
  }

  int get product_id => _product_id;

  set product_id(int value) {
    _product_id = value;
  }

  int get image_type => _image_type;

  set image_type(int value) {
    _image_type = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
