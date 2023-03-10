class ProductModel {
int _id;
String _title;
String _description;
int _price;
int _delivery_fee;
String _tag;
String _create_date;
String _update_date;
String _delete_date;
String _thumbnail;
int _like_product_id;
ProductModel({
int id,
String title,
String description,
int price,
int delivery_fee,
String tag,
String create_date,
String update_date,
String delete_date,
String thumbnail,
int like_product_id,
}) {
this._id = id;
this._title = title;
this._description = description;
this._price = price;
this._delivery_fee = delivery_fee;
this._tag = tag;
this._create_date = create_date;
this._update_date = update_date;
this._delete_date = delete_date;
this._thumbnail = thumbnail;
this._like_product_id = like_product_id;
}
ProductModel.fromJson(Map<String, dynamic> json) {
_id = json['id'];
_title = json['title'];
_description = json['description'];
_price = json['price'];
_delivery_fee = json['delivery_fee'];
_tag = json['tag'];
_create_date = json['create_date'];
_update_date = json['update_date'];
_delete_date = json['delete_date'];
_thumbnail = json['thumbnail'];
_like_product_id = json['like_product_id'];
}
Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['title'] = this.title;
data['description'] = this.description;
data['price'] = this.price;
data['delivery_fee'] = this.delivery_fee;
data['tag'] = this.tag;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
data['thumbnail'] = this.thumbnail;
data['like_product_id'] = this.like_product_id;
return data;
}
Map<String, dynamic> toJsonNotNull() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if(this.id!=null) data['id'] = this.id;
if(this.title!=null) data['title'] = this.title;
if(this.description!=null) data['description'] = this.description;
if(this.price!=null) data['price'] = this.price;
if(this.delivery_fee!=null) data['delivery_fee'] = this.delivery_fee;
if(this.tag!=null) data['tag'] = this.tag;
if(this.create_date!=null) data['create_date'] = this.create_date;
if(this.update_date!=null) data['update_date'] = this.update_date;
if(this.delete_date!=null) data['delete_date'] = this.delete_date;
if(this.thumbnail!=null) data['thumbnail'] = this.thumbnail;
if(this.like_product_id!=null) data['like_product_id'] = this.like_product_id;
return data;
}
int get id => _id;
String get title => _title;
String get description => _description;
int get price => _price;
int get delivery_fee => _delivery_fee;
String get tag => _tag;
String get create_date => _create_date;
String get update_date => _update_date;
String get delete_date => _delete_date;
String get thumbnail => _thumbnail;
int get like_product_id => _like_product_id;
set id(int value) { 
_id = value;
}
set title(String value) { 
_title = value;
}
set description(String value) { 
_description = value;
}
set price(int value) { 
_price = value;
}
set delivery_fee(int value) { 
_delivery_fee = value;
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
set thumbnail(String value) { 
_thumbnail = value;
}
set like_product_id(int value) { 
_like_product_id = value;
}
}

class ProductList {
  int _count;
  List<ProductModel> _productList;
  ProductList({int count, List<ProductModel> productList}) {
    this._count = count;
    this._productList = productList;
  }
  int get count => _count;
  List<ProductModel> get productList => _productList;
  ProductList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _productList = [];
      json['rows'].forEach((v) {
        _productList.add(new ProductModel.fromJson(v));
     });
    }
  }
  ProductList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _productList = [];
      iter.forEach((v) {
        _productList.add(new ProductModel.fromJson(Map<String, dynamic>.from(v)));
     });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._productList != null) {
      data['productList'] = this._productList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
