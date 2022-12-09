class CommunityModel {
int _id;
int _community_type;
String _community_title;
String _community_content;
String _community_link;
String _writer;
String _create_date;
String _update_date;
String _delete_date;
CommunityModel({
int id,
int community_type,
String community_title,
String community_content,
String community_link,
String writer,
String create_date,
String update_date,
String delete_date,
}) {
this._id = id;
this._community_type = community_type;
this._community_title = community_title;
this._community_content = community_content;
this._community_link = community_link;
this._writer = writer;
this._create_date = create_date;
this._update_date = update_date;
this._delete_date = delete_date;
}
CommunityModel.fromJson(Map<String, dynamic> json) {
_id = json['id'];
_community_type = json['community_type'];
_community_title = json['community_title'];
_community_content = json['community_content'];
_community_link = json['community_link'];
_writer = json['writer'];
_create_date = json['create_date'];
_update_date = json['update_date'];
_delete_date = json['delete_date'];
}
Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['community_type'] = this.community_type;
data['community_title'] = this.community_title;
data['community_content'] = this.community_content;
data['community_link'] = this.community_link;
data['writer'] = this.writer;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
return data;
}
int get id => _id;
int get community_type => _community_type;
String get community_title => _community_title;
String get community_content => _community_content;
String get community_link => _community_link;
String get writer => _writer;
String get create_date => _create_date;
String get update_date => _update_date;
String get delete_date => _delete_date;
set id(int value) { 
_id = value;
}
set community_type(int value) { 
_community_type = value;
}
set community_title(String value) { 
_community_title = value;
}
set community_content(String value) { 
_community_content = value;
}
set community_link(String value) { 
_community_link = value;
}
set writer(String value) { 
_writer = value;
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

class CommunityList {
  int _count;
  List<CommunityModel> _communityList;
  CommunityList({int count, List<CommunityModel> communityList}) {
    this._count = count;
    this._communityList = communityList;
  }
  int get count => _count;
  List<CommunityModel> get communityList => _communityList;
  CommunityList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _communityList = [];
      json['rows'].forEach((v) {
        _communityList.add(new CommunityModel.fromJson(v));
     });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._communityList != null) {
      data['communityList'] = this._communityList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
