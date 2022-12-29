class ConsultingModel {
int _id;
int _consultant_id;
int _client_id;
String _client_name;
String _client_image;
String _client_phone;
String _payment_date;
String _reservation_date;
String _consulting_title;
int _payment_status;
int _consulting_status;
int _culture_type;
int _season;
int _detail_season_type;
String _consulting_content;
int _tone;
int _chroma;
int _contrast;
int _brightness;
int _gloss;
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
String client_phone,
String payment_date,
String reservation_date,
String consulting_title,
int payment_status,
int consulting_status,
int culture_type,
int season,
int detail_season_type,
String consulting_content,
int tone,
int chroma,
int contrast,
int brightness,
int gloss,
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
this._client_phone = client_phone;
this._payment_date = payment_date;
this._reservation_date = reservation_date;
this._consulting_title = consulting_title;
this._payment_status = payment_status;
this._consulting_status = consulting_status;
this._culture_type = culture_type;
this._season = season;
this._detail_season_type = detail_season_type;
this._consulting_content = consulting_content;
this._tone = tone;
this._chroma = chroma;
this._contrast = contrast;
this._brightness = brightness;
this._gloss = gloss;
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
_client_phone = json['client_phone'];
_payment_date = json['payment_date'];
_reservation_date = json['reservation_date'];
_consulting_title = json['consulting_title'];
_payment_status = json['payment_status'];
_consulting_status = json['consulting_status'];
_culture_type = json['culture_type'];
_season = json['season'];
_detail_season_type = json['detail_season_type'];
_consulting_content = json['consulting_content'];
_tone = json['tone'];
_chroma = json['chroma'];
_contrast = json['contrast'];
_brightness = json['brightness'];
_gloss = json['gloss'];
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
data['client_phone'] = this.client_phone;
data['payment_date'] = this.payment_date;
data['reservation_date'] = this.reservation_date;
data['consulting_title'] = this.consulting_title;
data['payment_status'] = this.payment_status;
data['consulting_status'] = this.consulting_status;
data['culture_type'] = this.culture_type;
data['season'] = this.season;
data['detail_season_type'] = this.detail_season_type;
data['consulting_content'] = this.consulting_content;
data['tone'] = this.tone;
data['chroma'] = this.chroma;
data['contrast'] = this.contrast;
data['brightness'] = this.brightness;
data['gloss'] = this.gloss;
data['payment_amount'] = this.payment_amount;
data['reservation_amount'] = this.reservation_amount;
data['commission'] = this.commission;
data['final_amount'] = this.final_amount;
data['create_date'] = this.create_date;
data['update_date'] = this.update_date;
data['delete_date'] = this.delete_date;
return data;
}
Map<String, dynamic> toJsonNotNull() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if(this.id!=null) data['id'] = this.id;
if(this.consultant_id!=null) data['consultant_id'] = this.consultant_id;
if(this.client_id!=null) data['client_id'] = this.client_id;
if(this.client_name!=null) data['client_name'] = this.client_name;
if(this.client_image!=null) data['client_image'] = this.client_image;
if(this.client_phone!=null) data['client_phone'] = this.client_phone;
if(this.payment_date!=null) data['payment_date'] = this.payment_date;
if(this.reservation_date!=null) data['reservation_date'] = this.reservation_date;
if(this.consulting_title!=null) data['consulting_title'] = this.consulting_title;
if(this.payment_status!=null) data['payment_status'] = this.payment_status;
if(this.consulting_status!=null) data['consulting_status'] = this.consulting_status;
if(this.culture_type!=null) data['culture_type'] = this.culture_type;
if(this.season!=null) data['season'] = this.season;
if(this.detail_season_type!=null) data['detail_season_type'] = this.detail_season_type;
if(this.consulting_content!=null) data['consulting_content'] = this.consulting_content;
if(this.tone!=null) data['tone'] = this.tone;
if(this.chroma!=null) data['chroma'] = this.chroma;
if(this.contrast!=null) data['contrast'] = this.contrast;
if(this.brightness!=null) data['brightness'] = this.brightness;
if(this.gloss!=null) data['gloss'] = this.gloss;
if(this.payment_amount!=null) data['payment_amount'] = this.payment_amount;
if(this.reservation_amount!=null) data['reservation_amount'] = this.reservation_amount;
if(this.commission!=null) data['commission'] = this.commission;
if(this.final_amount!=null) data['final_amount'] = this.final_amount;
if(this.create_date!=null) data['create_date'] = this.create_date;
if(this.update_date!=null) data['update_date'] = this.update_date;
if(this.delete_date!=null) data['delete_date'] = this.delete_date;
return data;
}
int get id => _id;
int get consultant_id => _consultant_id;
int get client_id => _client_id;
String get client_name => _client_name;
String get client_image => _client_image;
String get client_phone => _client_phone;
String get payment_date => _payment_date;
String get reservation_date => _reservation_date;
String get consulting_title => _consulting_title;
int get payment_status => _payment_status;
int get consulting_status => _consulting_status;
int get culture_type => _culture_type;
int get season => _season;
int get detail_season_type => _detail_season_type;
String get consulting_content => _consulting_content;
int get tone => _tone;
int get chroma => _chroma;
int get contrast => _contrast;
int get brightness => _brightness;
int get gloss => _gloss;
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
set client_phone(String value) { 
_client_phone = value;
}
set payment_date(String value) { 
_payment_date = value;
}
set reservation_date(String value) { 
_reservation_date = value;
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
set culture_type(int value) { 
_culture_type = value;
}
set season(int value) { 
_season = value;
}
set detail_season_type(int value) { 
_detail_season_type = value;
}
set consulting_content(String value) { 
_consulting_content = value;
}
set tone(int value) { 
_tone = value;
}
set chroma(int value) { 
_chroma = value;
}
set contrast(int value) { 
_contrast = value;
}
set brightness(int value) { 
_brightness = value;
}
set gloss(int value) { 
_gloss = value;
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
  ConsultingList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _consultingList = [];
      iter.forEach((v) {
        _consultingList.add(new ConsultingModel.fromJson(Map<String, dynamic>.from(v)));
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
