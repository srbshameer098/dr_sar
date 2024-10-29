class AppoinmentsModel {
  AppoinmentsModel({
    int? id,
    String? reasonForAppointment,
    int? custId,
    TimeSlot? timeSlot,
    User? user,
  }) {
    _id = id;
    _reasonForAppointment = reasonForAppointment;
    _custId = custId;
    _timeSlot = timeSlot;
    _user = user;
  }

  AppoinmentsModel.fromJson(dynamic json) {
    _id = json['id'];
    _reasonForAppointment = json['reason_for_appointment'];
    _custId = json['custId'];
    _timeSlot =
        json['timeSlot'] != null ? TimeSlot.fromJson(json['timeSlot']) : null;
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  int? _id;
  String? _reasonForAppointment;
  int? _custId;
  TimeSlot? _timeSlot;
  User? _user;

  int? get id => _id;

  String? get reasonForAppointment => _reasonForAppointment;

  int? get custId => _custId;

  TimeSlot? get timeSlot => _timeSlot;

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['reason_for_appointment'] = _reasonForAppointment;
    map['custId'] = _custId;
    if (_timeSlot != null) {
      map['timeSlot'] = _timeSlot?.toJson();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? dob,
    dynamic city,
    String? gender,
    List<String>? additionalHealthIssues,
    int? authId,
  }) {
    _id = id;
    _name = name;
    _phone = phone;
    _email = email;
    _dob = dob;
    _city = city;
    _gender = gender;
    _additionalHealthIssues = additionalHealthIssues;
    _authId = authId;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
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

  int? _id;
  String? _name;
  String? _phone;
  String? _email;
  String? _dob;
  dynamic _city;
  String? _gender;
  List<String>? _additionalHealthIssues;
  int? _authId;

  int? get id => _id;

  String? get name => _name;

  String? get phone => _phone;

  String? get email => _email;

  String? get dob => _dob;

  dynamic get city => _city;

  String? get gender => _gender;

  List<String>? get additionalHealthIssues => _additionalHealthIssues;

  int? get authId => _authId;

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
    return map;
  }
}

class TimeSlot {
  TimeSlot({
    int? id,
    String? time,
    int? timeSlotPerDayId,
    int? bookingId,
    String? status,
  }) {
    _id = id;
    _time = time;
    _timeSlotPerDayId = timeSlotPerDayId;
    _bookingId = bookingId;
    _status = status;
  }

  TimeSlot.fromJson(dynamic json) {
    _id = json['id'];
    _time = json['time'];
    _timeSlotPerDayId = json['timeSlotPerDayId'];
    _bookingId = json['booking_id'];
    _status = json['status'];
  }

  int? _id;
  String? _time;
  int? _timeSlotPerDayId;
  int? _bookingId;
  String? _status;

  int? get id => _id;

  String? get time => _time;

  int? get timeSlotPerDayId => _timeSlotPerDayId;

  int? get bookingId => _bookingId;

  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['time'] = _time;
    map['timeSlotPerDayId'] = _timeSlotPerDayId;
    map['booking_id'] = _bookingId;
    map['status'] = _status;
    return map;
  }
}
