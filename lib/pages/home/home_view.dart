import 'package:flutter/material.dart';
import 'package:flutter_libs/widget/page_bar.dart';
import 'package:get/get.dart';

import 'home_logic.dart';
import 'home_state.dart';

/// @description:
/// @author 
/// @date: 2022/01/29 21:32:34
class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(context,title: "首页",ifGoback: false,),
    );
  }
}
