/// user : {"username":"mirza","phone":"8129667455","email":"mirza@gmail.com","role":4}

class UserRegisterModel {
  UserRegisterModel({
      User? user,}){
    _user = user;
}

  UserRegisterModel.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// username : "mirza"
/// phone : "8129667455"
/// email : "mirza@gmail.com"
/// role : 4

class User {
  User({
      String? username, 
      String? phone, 
      String? email, 
      int? role,}){
    _username = username;
    _phone = phone;
    _email = email;
    _role = role;
}

  User.fromJson(dynamic json) {
    _username = json['username'];
    _phone = json['phone'];
    _email = json['email'];
    _role = json['role'];
  }
  String? _username;
  String? _phone;
  String? _email;
  int? _role;

  String? get username => _username;
  String? get phone => _phone;
  String? get email => _email;
  int? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['phone'] = _phone;
    map['email'] = _email;
    map['role'] = _role;
    return map;
  }

}