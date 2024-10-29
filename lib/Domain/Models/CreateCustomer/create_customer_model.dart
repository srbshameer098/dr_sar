
class CreateCustomerModel {
  CreateCustomerModel({
      Data? data,}){
    _data = data;
}

  CreateCustomerModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}


class Data {
  Data({
      int? id, 
      Attributes? attributes,}){
    _id = id;
    _attributes = attributes;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }
  int? _id;
  Attributes? _attributes;

  int? get id => _id;
  Attributes? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    return map;
  }

}


class Attributes {
  Attributes({
      String? name, 
      String? phone, 
      String? email, 
      String? dob, 
      String? gender, 
      List<String>? additionalHealthIssues, 
      String? city,}){
    _name = name;
    _phone = phone;
    _email = email;
    _dob = dob;
    _gender = gender;
    _additionalHealthIssues = additionalHealthIssues;
    _city = city;
}

  Attributes.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _dob = json['dob'];
    _gender = json['gender'];
    _additionalHealthIssues = json['additional_health_issues'] != null ? json['additional_health_issues'].cast<String>() : [];
    _city = json['city'];
  }
  String? _name;
  String? _phone;
  String? _email;
  String? _dob;
  String? _gender;
  List<String>? _additionalHealthIssues;
  String? _city;

  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  String? get dob => _dob;
  String? get gender => _gender;
  List<String>? get additionalHealthIssues => _additionalHealthIssues;
  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['dob'] = _dob;
    map['gender'] = _gender;
    map['additional_health_issues'] = _additionalHealthIssues;
    map['city'] = _city;
    return map;
  }

}