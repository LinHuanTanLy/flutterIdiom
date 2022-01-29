import 'package:flutter/material.dart';
import 'package:idom_app/nets/model/idiom/idiom_list.dart';
import 'package:flutter_libs/net/model/base_res.dart';
import 'package:flutter_libs/net/http_request.dart';
import 'package:idom_app/nets/urls/urls.dart';

class IdiomRepository {
  static Future<List<IdiomList>> getIdiomList(int pageNum) async {
    BaseRes? res = await HttpRequest.post(
      Urls.idiomList,
      callBack: (data) {},
      params: {'pageSize': 10, 'pageNum': pageNum},
    );
    if (res?.resultCode == "200") {
      List _tempList = res?.resultData ?? [];
      return _tempList.map((e) => IdiomList.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
