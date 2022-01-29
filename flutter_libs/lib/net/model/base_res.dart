
// API 基础返回值
class BaseRes {
  // 状态码

  String? resultMsg;
  String? result;
  int? resultCode;
  var resultData;

  BaseRes({this.resultMsg, this.result, this.resultCode, this.resultData});

  BaseRes.fromJson(Map<String, dynamic> json) {
    resultMsg = json['resultMsg'];
    result = json['result'];
    resultCode = int.parse(json['resultCode'].toString());
    resultData = json['resultData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultMsg'] = resultMsg;
    data['result'] = result;
    data['resultCode'] = resultCode;
    data['resultData'] = resultData;
    return data;
  }
}
