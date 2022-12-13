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
data['id'] = this.id;
data['product_id'] = this.product_id;
data['option_title'] = this.option_title;
data['option_content'] = this.option_content;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
return data;
}
int get id => _id;
int get product_id => _product_id;
String get option_title => _option_title;
String get option_content => _option_content;
String get create_date => _create_date;
String get update_date => _update_date;
String get delete_date => _delete_date;
set id(int value) { 
_id = value;
}
set product_id(int value) { 
_product_id = value;
}
set option_title(String value) { 
_option_title = value;
}
set option_content(String value) { 
_option_content = value;
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

class OptionList {
  int _count;
  List<OptionModel> _optionList;
  OptionList({int count, List<OptionModel> optionList}) {
    this._count = count;
    this._optionList = optionList;
  }
  int get count => _count;
  List<OptionModel> get optionList => _optionList;
  OptionList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _optionList = [];
      json['rows'].forEach((v) {
        _optionList.add(new OptionModel.fromJson(v));
     });
    }
  }
  OptionList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _optionList = [];
      iter.forEach((v) {
        _optionList.add(new OptionModel.fromJson(Map<String, dynamic>.from(v)));
     });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._optionList != null) {
      data['optionList'] = this._optionList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
