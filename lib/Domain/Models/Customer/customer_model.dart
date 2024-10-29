/// id : 1
/// username : "Monkey D Luffy"
/// email : "uta@gmail.com"
/// phone : "9072283042"
/// password : null
/// role : 4
/// blocked : false
/// verified : true
/// refreshToken : "$argon2i$v=19$m=4096,t=3,p=1$hbbPsX8WQbfHHBG9RXfodw$mf2OHm5Gz++jRH4hJwv07ZY119bKQ2JE4YJ9AxjA5zE"
/// customer : {"id":1,"name":"Monkey D Luffy","phone":"9072283042","email":"uta@gmail.com","dob":"2011-10-05","city":"Kolappuram","gender":"MALE","additional_health_issues":["Diabestes","Cardiac"],"authId":1,"Booking_data":[{"id":1,"user":{"id":1,"name":"Monkey D Luffy","phone":"9072283042"},"timeSlot":null},{"id":3,"user":{"id":1,"name":"Monkey D Luffy","phone":"9072283042"},"timeSlot":null}],"prescription":[{"id":1,"doctor":{"id":1,"name":"Mirsa "},"doctor_comment":"You are all right","prescriptionImg":[{"id":11,"url":"th (1).jpg1658902687260-474080259.jpg"}]}],"profile_pic":[{"id":10,"url":"th.jpg1658902138898-614398466.jpg"}]}

class CustomerModel {
  CustomerModel({
      int? id, 
      String? username, 
      String? email, 
      String? phone, 
      dynamic password, 
      int? role, 
      bool? blocked, 
      bool? verified, 
      String? refreshToken, 
      Customer? customer,}){
    _id = id;
    _username = username;
    _email = email;
    _phone = phone;
    _password = password;
    _role = role;
    _blocked = blocked;
    _verified = verified;
    _refreshToken = refreshToken;
    _customer = customer;
}

  CustomerModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
    _role = json['role'];
    _blocked = json['blocked'];
    _verified = json['verified'];
    _refreshToken = json['refreshToken'];
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }
  int? _id;
  String? _username;
  String? _email;
  String? _phone;
  dynamic _password;
  int? _role;
  bool? _blocked;
  bool? _verified;
  String? _refreshToken;
  Customer? _customer;

  int? get id => _id;
  String? get username => _username;
  String? get email => _email;
  String? get phone => _phone;
  dynamic get password => _password;
  int? get role => _role;
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
    map['password'] = _password;
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

/// id : 1
/// name : "Monkey D Luffy"
/// phone : "9072283042"
/// email : "uta@gmail.com"
/// dob : "2011-10-05"
/// city : "Kolappuram"
/// gender : "MALE"
/// additional_health_issues : ["Diabestes","Cardiac"]
/// authId : 1
/// Booking_data : [{"id":1,"user":{"id":1,"name":"Monkey D Luffy","phone":"9072283042"},"timeSlot":null},{"id":3,"user":{"id":1,"name":"Monkey D Luffy","phone":"9072283042"},"timeSlot":null}]
/// prescription : [{"id":1,"doctor":{"id":1,"name":"Mirsa "},"doctor_comment":"You are all right","prescriptionImg":[{"id":11,"url":"th (1).jpg1658902687260-474080259.jpg"}]}]
/// profile_pic : [{"id":10,"url":"th.jpg1658902138898-614398466.jpg"}]

class Customer {
  Customer({
      int? id, 
      String? name, 
      String? phone, 
      String? email, 
      String? dob, 
      String? city, 
      String? gender, 
      List<String>? additionalHealthIssues, 
      int? authId, 
      List<BookingData>? bookingData, 
      List<Prescription>? prescription, 
      List<ProfilePic>? profilePic,}){
    _id = id;
    _name = name;
    _phone = phone;
    _email = email;
    _dob = dob;
    _city = city;
    _gender = gender;
    _additionalHealthIssues = additionalHealthIssues;
    _authId = authId;
    _bookingData = bookingData;
    _prescription = prescription;
    _profilePic = profilePic;
}

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _dob = json['dob'];
    _city = json['city'];
    _gender = json['gender'];
    _additionalHealthIssues = json['additional_health_issues'] != null ? json['additional_health_issues'].cast<String>() : [];
    _authId = json['authId'];
    if (json['Booking_data'] != null) {
      _bookingData = [];
      json['Booking_data'].forEach((v) {
        _bookingData?.add(BookingData.fromJson(v));
      });
    }
    if (json['prescription'] != null) {
      _prescription = [];
      json['prescription'].forEach((v) {
        _prescription?.add(Prescription.fromJson(v));
      });
    }
    if (json['profile_pic'] != null) {
      _profilePic = [];
      json['profile_pic'].forEach((v) {
        _profilePic?.add(ProfilePic.fromJson(v));
      });
    }
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _email;
  String? _dob;
  String? _city;
  String? _gender;
  List<String>? _additionalHealthIssues;
  int? _authId;
  List<BookingData>? _bookingData;
  List<Prescription>? _prescription;
  List<ProfilePic>? _profilePic;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  String? get dob => _dob;
  String? get city => _city;
  String? get gender => _gender;
  List<String>? get additionalHealthIssues => _additionalHealthIssues;
  int? get authId => _authId;
  List<BookingData>? get bookingData => _bookingData;
  List<Prescription>? get prescription => _prescription;
  List<ProfilePic>? get profilePic => _profilePic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['dob'] = _dob;
    map['city'] = _city;
    map['gender'] = _gender;
    map['additional_health_issues'] = _additionalHealthIssues;
    map['authId'] = _authId;
    if (_bookingData != null) {
      map['Booking_data'] = _bookingData?.map((v) => v.toJson()).toList();
    }
    if (_prescription != null) {
      map['prescription'] = _prescription?.map((v) => v.toJson()).toList();
    }
    if (_profilePic != null) {
      map['profile_pic'] = _profilePic?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 10
/// url : "th.jpg1658902138898-614398466.jpg"

class ProfilePic {
  ProfilePic({
      int? id, 
      String? url,}){
    _id = id;
    _url = url;
}

  ProfilePic.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
  }
  int? _id;
  String? _url;

  int? get id => _id;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    return map;
  }

}

/// id : 1
/// doctor : {"id":1,"name":"Mirsa "}
/// doctor_comment : "You are all right"
/// prescriptionImg : [{"id":11,"url":"th (1).jpg1658902687260-474080259.jpg"}]

class Prescription {
  Prescription({
      int? id, 
      Doctor? doctor, 
      String? doctorComment, 
      List<PrescriptionImg>? prescriptionImg,}){
    _id = id;
    _doctor = doctor;
    _doctorComment = doctorComment;
    _prescriptionImg = prescriptionImg;
}

  Prescription.fromJson(dynamic json) {
    _id = json['id'];
    _doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    _doctorComment = json['doctor_comment'];
    if (json['prescriptionImg'] != null) {
      _prescriptionImg = [];
      json['prescriptionImg'].forEach((v) {
        _prescriptionImg?.add(PrescriptionImg.fromJson(v));
      });
    }
  }
  int? _id;
  Doctor? _doctor;
  String? _doctorComment;
  List<PrescriptionImg>? _prescriptionImg;

  int? get id => _id;
  Doctor? get doctor => _doctor;
  String? get doctorComment => _doctorComment;
  List<PrescriptionImg>? get prescriptionImg => _prescriptionImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_doctor != null) {
      map['doctor'] = _doctor?.toJson();
    }
    map['doctor_comment'] = _doctorComment;
    if (_prescriptionImg != null) {
      map['prescriptionImg'] = _prescriptionImg?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 11
/// url : "th (1).jpg1658902687260-474080259.jpg"

class PrescriptionImg {
  PrescriptionImg({
      int? id, 
      String? url,}){
    _id = id;
    _url = url;
}

  PrescriptionImg.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
  }
  int? _id;
  String? _url;

  int? get id => _id;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    return map;
  }

}

/// id : 1
/// name : "Mirsa "

class Doctor {
  Doctor({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Doctor.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// id : 1
/// user : {"id":1,"name":"Monkey D Luffy","phone":"9072283042"}
/// timeSlot : null

class BookingData {
  BookingData({
      int? id, 
      User? user, 
      dynamic timeSlot,}){
    _id = id;
    _user = user;
    _timeSlot = timeSlot;
}

  BookingData.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _timeSlot = json['timeSlot'];
  }
  int? _id;
  User? _user;
  dynamic _timeSlot;

  int? get id => _id;
  User? get user => _user;
  dynamic get timeSlot => _timeSlot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['timeSlot'] = _timeSlot;
    return map;
  }

}

/// id : 1
/// name : "Monkey D Luffy"
/// phone : "9072283042"

class User {
  User({
      int? id, 
      String? name, 
      String? phone,}){
    _id = id;
    _name = name;
    _phone = phone;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
  }
  int? _id;
  String? _name;
  String? _phone;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    return map;
  }

}