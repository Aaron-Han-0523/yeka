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
data['id'] = this.id;
data['image_type'] = this.image_type;
data['product_id'] = this.product_id;
data['consultant_id'] = this.consultant_id;
data['community_id'] = this.community_id;
data['title'] = this.title;
data['content'] = this.content;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
return data;
}
int get id => _id;
int get image_type => _image_type;
int get product_id => _product_id;
int get consultant_id => _consultant_id;
int get community_id => _community_id;
String get title => _title;
String get content => _content;
String get create_date => _create_date;
String get update_date => _update_date;
String get delete_date => _delete_date;
set id(int value) { 
_id = value;
}
set image_type(int value) { 
_image_type = value;
}
set product_id(int value) { 
_product_id = value;
}
set consultant_id(int value) { 
_consultant_id = value;
}
set community_id(int value) { 
_community_id = value;
}
set title(String value) { 
_title = value;
}
set content(String value) { 
_content = value;
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

class ImageList {
  int _count;
  List<ImageModel> _imageList;
  ImageList({int count, List<ImageModel> imageList}) {
    this._count = count;
    this._imageList = imageList;
  }
  int get count => _count;
  List<ImageModel> get imageList => _imageList;
  ImageList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _imageList = [];
      json['rows'].forEach((v) {
        _imageList.add(new ImageModel.fromJson(v));
     });
    }
  }
  ImageList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _imageList = [];
      iter.forEach((v) {
        _imageList.add(new ImageModel.fromJson(Map<String, dynamic>.from(v)));
     });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._imageList != null) {
      data['imageList'] = this._imageList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
