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
data['id'] = this.id;
data['consultant_id'] = this.consultant_id;
data['menu_title'] = this.menu_title;
data['menu_amount'] = this.menu_amount;
data['menu_content'] = this.menu_content;
data['menu_image'] = this.menu_image;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
return data;
}
Map<String, dynamic> toJsonNotNull() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if(this.id!=null) data['id'] = this.id;
if(this.consultant_id!=null) data['consultant_id'] = this.consultant_id;
if(this.menu_title!=null) data['menu_title'] = this.menu_title;
if(this.menu_amount!=null) data['menu_amount'] = this.menu_amount;
if(this.menu_content!=null) data['menu_content'] = this.menu_content;
if(this.menu_image!=null) data['menu_image'] = this.menu_image;
if(this.create_date!=null) data['create_date'] = this.create_date;
if(this.update_date!=null) data['update_date'] = this.update_date;
if(this.delete_date!=null) data['delete_date'] = this.delete_date;
return data;
}
int get id => _id;
int get consultant_id => _consultant_id;
String get menu_title => _menu_title;
int get menu_amount => _menu_amount;
String get menu_content => _menu_content;
String get menu_image => _menu_image;
String get create_date => _create_date;
String get update_date => _update_date;
String get delete_date => _delete_date;
set id(int value) { 
_id = value;
}
set consultant_id(int value) { 
_consultant_id = value;
}
set menu_title(String value) { 
_menu_title = value;
}
set menu_amount(int value) { 
_menu_amount = value;
}
set menu_content(String value) { 
_menu_content = value;
}
set menu_image(String value) { 
_menu_image = value;
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

class MenuList {
  int _count;
  List<MenuModel> _menuList;
  MenuList({int count, List<MenuModel> menuList}) {
    this._count = count;
    this._menuList = menuList;
  }
  int get count => _count;
  List<MenuModel> get menuList => _menuList;
  MenuList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _menuList = [];
      json['rows'].forEach((v) {
        _menuList.add(new MenuModel.fromJson(v));
     });
    }
  }
  MenuList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _menuList = [];
      iter.forEach((v) {
        _menuList.add(new MenuModel.fromJson(Map<String, dynamic>.from(v)));
     });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._menuList != null) {
      data['menuList'] = this._menuList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
