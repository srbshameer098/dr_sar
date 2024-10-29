class HospitalsModel {
  HospitalsModel({
    num? id,
    String? name,
    String? description,
    String? contactNum,
    num? authId,
    List<Images>? images,
    List<Departments>? departments,
    List<Doctors>? doctors,
    List<Facilities>? facilities,
    Location? location,
    List<Rooms>? rooms,
    Count? count,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _contactNum = contactNum;
    _authId = authId;
    _images = images;
    _departments = departments;
    _doctors = doctors;
    _facilities = facilities;
    _location = location;
    _rooms = rooms;
    _count = count;
  }

  static List<HospitalsModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => HospitalsModel.fromJson(value)).toList();
  }

  HospitalsModel.fromJson(dynamic json) {
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
    if (json['departments'] != null) {
      _departments = [];
      json['departments'].forEach((v) {
        _departments?.add(Departments.fromJson(v));
      });
    }
    if (json['doctors'] != null) {
      _doctors = [];
      json['doctors'].forEach((v) {
        _doctors?.add(Doctors.fromJson(v));
      });
    }
    if (json['facilities'] != null) {
      _facilities = [];
      json['facilities'].forEach((v) {
        _facilities?.add(Facilities.fromJson(v));
      });
    }
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    if (json['rooms'] != null) {
      _rooms = [];
      json['rooms'].forEach((v) {
        _rooms?.add(Rooms.fromJson(v));
      });
    }
    _count = json['_count'] != null ? Count.fromJson(json['_count']) : null;
  }

  num? _id;
  String? _name;
  String? _description;
  String? _contactNum;
  num? _authId;
  List<Images>? _images;
  List<Departments>? _departments;
  List<Doctors>? _doctors;
  List<Facilities>? _facilities;
  Location? _location;
  List<Rooms>? _rooms;
  Count? _count;

  num? get id => _id;

  String? get name => _name;

  String? get description => _description;

  String? get contactNum => _contactNum;

  num? get authId => _authId;

  List<Images>? get images => _images;

  List<Departments>? get departments => _departments;

  List<Doctors>? get doctors => _doctors;

  List<Facilities>? get facilities => _facilities;

  Location? get location => _location;

  List<Rooms>? get rooms => _rooms;

  Count? get count => _count;

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
    if (_departments != null) {
      map['departments'] = _departments?.map((v) => v.toJson()).toList();
    }
    if (_doctors != null) {
      map['doctors'] = _doctors?.map((v) => v.toJson()).toList();
    }
    if (_facilities != null) {
      map['facilities'] = _facilities?.map((v) => v.toJson()).toList();
    }
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_rooms != null) {
      map['rooms'] = _rooms?.map((v) => v.toJson()).toList();
    }
    if (_count != null) {
      map['_count'] = _count?.toJson();
    }
    return map;
  }
}

class Count {
  Count({
    num? images,
    num? departments,
    num? facilities,
    num? rooms,
    num? doctors,
  }) {
    _images = images;
    _departments = departments;
    _facilities = facilities;
    _rooms = rooms;
    _doctors = doctors;
  }

  Count.fromJson(dynamic json) {
    _images = json['images'];
    _departments = json['departments'];
    _facilities = json['facilities'];
    _rooms = json['rooms'];
    _doctors = json['doctors'];
  }

  num? _images;
  num? _departments;
  num? _facilities;
  num? _rooms;
  num? _doctors;

  num? get images => _images;

  num? get departments => _departments;

  num? get facilities => _facilities;

  num? get rooms => _rooms;

  num? get doctors => _doctors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = _images;
    map['departments'] = _departments;
    map['facilities'] = _facilities;
    map['rooms'] = _rooms;
    map['doctors'] = _doctors;
    return map;
  }
}

class Rooms {
  Rooms({
    Room? room,
  }) {
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
    bool? isActive,
    num? roomTypeId,
    List<Amenities>? amenities,
    RoomType? roomType,
  }) {
    _id = id;
    _roomNum = roomNum;
    _rate = rate;
    _isActive = isActive;
    _roomTypeId = roomTypeId;
    _amenities = amenities;
    _roomType = roomType;
  }

  Room.fromJson(dynamic json) {
    _id = json['id'];
    _roomNum = json['room_num'];
    _rate = json['rate'];
    _isActive = json['is_active'];
    _roomTypeId = json['room_type_id'];
    if (json['amenities'] != null) {
      _amenities = [];
      json['amenities'].forEach((v) {
        _amenities?.add(Amenities.fromJson(v));
      });
    }
    _roomType =
        json['room_type'] != null ? RoomType.fromJson(json['room_type']) : null;
  }

  num? _id;
  String? _roomNum;
  String? _rate;
  bool? _isActive;
  num? _roomTypeId;
  List<Amenities>? _amenities;
  RoomType? _roomType;

  num? get id => _id;

  String? get roomNum => _roomNum;

  String? get rate => _rate;

  bool? get isActive => _isActive;

  num? get roomTypeId => _roomTypeId;

  List<Amenities>? get amenities => _amenities;

  RoomType? get roomType => _roomType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['room_num'] = _roomNum;
    map['rate'] = _rate;
    map['is_active'] = _isActive;
    map['room_type_id'] = _roomTypeId;
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
    bool? isActive,
  }) {
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
    Amenity? amenity,
  }) {
    _amenity = amenity;
  }

  Amenities.fromJson(dynamic json) {
    _amenity =
        json['amenity'] != null ? Amenity.fromJson(json['amenity']) : null;
  }

  Amenity? _amenity;

  Amenity? get amenity => _amenity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    bool? isActive,
  }) {
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

class Location {
  Location({
    num? id,
    String? latitude,
    String? longitude,
    num? hospitalId,
  }) {
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

class Facilities {
  Facilities({
    Facility? facility,
  }) {
    _facility = facility;
  }

  Facilities.fromJson(dynamic json) {
    _facility =
        json['facility'] != null ? Facility.fromJson(json['facility']) : null;
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
    bool? isActive,
  }) {
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

/// doctor : {"id":1,"name":"testings","specialization":"CARDIAC","qualification":"MBBS","fee":"300","adminAdded":false,"HospitalAdded":false,"authId":1,"profile_pic":{"id":2,"url":"photo-1518020382113-a7e8fc38eac9.jpg1662107753030-629571125.jpg"}}

class Doctors {
  Doctors({
    Doctor? doctor,
  }) {
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

/// id : 1
/// name : "testings"
/// specialization : "CARDIAC"
/// qualification : "MBBS"
/// fee : "300"
/// adminAdded : false
/// HospitalAdded : false
/// authId : 1
/// profile_pic : {"id":2,"url":"photo-1518020382113-a7e8fc38eac9.jpg1662107753030-629571125.jpg"}

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
    ProfilePic? profilePic,
  }) {
    _id = id;
    _name = name;
    _specialization = specialization;
    _qualification = qualification;
    _fee = fee;
    _adminAdded = adminAdded;
    _hospitalAdded = hospitalAdded;
    _authId = authId;
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
    _profilePic = json['profile_pic'] != null
        ? ProfilePic.fromJson(json['profile_pic'])
        : null;
  }

  num? _id;
  String? _name;
  String? _specialization;
  String? _qualification;
  String? _fee;
  bool? _adminAdded;
  bool? _hospitalAdded;
  num? _authId;
  ProfilePic? _profilePic;

  num? get id => _id;

  String? get name => _name;

  String? get specialization => _specialization;

  String? get qualification => _qualification;

  String? get fee => _fee;

  bool? get adminAdded => _adminAdded;

  bool? get hospitalAdded => _hospitalAdded;

  num? get authId => _authId;

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
    if (_profilePic != null) {
      map['profile_pic'] = _profilePic?.toJson();
    }
    return map;
  }
}

/// id : 2
/// url : "photo-1518020382113-a7e8fc38eac9.jpg1662107753030-629571125.jpg"

class ProfilePic {
  ProfilePic({
    num? id,
    String? url,
  }) {
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

/// department : {"id":1,"name":"Cardiology","is_active":true,"image":[{"id":8,"url":"th (2).jpg1662107835782-737114864.jpg"}]}

class Departments {
  Departments({
    Department? department,
  }) {
    _department = department;
  }

  Departments.fromJson(dynamic json) {
    _department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
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

/// id : 1
/// name : "Cardiology"
/// is_active : true
/// image : [{"id":8,"url":"th (2).jpg1662107835782-737114864.jpg"}]

class Department {
  Department({
    num? id,
    String? name,
    bool? isActive,
    List<Image>? image,
  }) {
    _id = id;
    _name = name;
    _isActive = isActive;
    _image = image;
  }

  Department.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isActive = json['is_active'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(Image.fromJson(v));
      });
    }
  }

  num? _id;
  String? _name;
  bool? _isActive;
  List<Image>? _image;

  num? get id => _id;

  String? get name => _name;

  bool? get isActive => _isActive;

  List<Image>? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['is_active'] = _isActive;
    if (_image != null) {
      map['image'] = _image?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 8
/// url : "th (2).jpg1662107835782-737114864.jpg"

class Image {
  Image({
    num? id,
    String? url,
  }) {
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

/// id : 10
/// url : "astermims.jpg1662108119990-461588125.jpg"

class Images {
  Images({
    num? id,
    String? url,
  }) {
    _id = id;
    _url = url;
  }

  Images.fromJson(dynamic json) {
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
