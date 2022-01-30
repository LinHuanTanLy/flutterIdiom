import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_libs/res/my_unit.dart';
import 'package:flutter_libs/widget/loading_widget.dart';
import 'package:flutter_libs/widget/loading_dialog.dart';
import 'package:get/get.dart';
import 'package:idom_app/nets/model/idiom/idiom_list.dart';
import 'package:idom_app/nets/repository%20/idiom_repository.dart';

import 'idiom_state.dart';

/// @description:
/// @author
/// @date: 2022/01/29 21:41:08
class IdiomLogic extends GetxController {
  final String img = 'img';
  final answer = 'answer';

  final state = IdiomState();

  final List<IdiomList> _list = [];
  int _currIndex = 0;
  @override
  void onReady() {
    init();
    super.onReady();
  }

  void init() async {
    List<IdiomList> _tempList = await _getList();
    _list.clear();
    _list.addAll(_tempList);
    if (_list.isNotEmpty) {
      state.currOne = _list.first;
      update([img]);
    }
  }

  void toShare() {}

  void seeNext() {
    state.answer="";
    update([answer]);

    if (_currIndex < 9) {
      _currIndex += 1;
      state.currOne = _list[_currIndex];
      update([img]);
    } else {
      _currIndex=0;
      state.pageNum+=1;
      init();
    }
  }

  void seeAnswer() {
    state.answer = state.currOne?.answer;
    if (state.answer?.isNotEmpty ?? false) {
      update(['answer']);
    }
  }

  _getList() async {
    List<IdiomList> _tempList=[];
    _showDialog();
    _tempList= await IdiomRepository.getIdiomList(state.pageNum);
    _dissDialog();
    return _tempList;
  }


  _showDialog(){
    Get.dialog(const LoadingDialog());
  }
  _dissDialog(){
    Get.back();
  }
}
