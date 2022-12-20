class LikeCommunityModel {
  int _id;
  int _user_id;
  int _community_id;
  String _create_date;
  String _update_date;
  String _delete_date;
  LikeCommunityModel({
    int id,
    int user_id,
    int community_id,
    String create_date,
    String update_date,
    String delete_date,
  }) {
    this._id = id;
    this._user_id = user_id;
    this._community_id = community_id;
    this._create_date = create_date;
    this._update_date = update_date;
    this._delete_date = delete_date;
  }
  LikeCommunityModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _user_id = json['user_id'];
    _community_id = json['community_id'];
    _create_date = json['create_date'];
    _update_date = json['update_date'];
    _delete_date = json['delete_date'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['community_id'] = this.community_id;
    data['create_date'] = this.create_date;
    data['update_date'] = this.update_date;
    data['delete_date'] = this.delete_date;
    return data;
  }
  int get id => _id;
  int get user_id => _user_id;
  int get community_id => _community_id;
  String get create_date => _create_date;
  String get update_date => _update_date;
  String get delete_date => _delete_date;
  set id(int value) {
    _id = value;
  }
  set user_id(int value) {
    _user_id = value;
  }
  set community_id(int value) {
    _community_id = value;
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

class LikeCommunityList {
  int _count;
  List<LikeCommunityModel> _likeCommunityList;
  LikeCommunityList({int count, List<LikeCommunityModel> likeCommunityList}) {
    this._count = count;
    this._likeCommunityList = likeCommunityList;
  }
  int get count => _count;
  List<LikeCommunityModel> get likeCommunityList => _likeCommunityList;
  LikeCommunityList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _likeCommunityList = [];
      json['rows'].forEach((v) {
        _likeCommunityList.add(new LikeCommunityModel.fromJson(v));
      });
    }
  }
  LikeCommunityList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _likeCommunityList = [];
      iter.forEach((v) {
        _likeCommunityList.add(new LikeCommunityModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._likeCommunityList != null) {
      data['likeCommunityList'] = this._likeCommunityList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
