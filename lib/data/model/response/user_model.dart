class UserModel {
  int _id;
  int _user_type;
  String _username;
  String _password;
  String _name;
  String _phone;
  String _email;
  int _gender;
  String _address1;
  String _address2;
  String _address3;
  int _season;
  int _detail_season_type;
  String _business_registration_number;
  String _business_registration_file;
  String _hashtag;
  String _resume;
  String _working_hour;
  int _withdrawal;
  int _withdrawal_request_flag;
  int _withdrawal_request_amount;
  String _bank1;
  String _bank2;
  String _bank3;
  String _create_date;
  String _update_date;
  String _delete_date;
  String _title_image;

  UserModel({
    int id,
    int user_type,
    String username,
    String password,
    String name,
    String phone,
    String email,
    int gender,
    String address1,
    String address2,
    String address3,
    int season,
    int detail_season_type,
    String business_registration_number,
    String business_registration_file,
    String hashtag,
    String resume,
    String working_hour,
    int withdrawal,
    int withdrawal_request_flag,
    int withdrawal_request_amount,
    String bank1,
    String bank2,
    String bank3,
    String create_date,
    String update_date,
    String delete_date,
    String title_image,
  }) {
    this._id = id;
    this._user_type = user_type;
    this._username = username;
    this._password = password;
    this._name = name;
    this._phone = phone;
    this._email = email;
    this._gender = gender;
    this._address1 = address1;
    this._address2 = address2;
    this._address3 = address3;
    this._season = season;
    this._detail_season_type = detail_season_type;
    this._business_registration_number = business_registration_number;
    this._business_registration_file = business_registration_file;
    this._hashtag = hashtag;
    this._resume = resume;
    this._working_hour = working_hour;
    this._withdrawal = withdrawal;
    this._withdrawal_request_flag = withdrawal_request_flag;
    this._withdrawal_request_amount = withdrawal_request_amount;
    this._bank1 = bank1;
    this._bank2 = bank2;
    this._bank3 = bank3;
    this._create_date = create_date;
    this._update_date = update_date;
    this._delete_date = delete_date;
    this._title_image = title_image;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _user_type = json['user_type'];
    _username = json['username'];
    _password = json['password'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _gender = json['gender'];
    _address1 = json['address1'];
    _address2 = json['address2'];
    _address3 = json['address3'];
    _season = json['season'];
    _detail_season_type = json['detail_season_type'];
    _business_registration_number = json['business_registration_number'];
    _business_registration_file = json['business_registration_file'];
    _hashtag = json['hashtag'];
    _resume = json['resume'];
    _working_hour = json['working_hour'];
    _withdrawal = json['withdrawal'];
    _withdrawal_request_flag = json['withdrawal_request_flag'];
    _withdrawal_request_amount = json['withdrawal_request_amount'];
    _bank1 = json['bank1'];
    _bank2 = json['bank2'];
    _bank3 = json['bank3'];
    _create_date = json['create_date'];
    _update_date = json['update_date'];
    _delete_date = json['delete_date'];
    _title_image = json['title_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_type'] = this.user_type;
    data['username'] = this.username;
    data['password'] = this.password;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['season'] = this.season;
    data['detail_season_type'] = this.detail_season_type;
    data['business_registration_number'] = this.business_registration_number;
    data['business_registration_file'] = this.business_registration_file;
    data['hashtag'] = this.hashtag;
    data['resume'] = this.resume;
    data['working_hour'] = this.working_hour;
    data['withdrawal'] = this.withdrawal;
    data['withdrawal_request_flag'] = this.withdrawal_request_flag;
    data['withdrawal_request_amount'] = this.withdrawal_request_amount;
    data['bank1'] = this.bank1;
    data['bank2'] = this.bank2;
    data['bank3'] = this.bank3;
    data['create_date'] = this.create_date;
    data['update_date'] = this.update_date;
    data['delete_date'] = this.delete_date;
    data['title_image'] = this.title_image;
    return data;
  }

  Map<String, dynamic> toJsonNotNull() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) data['id'] = this.id;
    if (this.user_type != null) data['user_type'] = this.user_type;
    if (this.username != null) data['username'] = this.username;
    if (this.password != null) data['password'] = this.password;
    if (this.name != null) data['name'] = this.name;
    if (this.phone != null) data['phone'] = this.phone;
    if (this.email != null) data['email'] = this.email;
    if (this.gender != null) data['gender'] = this.gender;
    if (this.address1 != null) data['address1'] = this.address1;
    if (this.address2 != null) data['address2'] = this.address2;
    if (this.address3 != null) data['address3'] = this.address3;
    if (this.season != null) data['season'] = this.season;
    if (this.detail_season_type != null)
      data['detail_season_type'] = this.detail_season_type;
    if (this.business_registration_number != null)
      data['business_registration_number'] = this.business_registration_number;
    if (this.business_registration_file != null)
      data['business_registration_file'] = this.business_registration_file;
    if (this.hashtag != null) data['hashtag'] = this.hashtag;
    if (this.resume != null) data['resume'] = this.resume;
    if (this.working_hour != null) data['working_hour'] = this.working_hour;
    if (this.withdrawal != null) data['withdrawal'] = this.withdrawal;
    if (this.withdrawal_request_flag != null)
      data['withdrawal_request_flag'] = this.withdrawal_request_flag;
    if (this.withdrawal_request_amount != null)
      data['withdrawal_request_amount'] = this.withdrawal_request_amount;
    if (this.bank1 != null) data['bank1'] = this.bank1;
    if (this.bank2 != null) data['bank2'] = this.bank2;
    if (this.bank3 != null) data['bank3'] = this.bank3;
    if (this.create_date != null) data['create_date'] = this.create_date;
    if (this.update_date != null) data['update_date'] = this.update_date;
    if (this.delete_date != null) data['delete_date'] = this.delete_date;
    if (this.title_image != null) data['title_image'] = this.title_image;
    return data;
  }

  int get id => _id;

  int get user_type => _user_type;

  String get username => _username;

  String get password => _password;

  String get name => _name;

  String get phone => _phone;

  String get email => _email;

  int get gender => _gender;

  String get address1 => _address1;

  String get address2 => _address2;

  String get address3 => _address3;

  int get season => _season;

  int get detail_season_type => _detail_season_type;

  String get business_registration_number => _business_registration_number;

  String get business_registration_file => _business_registration_file;

  String get hashtag => _hashtag;

  String get resume => _resume;

  String get working_hour => _working_hour;

  int get withdrawal => _withdrawal;

  int get withdrawal_request_flag => _withdrawal_request_flag;

  int get withdrawal_request_amount => _withdrawal_request_amount;

  String get bank1 => _bank1;

  String get bank2 => _bank2;

  String get bank3 => _bank3;

  String get create_date => _create_date;

  String get update_date => _update_date;

  String get delete_date => _delete_date;

  String get title_image => _title_image;

  set id(int value) {
    _id = value;
  }

  set user_type(int value) {
    _user_type = value;
  }

  set username(String value) {
    _username = value;
  }

  set password(String value) {
    _password = value;
  }

  set name(String value) {
    _name = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set email(String value) {
    _email = value;
  }

  set gender(int value) {
    _gender = value;
  }

  set address1(String value) {
    _address1 = value;
  }

  set address2(String value) {
    _address2 = value;
  }

  set address3(String value) {
    _address3 = value;
  }

  set season(int value) {
    _season = value;
  }

  set detail_season_type(int value) {
    _detail_season_type = value;
  }

  set business_registration_number(String value) {
    _business_registration_number = value;
  }

  set business_registration_file(String value) {
    _business_registration_file = value;
  }

  set hashtag(String value) {
    _hashtag = value;
  }

  set resume(String value) {
    _resume = value;
  }

  set working_hour(String value) {
    _working_hour = value;
  }

  set withdrawal(int value) {
    _withdrawal = value;
  }

  set withdrawal_request_flag(int value) {
    _withdrawal_request_flag = value;
  }

  set withdrawal_request_amount(int value) {
    _withdrawal_request_amount = value;
  }

  set bank1(String value) {
    _bank1 = value;
  }

  set bank2(String value) {
    _bank2 = value;
  }

  set bank3(String value) {
    _bank3 = value;
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

  set title_image(String value) {
    _title_image = value;
  }
}

class UserList {
  int _count;
  List<UserModel> _userList;

  UserList({int count, List<UserModel> userList}) {
    this._count = count;
    this._userList = userList;
  }

  int get count => _count;

  List<UserModel> get userList => _userList;

  UserList.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _userList = [];
      json['rows'].forEach((v) {
        _userList.add(new UserModel.fromJson(v));
      });
    }
  }

  UserList.fromList(List<dynamic> iter) {
    _count = iter.length;
    if (iter != null) {
      _userList = [];
      iter.forEach((v) {
        _userList.add(new UserModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._userList != null) {
      data['userList'] = this._userList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
