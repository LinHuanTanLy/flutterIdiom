import 'package:flutter/material.dart';
import 'package:flutter_libs/widget/page_bar.dart';
import 'package:get/get.dart';

import 'person_logic.dart';
import 'person_state.dart';

/// @description:
/// @author
/// @date: 2022/01/29 21:32:40
class PersonPage extends StatelessWidget {
  final PersonLogic logic = Get.put(PersonLogic());
  final PersonState state = Get.find<PersonLogic>().state;

  PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(
        context,
        title: "我的",
        ifGoback: false,
      ),
    );
  }
}
