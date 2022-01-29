import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'idiom_logic.dart';
import 'idiom_state.dart';

/// @description:
/// @author 
/// @date: 2022/01/29 21:41:08
class IdiomPage extends StatelessWidget {
  final IdiomLogic logic = Get.put(IdiomLogic());
  final IdiomState state = Get.find<IdiomLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
