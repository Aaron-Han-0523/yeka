class OrderModel {
int _id;
int _orderer_id;
String _orderer_name;
String _orderer_phone;
String _orderer_address1;
String _orderer_address2;
String _orderer_address3;
String _orderer_email;
String _recipient_place;
String _recipient_name;
String _recipient_phone;
String _recipient_address1;
String _recipient_address2;
String _recipient_address3;
String _image1;
String _title;
String _option;
int _quantity;
int _price;
int _delivery_fee;
int _total_fee;
String _create_date;
String _update_date;
String _delete_date;
OrderModel({
int id,
int orderer_id,
String orderer_name,
String orderer_phone,
String orderer_address1,
String orderer_address2,
String orderer_address3,
String orderer_email,
String recipient_place,
String recipient_name,
String recipient_phone,
String recipient_address1,
String recipient_address2,
String recipient_address3,
String image1,
String title,
String option,
int quantity,
int price,
int delivery_fee,
int total_fee,
String create_date,
String update_date,
String delete_date,
}) {
this._id = id;
this._orderer_id = orderer_id;
this._orderer_name = orderer_name;
this._orderer_phone = orderer_phone;
this._orderer_address1 = orderer_address1;
this._orderer_address2 = orderer_address2;
this._orderer_address3 = orderer_address3;
this._orderer_email = orderer_email;
this._recipient_place = recipient_place;
this._recipient_name = recipient_name;
this._recipient_phone = recipient_phone;
this._recipient_address1 = recipient_address1;
this._recipient_address2 = recipient_address2;
this._recipient_address3 = recipient_address3;
this._image1 = image1;
this._title = title;
this._option = option;
this._quantity = quantity;
this._price = price;
this._delivery_fee = delivery_fee;
this._total_fee = total_fee;
this._create_date = create_date;
this._update_date = update_date;
this._delete_date = delete_date;
}
OrderModel.fromJson(Map<String, dynamic> json) {
_id = json['id'];
_orderer_id = json['orderer_id'];
_orderer_name = json['orderer_name'];
_orderer_phone = json['orderer_phone'];
_orderer_address1 = json['orderer_address1'];
_orderer_address2 = json['orderer_address2'];
_orderer_address3 = json['orderer_address3'];
_orderer_email = json['orderer_email'];
_recipient_place = json['recipient_place'];
_recipient_name = json['recipient_name'];
_recipient_phone = json['recipient_phone'];
_recipient_address1 = json['recipient_address1'];
_recipient_address2 = json['recipient_address2'];
_recipient_address3 = json['recipient_address3'];
_image1 = json['image1'];
_title = json['title'];
_option = json['option'];
_quantity = json['quantity'];
_price = json['price'];
_delivery_fee = json['delivery_fee'];
_total_fee = json['total_fee'];
_create_date = json['create_date'];
_update_date = json['update_date'];
_delete_date = json['delete_date'];
}
Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['orderer_id'] = this.orderer_id;
data['orderer_name'] = this.orderer_name;
data['orderer_phone'] = this.orderer_phone;
data['orderer_address1'] = this.orderer_address1;
data['orderer_address2'] = this.orderer_address2;
data['orderer_address3'] = this.orderer_address3;
data['orderer_email'] = this.orderer_email;
data['recipient_place'] = this.recipient_place;
data['recipient_name'] = this.recipient_name;
data['recipient_phone'] = this.recipient_phone;
data['recipient_address1'] = this.recipient_address1;
data['recipient_address2'] = this.recipient_address2;
data['recipient_address3'] = this.recipient_address3;
data['image1'] = this.image1;
data['title'] = this.title;
data['option'] = this.option;
data['quantity'] = this.quantity;
data['price'] = this.price;
data['delivery_fee'] = this.delivery_fee;
data['total_fee'] = this.total_fee;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
return data;
}
Map<String, dynamic> toJsonNotNull() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if(this.id!=null) data['id'] = this.id;
if(this.orderer_id!=null) data['orderer_id'] = this.orderer_id;
if(this.orderer_name!=null) data['orderer_name'] = this.orderer_name;
if(this.orderer_phone!=null) data['orderer_phone'] = this.orderer_phone;
if(this.orderer_address1!=null) data['orderer_address1'] = this.orderer_address1;
if(this.orderer_address2!=null) data['orderer_address2'] = this.orderer_address2;
if(this.orderer_address3!=null) data['orderer_address3'] = this.orderer_address3;
if(this.orderer_email!=null) data['orderer_email'] = this.orderer_email;
if(this.recipient_place!=null) data['recipient_place'] = this.recipient_place;
if(this.recipient_name!=null) data['recipient_name'] = this.recipient_name;
if(this.recipient_phone!=null) data['recipient_phone'] = this.recipient_phone;
if(this.recipient_address1!=null) data['recipient_address1'] = this.recipient_address1;
if(this.recipient_address2!=null) data['recipient_address2'] = this.recipient_address2;
if(this.recipient_address3!=null) data['recipient_address3'] = this.recipient_address3;
if(this.image1!=null) data['image1'] = this.image1;
if(this.title!=null) data['title'] = this.title;
if(this.option!=null) data['option'] = this.option;
if(this.quantity!=null) data['quantity'] = this.quantity;
if(this.price!=null) data['price'] = this.price;
if(this.delivery_fee!=null) data['delivery_fee'] = this.delivery_fee;
if(this.total_fee!=null) data['total_fee'] = this.total_fee;
if(this.create_date!=null) data['create_date'] = this.create_date;
if(this.update_date!=null) data['update_date'] = this.update_date;
if(this.delete_date!=null) data['delete_date'] = this.delete_date;
return data;
}
int get id => _id;
int get orderer_id => _orderer_id;
String get orderer_name => _orderer_name;
String get orderer_phone => _orderer_phone;
String get orderer_address1 => _orderer_address1;
String get orderer_address2 => _orderer_address2;
String get orderer_address3 => _orderer_address3;
String get orderer_email => _orderer_email;
String get recipient_place => _recipient_place;
String get recipient_name => _recipient_name;
String get recipient_phone => _recipient_phone;
String get recipient_address1 => _recipient_address1;
String get recipient_address2 => _recipient_address2;
String get recipient_address3 => _recipient_address3;
String get image1 => _image1;
String get title => _title;
String get option => _option;
int get quantity => _quantity;
int get price => _price;
int get delivery_fee => _delivery_fee;
int get total_fee => _total_fee;
String get create_date => _create_date;
String get update_date => _update_date;
String get delete_date => _delete_date;
set id(int value) { 
_id = value;
}
set orderer_id(int value) { 
_orderer_id = value;
}
set orderer_name(String value) { 
_orderer_name = value;
}
set orderer_phone(String value) { 
_orderer_phone = value;
}
set orderer_address1(String value) { 
_orderer_address1 = value;
}
set orderer_address2(String value) { 
_orderer_address2 = value;
}
set orderer_address3(String value) { 
_orderer_address3 = value;
}
set orderer_email(String value) { 
_orderer_email = value;
}
set recipient_place(String value) { 
_recipient_place = value;
}
set recipient_name(String value) { 
_recipient_name = value;
}
set recipient_phone(String value) { 
_recipient_phone = value;
}
set recipient_address1(String value) { 
_recipient_address1 = value;
}
set recipient_address2(String value) { 
_recipient_address2 = value;
}
set recipient_address3(String value) { 
_recipient_address3 = value;
}
set image1(String value) { 
_image1 = value;
}
set title(String value) { 
_title = value;
}
set option(String value) { 
_option = value;
}
set quantity(int value) { 
_quantity = value;
}
set price(int value) { 
_price = value;
}
set delivery_fee(int value) { 
_delivery_fee = value;
}
set total_fee(int value) { 
_total_fee = value;
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

class OrderList {
  int _count;
  List<OrderModel> _orderList;
  OrderList({int count, List<OrderModel> orderList}) {
    this._count = count;
    this._orderList = orderList;
  }
  int get count => _count;
  List<OrderModel> get orderList => _orderList;
  OrderList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _orderList = [];
      json['rows'].forEach((v) {
        _orderList.add(new OrderModel.fromJson(v));
     });
    }
  }
  OrderList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _orderList = [];
      iter.forEach((v) {
        _orderList.add(new OrderModel.fromJson(Map<String, dynamic>.from(v)));
     });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._orderList != null) {
      data['orderList'] = this._orderList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
