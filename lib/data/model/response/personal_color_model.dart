class PersonalColorModel {
int _id;
int _season;
int _detail_season_type;
String _fashion;
String _hair;
String _perfume;
String _makeup_base;
String _makeup_eye;
String _makeup_blusher;
String _lip;
String _matching_color_array;
String _description;
String _tag;
String _create_date;
String _update_date;
String _delete_date;
PersonalColorModel({
int id,
int season,
int detail_season_type,
String fashion,
String hair,
String perfume,
String makeup_base,
String makeup_eye,
String makeup_blusher,
String lip,
String matching_color_array,
String description,
String tag,
String create_date,
String update_date,
String delete_date,
}) {
this._id = id;
this._season = season;
this._detail_season_type = detail_season_type;
this._fashion = fashion;
this._hair = hair;
this._perfume = perfume;
this._makeup_base = makeup_base;
this._makeup_eye = makeup_eye;
this._makeup_blusher = makeup_blusher;
this._lip = lip;
this._matching_color_array = matching_color_array;
this._description = description;
this._tag = tag;
this._create_date = create_date;
this._update_date = update_date;
this._delete_date = delete_date;
}
PersonalColorModel.fromJson(Map<String, dynamic> json) {
_id = json['id'];
_season = json['season'];
_detail_season_type = json['detail_season_type'];
_fashion = json['fashion'];
_hair = json['hair'];
_perfume = json['perfume'];
_makeup_base = json['makeup_base'];
_makeup_eye = json['makeup_eye'];
_makeup_blusher = json['makeup_blusher'];
_lip = json['lip'];
_matching_color_array = json['matching_color_array'];
_description = json['description'];
_tag = json['tag'];
_create_date = json['create_date'];
_update_date = json['update_date'];
_delete_date = json['delete_date'];
}
Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['season'] = this.season;
data['detail_season_type'] = this.detail_season_type;
data['fashion'] = this.fashion;
data['hair'] = this.hair;
data['perfume'] = this.perfume;
data['makeup_base'] = this.makeup_base;
data['makeup_eye'] = this.makeup_eye;
data['makeup_blusher'] = this.makeup_blusher;
data['lip'] = this.lip;
data['matching_color_array'] = this.matching_color_array;
data['description'] = this.description;
data['tag'] = this.tag;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
return data;
}
int get id => _id;
int get season => _season;
int get detail_season_type => _detail_season_type;
String get fashion => _fashion;
String get hair => _hair;
String get perfume => _perfume;
String get makeup_base => _makeup_base;
String get makeup_eye => _makeup_eye;
String get makeup_blusher => _makeup_blusher;
String get lip => _lip;
String get matching_color_array => _matching_color_array;
String get description => _description;
String get tag => _tag;
String get create_date => _create_date;
String get update_date => _update_date;
String get delete_date => _delete_date;
set id(int value) { 
_id = value;
}
set season(int value) { 
_season = value;
}
set detail_season_type(int value) { 
_detail_season_type = value;
}
set fashion(String value) { 
_fashion = value;
}
set hair(String value) { 
_hair = value;
}
set perfume(String value) { 
_perfume = value;
}
set makeup_base(String value) { 
_makeup_base = value;
}
set makeup_eye(String value) { 
_makeup_eye = value;
}
set makeup_blusher(String value) { 
_makeup_blusher = value;
}
set lip(String value) { 
_lip = value;
}
set matching_color_array(String value) { 
_matching_color_array = value;
}
set description(String value) { 
_description = value;
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

class PersonalColorList {
  int _count;
  List<PersonalColorModel> _personalColorList;
  PersonalColorList({int count, List<PersonalColorModel> personalColorList}) {
    this._count = count;
    this._personalColorList = personalColorList;
  }
  int get count => _count;
  List<PersonalColorModel> get personalColorList => _personalColorList;
  PersonalColorList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _personalColorList = [];
      json['rows'].forEach((v) {
        _personalColorList.add(new PersonalColorModel.fromJson(v));
     });
    }
  }
  PersonalColorList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _personalColorList = [];
      iter.forEach((v) {
        _personalColorList.add(new PersonalColorModel.fromJson(Map<String, dynamic>.from(v)));
     });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._personalColorList != null) {
      data['personalColorList'] = this._personalColorList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
