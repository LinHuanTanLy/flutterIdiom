import 'package:idom_app/nets/model/idiom/idiom_list.dart';

/// @description:
/// @author
/// @date: 2022/01/29 21:41:08
class IdiomState {
  List<IdiomList> list = [];

  IdiomList? currOne;
  String? answer;
  int pageNum = 1;
  IdiomState() {
    ///Initialize variables
  }

  IdiomList? getFrist() {
    if (list.isNotEmpty) {
      currOne = list.first;
      return currOne;
    } else {
      return null;
    }
  }
}
