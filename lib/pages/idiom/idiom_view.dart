import 'package:flutter/material.dart';
import 'package:flutter_libs/widget/page_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_libs/res/my_unit.dart';

import 'idiom_logic.dart';
import 'idiom_state.dart';

/// @description:
/// @author
/// @date: 2022/01/29 21:41:08
class IdiomPage extends StatelessWidget {
  final IdiomLogic logic = Get.put(IdiomLogic());
  final IdiomState state = Get.find<IdiomLogic>().state;

  IdiomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(
        context,
        title: "猜成语",
      ),
      body: Column(
        children: [


          Container(
            height: MyUnit.w700,
            width: MyUnit.w750,
            color: Colors.red,
          ),

          Container(
            
          ),
        ],
      ),
    );
  }
}
