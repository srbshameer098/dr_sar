/// id : 1
/// title : "Mirsa 1000 Idiotic Tales"
/// tiny_mce_data : "<div style=\"max-width: 40rem; margin: 0 auto;\">\n<h1 style=\"line-height: 1.3; margin: 4rem 0 2rem;\">Lightweight. Loaded with features. Optimized for mobile.</h1>\n<p style=\"line-height: 1.5;\">Over <span class=\"mce-annotation tox-comment\" data-mce-annotation-uid=\"mce-conversation_37026667421657461494027\" data-mce-annotation=\"tinycomments\">1.5M developers agree</span> TinyMCE is the rich text editor of choice. With an open-source core and additional premium add-ons, TinyMCE scales with your app as you grow.</p>\n<div style=\"width: 100%; display: flex; flex-wrap: wrap;\">\n<div style=\"flex: 1;\">\n<p style=\"line-height: 1.5;\">Use TinyMCE as:</p>\n<ul>\n<li style=\"margin: 10px 0;\"><span style=\"font-size: 18px;\">A <strong>basic</strong> editor</span></li>\n<li style=\"margin: 10px 0;\"><span style=\"font-size: 18px;\">An advanced 📝 editor</span></li>\n<li style=\"margin: 10px 0;\"><span style=\"font-size: 18px;\">A <span class=\"mention\" data-mention-user-id=\"RosalinaMartel\">@collaborative</span> editor</span></li>\n<li style=\"margin: 10px 0;\"><span style=\"font-size: 18px;\">A totally <span style=\"color: #00bc84; font-size: 12pt;\"><code>&lt;customized&gt;</code></span> editor</span></li>\n</ul>\n<p style=\"font-size: 24px; line-height: 1.3;\"><strong>Try out this demo to see how it works!</strong></p>\n</div>\n<div><img style=\"max-width: 100%;\" role=\"presentation\" src=\"blob:https://www.tiny.cloud/d0063800-14c1-48b7-923e-571a0137d93d\" alt=\"\" width=\"316\"></div>\n</div>\n</div>"
/// thumbNail : {"id":1,"url":"photo-1596541223130-5d31a73fb6c6.jpg1658896261118-837533370.jpg"}

class HomeServicesModel {
  HomeServicesModel({
    int? id,
    String? title,
    String? tinyMceData,
    ThumbNail? thumbNail,
  }) {
    _id = id;
    _title = title;
    _tinyMceData = tinyMceData;
    _thumbNail = thumbNail;
  }

  static List<HomeServicesModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => HomeServicesModel.fromJson(value)).toList();
  }

  HomeServicesModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _tinyMceData = json['tiny_mce_data'];
    _thumbNail = json['thumbNail'] != null
        ? ThumbNail.fromJson(json['thumbNail'])
        : null;
  }

  int? _id;
  String? _title;
  String? _tinyMceData;
  ThumbNail? _thumbNail;

  int? get id => _id;

  String? get title => _title;

  String? get tinyMceData => _tinyMceData;

  ThumbNail? get thumbNail => _thumbNail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['tiny_mce_data'] = _tinyMceData;
    if (_thumbNail != null) {
      map['thumbNail'] = _thumbNail?.toJson();
    }
    return map;
  }
}

/// id : 1
/// url : "photo-1596541223130-5d31a73fb6c6.jpg1658896261118-837533370.jpg"

class ThumbNail {
  ThumbNail({
    int? id,
    String? url,
  }) {
    _id = id;
    _url = url;
  }

  ThumbNail.fromJson(dynamic json) {
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
