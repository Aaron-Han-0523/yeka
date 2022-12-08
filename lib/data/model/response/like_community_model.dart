class LikeCommunityModel {
  int _id;
  int _user_id;
  String _community_title;
  String _create_date;
  String _update_date;
  String _delete_date;

  LikeCommunityModel({
    int id,
    int user_id,
    String community_title,
    String create_date,
    String update_date,
    String delete_date,
  }) {
    this._id = id;
    this._user_id = user_id;
    this._community_title = community_title;
    this._create_date = create_date;
    this._update_date = update_date;
    this._delete_date = delete_date;
  }

  LikeCommunityModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _user_id = json['user_id'];
    _community_title = json['community_title'];
    _create_date = json['create_date'];
    _update_date = json['update_date'];
    _delete_date = json['delete_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._user_id;
    data['community_title'] = this._community_title;
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

  String get community_title => _community_title;

  set community_title(String value) {
    _community_title = value;
  }

  int get user_id => _user_id;

  set user_id(int value) {
    _user_id = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
