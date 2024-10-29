/// Status : "Success"
/// Details : "4e06abf3-cc04-438e-a09f-d4c4b27b6edb"

class SendOtpModel {
  SendOtpModel({
      String? status, 
      String? details,}){
    _status = status;
    _details = details;
}

  SendOtpModel.fromJson(dynamic json) {
    _status = json['Status'];
    _details = json['Details'];
  }
  String? _status;
  String? _details;

  String? get status => _status;
  String? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['Details'] = _details;
    return map;
  }

}