import 'package:get/get.dart';
import 'package:idom_app/nets/model/idiom/idiom_list.dart';
import 'package:idom_app/nets/repository%20/idiom_repository.dart';

import 'idiom_state.dart';

/// @description:
/// @author
/// @date: 2022/01/29 21:41:08
class IdiomLogic extends GetxController {
  final state = IdiomState();

  @override
  void onReady() {
    _getList();
    super.onReady();
  }

  _getList() async {
    List<IdiomList> _list = await IdiomRepository.getIdiomList(state.pageNum);
    state.list.addAll(_list);
    update(['vp_content']);
  }

  void toShare() {}

  void seeNext() {
    if (state.list.isNotEmpty && state.list.length > 1) {
      state.list.removeAt(0);
      state.getFrist();
      update(['vp_content']);
    } else {
      state.list.removeAt(0);
      state.pageNum += 1;
      _getList();
    }
  }

  void seeAnswer() {
    state.answer = state.currOne?.answer;
    if (state.answer?.isNotEmpty ?? false) {
      update(['answer']);
    }
  }
}
