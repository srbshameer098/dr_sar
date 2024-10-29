class UpdateProfilePic {
  UpdateProfilePic({
    num? id,
    String? createdAt,
    String? updatedAt,
    String? username,
    String? email,
    String? phone,
    dynamic password,
    num? role,
    bool? blocked,
    bool? verified,
    String? refreshToken,
  }) {
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _username = username;
    _email = email;
    _phone = phone;
    _password = password;
    _role = role;
    _blocked = blocked;
    _verified = verified;
    _refreshToken = refreshToken;
  }

  UpdateProfilePic.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
    _role = json['role'];
    _blocked = json['blocked'];
    _verified = json['verified'];
    _refreshToken = json['refreshToken'];
  }

  num? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _username;
  String? _email;
  String? _phone;
  dynamic _password;
  num? _role;
  bool? _blocked;
  bool? _verified;
  String? _refreshToken;

  num? get id => _id;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get username => _username;

  String? get email => _email;

  String? get phone => _phone;

  dynamic get password => _password;

  num? get role => _role;

  bool? get blocked => _blocked;

  bool? get verified => _verified;

  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['username'] = _username;
    map['email'] = _email;
    map['phone'] = _phone;
    map['password'] = _password;
    map['role'] = _role;
    map['blocked'] = _blocked;
    map['verified'] = _verified;
    map['refreshToken'] = _refreshToken;
    return map;
  }
}
