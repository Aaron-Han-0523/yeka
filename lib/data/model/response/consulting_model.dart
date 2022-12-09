class ConsultingModel {
int _id;
int _consultant_id;
int _client_id;
String _client_name;
String _client_image;
String _payment_date;
String _consulting_title;
int _payment_status;
int _consulting_status;
int _payment_amount;
int _reservation_amount;
int _commission;
int _final_amount;
String _create_date;
String _update_date;
String _delete_date;
ConsultingModel({
int id,
int consultant_id,
int client_id,
String client_name,
String client_image,
String payment_date,
String consulting_title,
int payment_status,
int consulting_status,
int payment_amount,
int reservation_amount,
int commission,
int final_amount,
String create_date,
String update_date,
String delete_date,
}) {
this._id = id;
this._consultant_id = consultant_id;
this._client_id = client_id;
this._client_name = client_name;
this._client_image = client_image;
this._payment_date = payment_date;
this._consulting_title = consulting_title;
this._payment_status = payment_status;
this._consulting_status = consulting_status;
this._payment_amount = payment_amount;
this._reservation_amount = reservation_amount;
this._commission = commission;
this._final_amount = final_amount;
this._create_date = create_date;
this._update_date = update_date;
this._delete_date = delete_date;
}
ConsultingModel.fromJson(Map<String, dynamic> json) {
_id = json['id'];
_consultant_id = json['consultant_id'];
_client_id = json['client_id'];
_client_name = json['client_name'];
_client_image = json['client_image'];
_payment_date = json['payment_date'];
_consulting_title = json['consulting_title'];
_payment_status = json['payment_status'];
_consulting_status = json['consulting_status'];
_payment_amount = json['payment_amount'];
_reservation_amount = json['reservation_amount'];
_commission = json['commission'];
_final_amount = json['final_amount'];
_create_date = json['create_date'];
_update_date = json['update_date'];
_delete_date = json['delete_date'];
}
Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['consultant_id'] = this.consultant_id;
data['client_id'] = this.client_id;
data['client_name'] = this.client_name;
data['client_image'] = this.client_image;
data['payment_date'] = this.payment_date;
data['consulting_title'] = this.consulting_title;
data['payment_status'] = this.payment_status;
data['consulting_status'] = this.consulting_status;
data['payment_amount'] = this.payment_amount;
data['reservation_amount'] = this.reservation_amount;
data['commission'] = this.commission;
data['final_amount'] = this.final_amount;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
return data;
}
int get id => _id;
int get consultant_id => _consultant_id;
int get client_id => _client_id;
String get client_name => _client_name;
String get client_image => _client_image;
String get payment_date => _payment_date;
String get consulting_title => _consulting_title;
int get payment_status => _payment_status;
int get consulting_status => _consulting_status;
int get payment_amount => _payment_amount;
int get reservation_amount => _reservation_amount;
int get commission => _commission;
int get final_amount => _final_amount;
String get create_date => _create_date;
String get update_date => _update_date;
String get delete_date => _delete_date;
set id(int value) { 
_id = value;
}
set consultant_id(int value) { 
_consultant_id = value;
}
set client_id(int value) { 
_client_id = value;
}
set client_name(String value) { 
_client_name = value;
}
set client_image(String value) { 
_client_image = value;
}
set payment_date(String value) { 
_payment_date = value;
}
set consulting_title(String value) { 
_consulting_title = value;
}
set payment_status(int value) { 
_payment_status = value;
}
set consulting_status(int value) { 
_consulting_status = value;
}
set payment_amount(int value) { 
_payment_amount = value;
}
set reservation_amount(int value) { 
_reservation_amount = value;
}
set commission(int value) { 
_commission = value;
}
set final_amount(int value) { 
_final_amount = value;
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

class ConsultingList {
  int _count;
  List<ConsultingModel> _consultingList;
  ConsultingList({int count, List<ConsultingModel> consultingList}) {
    this._count = count;
    this._consultingList = consultingList;
  }
  int get count => _count;
  List<ConsultingModel> get consultingList => _consultingList;
  ConsultingList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _consultingList = [];
      json['rows'].forEach((v) {
        _consultingList.add(new ConsultingModel.fromJson(v));
     });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._consultingList != null) {
      data['consultingList'] = this._consultingList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
