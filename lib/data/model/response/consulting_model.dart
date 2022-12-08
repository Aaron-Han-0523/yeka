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
    data['id'] = this._id;
    data['consultant_id'] = this._consultant_id;
    data['client_id'] = this._client_id;
    data['client_name'] = this._client_name;
    data['client_image'] = this._client_image;
    data['payment_date'] = this._payment_date;
    data['consulting_title'] = this._consulting_title;
    data['payment_status'] = this._payment_status;
    data['consulting_status'] = this._consulting_status;
    data['payment_amount'] = this._payment_amount;
    data['reservation_amount'] = this._reservation_amount;
    data['commission'] = this._commission;
    data['final_amount'] = this._final_amount;
    data['create_date'] = this._create_date;
    data['update_date'] = this._update_date;
    data['delete_date'] = this._delete_date;
    return data;
  }

  String get delete_date => _delete_date;

  set delete_date(String value) {
    _delete_date = value;
  }

  String get update_date => _update_date;

  set update_date(String value) {
    _update_date = value;
  }

  String get create_date => _create_date;

  set create_date(String value) {
    _create_date = value;
  }

  int get final_amount => _final_amount;

  set final_amount(int value) {
    _final_amount = value;
  }

  int get commission => _commission;

  set commission(int value) {
    _commission = value;
  }

  int get reservation_amount => _reservation_amount;

  set reservation_amount(int value) {
    _reservation_amount = value;
  }

  int get payment_amount => _payment_amount;

  set payment_amount(int value) {
    _payment_amount = value;
  }

  int get consulting_status => _consulting_status;

  set consulting_status(int value) {
    _consulting_status = value;
  }

  int get payment_status => _payment_status;

  set payment_status(int value) {
    _payment_status = value;
  }

  String get consulting_title => _consulting_title;

  set consulting_title(String value) {
    _consulting_title = value;
  }

  String get payment_date => _payment_date;

  set payment_date(String value) {
    _payment_date = value;
  }

  String get client_image => _client_image;

  set client_image(String value) {
    _client_image = value;
  }

  String get client_name => _client_name;

  set client_name(String value) {
    _client_name = value;
  }

  int get client_id => _client_id;

  set client_id(int value) {
    _client_id = value;
  }

  int get consultant_id => _consultant_id;

  set consultant_id(int value) {
    _consultant_id = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
