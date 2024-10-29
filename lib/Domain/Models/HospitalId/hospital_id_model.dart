class HospitalById {
  HospitalById({
      num? id, 
      String? email, 
      Hospital? hospital,}){
    _id = id;
    _email = email;
    _hospital = hospital;
}

  HospitalById.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _hospital = json['hospital'] != null ? Hospital.fromJson(json['hospital']) : null;
  }
  num? _id;
  String? _email;
  Hospital? _hospital;

  num? get id => _id;
  String? get email => _email;
  Hospital? get hospital => _hospital;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    if (_hospital != null) {
      map['hospital'] = _hospital?.toJson();
    }
    return map;
  }

}

class Hospital {
  Hospital({
      num? id, 
      String? name, 
      String? description, 
      String? contactNum, 
      num? authId, 
      List<Images>? images, 
      Location? location, 
      List<Departments>? departments, 
      List<Facilities>? facilities, 
      List<Rooms>? rooms, 
      List<Doctors>? doctors,}){
    _id = id;
    _name = name;
    _description = description;
    _contactNum = contactNum;
    _authId = authId;
    _images = images;
    _location = location;
    _departments = departments;
    _facilities = facilities;
    _rooms = rooms;
    _doctors = doctors;
}

  Hospital.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _contactNum = json['contact_num'];
    _authId = json['authId'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    if (json['departments'] != null) {
      _departments = [];
      json['departments'].forEach((v) {
        _departments?.add(Departments.fromJson(v));
      });
    }
    if (json['facilities'] != null) {
      _facilities = [];
      json['facilities'].forEach((v) {
        _facilities?.add(Facilities.fromJson(v));
      });
    }
    if (json['rooms'] != null) {
      _rooms = [];
      json['rooms'].forEach((v) {
        _rooms?.add(Rooms.fromJson(v));
      });
    }
    if (json['doctors'] != null) {
      _doctors = [];
      json['doctors'].forEach((v) {
        _doctors?.add(Doctors.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _description;
  String? _contactNum;
  num? _authId;
  List<Images>? _images;
  Location? _location;
  List<Departments>? _departments;
  List<Facilities>? _facilities;
  List<Rooms>? _rooms;
  List<Doctors>? _doctors;

  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get contactNum => _contactNum;
  num? get authId => _authId;
  List<Images>? get images => _images;
  Location? get location => _location;
  List<Departments>? get departments => _departments;
  List<Facilities>? get facilities => _facilities;
  List<Rooms>? get rooms => _rooms;
  List<Doctors>? get doctors => _doctors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['contact_num'] = _contactNum;
    map['authId'] = _authId;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_departments != null) {
      map['departments'] = _departments?.map((v) => v.toJson()).toList();
    }
    if (_facilities != null) {
      map['facilities'] = _facilities?.map((v) => v.toJson()).toList();
    }
    if (_rooms != null) {
      map['rooms'] = _rooms?.map((v) => v.toJson()).toList();
    }
    if (_doctors != null) {
      map['doctors'] = _doctors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Doctors {
  Doctors({
      Doctor? doctor,}){
    _doctor = doctor;
}

  Doctors.fromJson(dynamic json) {
    _doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
  }
  Doctor? _doctor;

  Doctor? get doctor => _doctor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_doctor != null) {
      map['doctor'] = _doctor?.toJson();
    }
    return map;
  }

}

class Doctor {
  Doctor({
      num? id, 
      String? name, 
      String? specialization, 
      String? qualification, 
      String? fee, 
      bool? adminAdded, 
      bool? hospitalAdded, 
      num? authId, 
      List<DoctorAppointments>? doctorAppointments, 
      ProfilePic? profilePic,}){
    _id = id;
    _name = name;
    _specialization = specialization;
    _qualification = qualification;
    _fee = fee;
    _adminAdded = adminAdded;
    _hospitalAdded = hospitalAdded;
    _authId = authId;
    _doctorAppointments = doctorAppointments;
    _profilePic = profilePic;
}

  Doctor.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _specialization = json['specialization'];
    _qualification = json['qualification'];
    _fee = json['fee'];
    _adminAdded = json['adminAdded'];
    _hospitalAdded = json['HospitalAdded'];
    _authId = json['authId'];
    if (json['doctor_appointments'] != null) {
      _doctorAppointments = [];
      json['doctor_appointments'].forEach((v) {
        _doctorAppointments?.add(DoctorAppointments.fromJson(v));
      });
    }
    _profilePic = json['profile_pic'] != null ? ProfilePic.fromJson(json['profile_pic']) : null;
  }
  num? _id;
  String? _name;
  String? _specialization;
  String? _qualification;
  String? _fee;
  bool? _adminAdded;
  bool? _hospitalAdded;
  num? _authId;
  List<DoctorAppointments>? _doctorAppointments;
  ProfilePic? _profilePic;

  num? get id => _id;
  String? get name => _name;
  String? get specialization => _specialization;
  String? get qualification => _qualification;
  String? get fee => _fee;
  bool? get adminAdded => _adminAdded;
  bool? get hospitalAdded => _hospitalAdded;
  num? get authId => _authId;
  List<DoctorAppointments>? get doctorAppointments => _doctorAppointments;
  ProfilePic? get profilePic => _profilePic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['specialization'] = _specialization;
    map['qualification'] = _qualification;
    map['fee'] = _fee;
    map['adminAdded'] = _adminAdded;
    map['HospitalAdded'] = _hospitalAdded;
    map['authId'] = _authId;
    if (_doctorAppointments != null) {
      map['doctor_appointments'] = _doctorAppointments?.map((v) => v.toJson()).toList();
    }
    if (_profilePic != null) {
      map['profile_pic'] = _profilePic?.toJson();
    }
    return map;
  }

}

class ProfilePic {
  ProfilePic({
      num? id, 
      String? url,}){
    _id = id;
    _url = url;
}

  ProfilePic.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
  }
  num? _id;
  String? _url;

  num? get id => _id;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    return map;
  }

}

class DoctorAppointments {
  DoctorAppointments({
      num? id, 
      String? date, 
      List<TimeSlots>? timeSlots,}){
    _id = id;
    _date = date;
    _timeSlots = timeSlots;
}

  DoctorAppointments.fromJson(dynamic json) {
    _id = json['id'];
    _date = json['date'];
    if (json['timeSlots'] != null) {
      _timeSlots = [];
      json['timeSlots'].forEach((v) {
        _timeSlots?.add(TimeSlots.fromJson(v));
      });
    }
  }
  num? _id;
  String? _date;
  List<TimeSlots>? _timeSlots;

  num? get id => _id;
  String? get date => _date;
  List<TimeSlots>? get timeSlots => _timeSlots;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date'] = _date;
    if (_timeSlots != null) {
      map['timeSlots'] = _timeSlots?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class TimeSlots {
  TimeSlots({
      num? id, 
      String? from, 
      String? to, 
      String? averageConsultingTime, 
      List<Times>? times,}){
    _id = id;
    _from = from;
    _to = to;
    _averageConsultingTime = averageConsultingTime;
    _times = times;
}

  TimeSlots.fromJson(dynamic json) {
    _id = json['id'];
    _from = json['from'];
    _to = json['to'];
    _averageConsultingTime = json['average_consulting_time'];
    if (json['times'] != null) {
      _times = [];
      json['times'].forEach((v) {
        _times?.add(Times.fromJson(v));
      });
    }
  }
  num? _id;
  String? _from;
  String? _to;
  String? _averageConsultingTime;
  List<Times>? _times;

  num? get id => _id;
  String? get from => _from;
  String? get to => _to;
  String? get averageConsultingTime => _averageConsultingTime;
  List<Times>? get times => _times;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['from'] = _from;
    map['to'] = _to;
    map['average_consulting_time'] = _averageConsultingTime;
    if (_times != null) {
      map['times'] = _times?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Times {
  Times({
      num? id, 
      String? time, 
      String? status, 
      String? booking,}){
    _id = id;
    _time = time;
    _status = status;
    _booking = booking;
}

  Times.fromJson(dynamic json) {
    _id = json['id'];
    _time = json['time'];
    _status = json['status'];
    _booking = json['booking'];
  }
  num? _id;
  String? _time;
  String? _status;
  String? _booking;

  num? get id => _id;
  String? get time => _time;
  String? get status => _status;
  String? get booking => _booking;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['time'] = _time;
    map['status'] = _status;
    map['booking'] = _booking;
    return map;
  }

}

class Rooms {
  Rooms({
      Room? room,}){
    _room = room;
}

  Rooms.fromJson(dynamic json) {
    _room = json['room'] != null ? Room.fromJson(json['room']) : null;
  }
  Room? _room;

  Room? get room => _room;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_room != null) {
      map['room'] = _room?.toJson();
    }
    return map;
  }

}

class Room {
  Room({
      num? id, 
      String? roomNum, 
      String? rate, 
      List<Amenities>? amenities, 
      RoomType? roomType,}){
    _id = id;
    _roomNum = roomNum;
    _rate = rate;
    _amenities = amenities;
    _roomType = roomType;
}

  Room.fromJson(dynamic json) {
    _id = json['id'];
    _roomNum = json['room_num'];
    _rate = json['rate'];
    if (json['amenities'] != null) {
      _amenities = [];
      json['amenities'].forEach((v) {
        _amenities?.add(Amenities.fromJson(v));
      });
    }
    _roomType = json['room_type'] != null ? RoomType.fromJson(json['room_type']) : null;
  }
  num? _id;
  String? _roomNum;
  String? _rate;
  List<Amenities>? _amenities;
  RoomType? _roomType;

  num? get id => _id;
  String? get roomNum => _roomNum;
  String? get rate => _rate;
  List<Amenities>? get amenities => _amenities;
  RoomType? get roomType => _roomType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['room_num'] = _roomNum;
    map['rate'] = _rate;
    if (_amenities != null) {
      map['amenities'] = _amenities?.map((v) => v.toJson()).toList();
    }
    if (_roomType != null) {
      map['room_type'] = _roomType?.toJson();
    }
    return map;
  }

}

class RoomType {
  RoomType({
      num? id, 
      String? name, 
      bool? isActive,}){
    _id = id;
    _name = name;
    _isActive = isActive;
}

  RoomType.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isActive = json['is_active'];
  }
  num? _id;
  String? _name;
  bool? _isActive;

  num? get id => _id;
  String? get name => _name;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['is_active'] = _isActive;
    return map;
  }

}

class Amenities {
  Amenities({
      num? id, 
      Amenity? amenity,}){
    _id = id;
    _amenity = amenity;
}

  Amenities.fromJson(dynamic json) {
    _id = json['id'];
    _amenity = json['amenity'] != null ? Amenity.fromJson(json['amenity']) : null;
  }
  num? _id;
  Amenity? _amenity;

  num? get id => _id;
  Amenity? get amenity => _amenity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_amenity != null) {
      map['amenity'] = _amenity?.toJson();
    }
    return map;
  }

}

class Amenity {
  Amenity({
      num? id, 
      String? name, 
      bool? isActive,}){
    _id = id;
    _name = name;
    _isActive = isActive;
}

  Amenity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isActive = json['is_active'];
  }
  num? _id;
  String? _name;
  bool? _isActive;

  num? get id => _id;
  String? get name => _name;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['is_active'] = _isActive;
    return map;
  }

}

class Facilities {
  Facilities({
      Facility? facility,}){
    _facility = facility;
}

  Facilities.fromJson(dynamic json) {
    _facility = json['facility'] != null ? Facility.fromJson(json['facility']) : null;
  }
  Facility? _facility;

  Facility? get facility => _facility;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_facility != null) {
      map['facility'] = _facility?.toJson();
    }
    return map;
  }

}

class Facility {
  Facility({
      num? id, 
      String? name, 
      bool? isActive,}){
    _id = id;
    _name = name;
    _isActive = isActive;
}

  Facility.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isActive = json['is_active'];
  }
  num? _id;
  String? _name;
  bool? _isActive;

  num? get id => _id;
  String? get name => _name;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['is_active'] = _isActive;
    return map;
  }

}

class Departments {
  Departments({
      Department? department,}){
    _department = department;
}

  Departments.fromJson(dynamic json) {
    _department = json['department'] != null ? Department.fromJson(json['department']) : null;
  }
  Department? _department;

  Department? get department => _department;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_department != null) {
      map['department'] = _department?.toJson();
    }
    return map;
  }

}

class Department {
  Department({
      num? id, 
      String? name, 
      List<Image>? image, 
      bool? isActive,}){
    _id = id;
    _name = name;
    _image = image;
    _isActive = isActive;
}

  Department.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(Image.fromJson(v));
      });
    }
    _isActive = json['is_active'];
  }
  num? _id;
  String? _name;
  List<Image>? _image;
  bool? _isActive;

  num? get id => _id;
  String? get name => _name;
  List<Image>? get image => _image;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_image != null) {
      map['image'] = _image?.map((v) => v.toJson()).toList();
    }
    map['is_active'] = _isActive;
    return map;
  }

}

class Image {
  Image({
      num? id, 
      String? url,}){
    _id = id;
    _url = url;
}

  Image.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
  }
  num? _id;
  String? _url;

  num? get id => _id;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    return map;
  }

}

class Location {
  Location({
      num? id, 
      String? latitude, 
      String? longitude, 
      num? hospitalId,}){
    _id = id;
    _latitude = latitude;
    _longitude = longitude;
    _hospitalId = hospitalId;
}

  Location.fromJson(dynamic json) {
    _id = json['id'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _hospitalId = json['hospital_id'];
  }
  num? _id;
  String? _latitude;
  String? _longitude;
  num? _hospitalId;

  num? get id => _id;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  num? get hospitalId => _hospitalId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['hospital_id'] = _hospitalId;
    return map;
  }

}

class Images {
  Images({
      String? url,}){
    _url = url;
}

  Images.fromJson(dynamic json) {
    _url = json['url'];
  }
  String? _url;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }

}