import 'package:flutter/material.dart';
import 'package:flutter_libs/res/my_colors.dart';
import 'package:flutter_libs/widget/loading_widget.dart';
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
          SizedBox(
            height: MyUnit.w700,
            width: MyUnit.w750,
            child: GetBuilder<IdiomLogic>(
              id: 'vp_content',
              builder: (_) {
                return state.getFrist() != null
                    ? Image.network(state.getFrist()?.imgUrl ?? "")
                    : const Center(
                        child: LoadingWidget(),
                      );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              if ((state.answer?.isEmpty ?? true)) {
                logic.seeAnswer();
              }
            },
            child: GetBuilder<IdiomLogic>(
              id: 'answer',
              builder: (_) {
                return Container(
                  decoration: BoxDecoration(
                    color: MyColors.cFF445E,
                    borderRadius: BorderRadius.circular(MyUnit.w50),
                  ),
                  height: MyUnit.w100,
                  width: MyUnit.w600,
                  alignment: Alignment.center,
                  child: Text(
                    (state.answer?.isEmpty ?? true)
                        ? '点击查看答案'
                        : '${state.answer}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MyUnit.sp30,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: MyUnit.w30,
          ),
          GestureDetector(
            onTap: () {
              logic.seeNext();
            },
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.cFF445E,
                borderRadius: BorderRadius.circular(MyUnit.w50),
              ),
              height: MyUnit.w100,
              width: MyUnit.w600,
              alignment: Alignment.center,
              child: Text(
                '下一道',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUnit.sp30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: MyUnit.w30,
          ),
          GestureDetector(
            onTap: () {
              logic.toShare();
            },
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.cFF445E,
                borderRadius: BorderRadius.circular(MyUnit.w50),
              ),
              height: MyUnit.w100,
              width: MyUnit.w600,
              alignment: Alignment.center,
              child: Text(
                '分享出去',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUnit.sp30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
