/// tokens : {"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsIm1vYl9ubyI6IjgxMjk2Njc0NTMiLCJlbWFpbCI6Im1pcnpmYUBnbWFpbC5jb20iLCJpYXQiOjE2NTg2NjU3MjgsImV4cCI6MTY1ODc1MjEyOH0.FYRk8u8Y9MrGrps-a0M_si_pXvodgIXSTV7RTj4hFGQ","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsIm1vYl9ubyI6IjgxMjk2Njc0NTMiLCJlbWFpbCI6Im1pcnpmYUBnbWFpbC5jb20iLCJpYXQiOjE2NTg2NjU3MjgsImV4cCI6MTY1OTI3MDUyOH0.eQ1u1s5RAd61LHsaYLVWJxH5GUMNPAmhei67ouvHVbQ"}

class LoginModel {
  LoginModel({
      Tokens? tokens,}){
    _tokens = tokens;
}

  LoginModel.fromJson(dynamic json) {
    _tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
  }
  Tokens? _tokens;

  Tokens? get tokens => _tokens;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tokens != null) {
      map['tokens'] = _tokens?.toJson();
    }
    return map;
  }

}

/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsIm1vYl9ubyI6IjgxMjk2Njc0NTMiLCJlbWFpbCI6Im1pcnpmYUBnbWFpbC5jb20iLCJpYXQiOjE2NTg2NjU3MjgsImV4cCI6MTY1ODc1MjEyOH0.FYRk8u8Y9MrGrps-a0M_si_pXvodgIXSTV7RTj4hFGQ"
/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsIm1vYl9ubyI6IjgxMjk2Njc0NTMiLCJlbWFpbCI6Im1pcnpmYUBnbWFpbC5jb20iLCJpYXQiOjE2NTg2NjU3MjgsImV4cCI6MTY1OTI3MDUyOH0.eQ1u1s5RAd61LHsaYLVWJxH5GUMNPAmhei67ouvHVbQ"

class Tokens {
  Tokens({
      String? accessToken, 
      String? refreshToken,}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Tokens.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }
  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    return map;
  }

}