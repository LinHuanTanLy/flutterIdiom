
// API 基础返回值
class BaseRes {
  // 状态码

  String? resultMsg;
  String? resultCode;
  var resultData;

  BaseRes({this.resultMsg, this.resultCode, this.resultData});

  BaseRes.fromJson(Map<String, dynamic> json) {
    resultMsg = json['message'];
    resultCode = json['code'];
    resultData = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = resultMsg;
    data['code'] = resultCode;
    data['data'] = resultData;
    return data;
  }
}
