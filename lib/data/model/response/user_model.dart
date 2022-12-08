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
  String _business_registration_number;
  String _business_registration_file;
  String _hashtag;
  String _resume;
  String _working_hour;
  int _withdrawal;
  String _bank1;
  String _bank2;
  String _bank3;
  String _create_date;
  String _update_date;
  String _delete_date;

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
    String business_registration_number,
    String business_registration_file,
    String hashtag,
    String resume,
    String working_hour,
    int withdrawal,
    String bank1,
    String bank2,
    String bank3,
    String create_date,
    String update_date,
    String delete_date,
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
    this._business_registration_number = business_registration_number;
    this._business_registration_file = business_registration_file;
    this._hashtag = hashtag;
    this._resume = resume;
    this._working_hour = working_hour;
    this._withdrawal = withdrawal;
    this._bank1 = bank1;
    this._bank2 = bank2;
    this._bank3 = bank3;
    this._create_date = create_date;
    this._update_date = update_date;
    this._delete_date = delete_date;
  }

  String get delete_date => _delete_date;

  String get update_date => _update_date;

  String get create_date => _create_date;

  String get bank3 => _bank3;

  String get bank2 => _bank2;

  String get bank1 => _bank1;

  int get withdrawal => _withdrawal;

  String get working_hour => _working_hour;

  String get resume => _resume;

  String get hashtag => _hashtag;

  String get business_registration_file => _business_registration_file;

  String get business_registration_number => _business_registration_number;

  String get address3 => _address3;

  String get address2 => _address2;

  String get address1 => _address1;

  int get gender => _gender;

  String get email => _email;

  String get phone => _phone;

  String get name => _name;

  String get password => _password;

  String get username => _username;

  int get user_type => _user_type;

  int get id => _id;

  set delete_date(String value) {
    _delete_date = value;
  }

  set update_date(String value) {
    _update_date = value;
  }

  set create_date(String value) {
    _create_date = value;
  }

  set bank3(String value) {
    _bank3 = value;
  }

  set bank2(String value) {
    _bank2 = value;
  }

  set bank1(String value) {
    _bank1 = value;
  }

  set withdrawal(int value) {
    _withdrawal = value;
  }

  set working_hour(String value) {
    _working_hour = value;
  }

  set resume(String value) {
    _resume = value;
  }

  set hashtag(String value) {
    _hashtag = value;
  }

  set business_registration_file(String value) {
    _business_registration_file = value;
  }

  set business_registration_number(String value) {
    _business_registration_number = value;
  }

  set address3(String value) {
    _address3 = value;
  }

  set address2(String value) {
    _address2 = value;
  }

  set address1(String value) {
    _address1 = value;
  }

  set gender(int value) {
    _gender = value;
  }

  set email(String value) {
    _email = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set name(String value) {
    _name = value;
  }

  set password(String value) {
    _password = value;
  }

  set username(String value) {
    _username = value;
  }

  set user_type(int value) {
    _user_type = value;
  }

  set id(int value) {
    _id = value;
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
    _business_registration_number = json['business_registration_number'];
    _business_registration_file = json['business_registration_file'];
    _hashtag = json['hashtag'];
    _resume = json['resume'];
    _working_hour = json['working_hour'];
    _withdrawal = json['withdrawal'];
    _bank1 = json['bank1'];
    _bank2 = json['bank2'];
    _bank3 = json['bank3'];
    _create_date = json['create_date'];
    _update_date = json['update_date'];
    _delete_date = json['delete_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_type'] = this._user_type;
    data['username'] = this._username;
    data['password'] = this._password;
    data['name'] = this._name;
    data['phone'] = this._phone;
    data['email'] = this._email;
    data['gender'] = this._gender;
    data['address1'] = this._address1;
    data['address2'] = this._address2;
    data['address3'] = this._address3;
    data['business_registration_number'] = this._business_registration_number;
    data['business_registration_file'] = this._business_registration_file;
    data['hashtag'] = this._hashtag;
    data['resume'] = this._resume;
    data['working_hour'] = this._working_hour;
    data['withdrawal'] = this._withdrawal;
    data['bank1'] = this._bank1;
    data['bank2'] = this._bank2;
    data['bank3'] = this._bank3;
    data['create_date'] = this._create_date;
    data['update_date'] = this._update_date;
    data['delete_date'] = this._delete_date;
    return data;
  }
}
