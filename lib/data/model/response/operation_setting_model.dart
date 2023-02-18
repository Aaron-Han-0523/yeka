class OperationSettingModel {
int _id;
String _week_setting;
String _start_time;
String _end_time;
String _create_date;
String _update_date;
String _delete_date;
OperationSettingModel({
int id,
String week_setting,
String start_time,
String end_time,
String create_date,
String update_date,
String delete_date,
}) {
this._id = id;
this._week_setting = week_setting;
this._start_time = start_time;
this._end_time = end_time;
this._create_date = create_date;
this._update_date = update_date;
this._delete_date = delete_date;
}
OperationSettingModel.fromJson(Map<String, dynamic> json) {
_id = json['id'];
_week_setting = json['week_setting'];
_start_time = json['start_time'];
_end_time = json['end_time'];
_create_date = json['create_date'];
_update_date = json['update_date'];
_delete_date = json['delete_date'];
}
Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['week_setting'] = this.week_setting;
data['start_time'] = this.start_time;
data['end_time'] = this.end_time;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
return data;
}
Map<String, dynamic> toJsonNotNull() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if(this.id!=null) data['id'] = this.id;
if(this.week_setting!=null) data['week_setting'] = this.week_setting;
if(this.start_time!=null) data['start_time'] = this.start_time;
if(this.end_time!=null) data['end_time'] = this.end_time;
if(this.create_date!=null) data['create_date'] = this.create_date;
if(this.update_date!=null) data['update_date'] = this.update_date;
if(this.delete_date!=null) data['delete_date'] = this.delete_date;
return data;
}
int get id => _id;
String get week_setting => _week_setting;
String get start_time => _start_time;
String get end_time => _end_time;
String get create_date => _create_date;
String get update_date => _update_date;
String get delete_date => _delete_date;
set id(int value) { 
_id = value;
}
set week_setting(String value) { 
_week_setting = value;
}
set start_time(String value) { 
_start_time = value;
}
set end_time(String value) { 
_end_time = value;
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

class OperationSettingList {
  int _count;
  List<OperationSettingModel> _operationSettingList;
  OperationSettingList({int count, List<OperationSettingModel> operationSettingList}) {
    this._count = count;
    this._operationSettingList = operationSettingList;
  }
  int get count => _count;
  List<OperationSettingModel> get operationSettingList => _operationSettingList;
  OperationSettingList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _operationSettingList = [];
      json['rows'].forEach((v) {
        _operationSettingList.add(new OperationSettingModel.fromJson(v));
     });
    }
  }
  OperationSettingList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _operationSettingList = [];
      iter.forEach((v) {
        _operationSettingList.add(new OperationSettingModel.fromJson(Map<String, dynamic>.from(v)));
     });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._operationSettingList != null) {
      data['operationSettingList'] = this._operationSettingList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
