class CustomerEditModel {
  CustomerEditModel({
    num? id,
    String? username,
    String? email,
    String? phone,
    num? role,
    bool? blocked,
    bool? verified,
    String? refreshToken,
    Customer? customer,
  }) {
    _id = id;
    _username = username;
    _email = email;
    _phone = phone;
    _role = role;
    _blocked = blocked;
    _verified = verified;
    _refreshToken = refreshToken;
    _customer = customer;
  }

  CustomerEditModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _role = json['role'];
    _blocked = json['blocked'];
    _verified = json['verified'];
    _refreshToken = json['refreshToken'];
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  num? _id;
  String? _username;
  String? _email;
  String? _phone;
  num? _role;
  bool? _blocked;
  bool? _verified;
  String? _refreshToken;
  Customer? _customer;

  num? get id => _id;

  String? get username => _username;

  String? get email => _email;

  String? get phone => _phone;

  num? get role => _role;

  bool? get blocked => _blocked;

  bool? get verified => _verified;

  String? get refreshToken => _refreshToken;

  Customer? get customer => _customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['phone'] = _phone;
    map['role'] = _role;
    map['blocked'] = _blocked;
    map['verified'] = _verified;
    map['refreshToken'] = _refreshToken;
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    return map;
  }
}

class Customer {
  Customer({
    num? id,
    String? createdAt,
    String? updatedAt,
    String? name,
    String? phone,
    String? email,
    String? dob,
    String? city,
    String? gender,
    List<String>? additionalHealthIssues,
    num? authId,
  }) {
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _name = name;
    _phone = phone;
    _email = email;
    _dob = dob;
    _city = city;
    _gender = gender;
    _additionalHealthIssues = additionalHealthIssues;
    _authId = authId;
  }

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _dob = json['dob'];
    _city = json['city'];
    _gender = json['gender'];
    _additionalHealthIssues = json['additional_health_issues'] != null
        ? json['additional_health_issues'].cast<String>()
        : [];
    _authId = json['authId'];
  }

  num? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _name;
  String? _phone;
  String? _email;
  String? _dob;
  String? _city;
  String? _gender;
  List<String>? _additionalHealthIssues;
  num? _authId;

  num? get id => _id;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get name => _name;

  String? get phone => _phone;

  String? get email => _email;

  String? get dob => _dob;

  String? get city => _city;

  String? get gender => _gender;

  List<String>? get additionalHealthIssues => _additionalHealthIssues;

  num? get authId => _authId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['dob'] = _dob;
    map['city'] = _city;
    map['gender'] = _gender;
    map['additional_health_issues'] = _additionalHealthIssues;
    map['authId'] = _authId;
    return map;
  }
}
