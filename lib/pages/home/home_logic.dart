import 'package:get/get.dart';
import 'package:idom_app/conf/router_conf.dart';

import 'home_state.dart';

/// @description:
/// @author 
/// @date: 2022/01/29 21:32:34
class HomeLogic extends GetxController {
  final state = HomeState();

  void toIdiom() {
    Get.toNamed(RouterConf.idiom);
  }
}
