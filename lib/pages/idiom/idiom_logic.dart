import 'package:get/get.dart';
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



  _getList(){
    IdiomRepository.getIdiomList(1);
  }
}
