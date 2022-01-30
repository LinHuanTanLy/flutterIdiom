import 'package:flutter/material.dart';
import 'package:flutter_libs/res/my_colors.dart';
import 'package:flutter_libs/res/my_unit.dart';
import 'package:flutter_libs/widget/loading_widget.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(MyUnit.w24),
        width: MyUnit.w220,
        height: MyUnit.w220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MyUnit.w16),
            color: Colors.white),
        child: Column(
          children: [
            const LoadingWidget(),
            SizedBox(
              height: MyUnit.w36,
            ),
            const Text(
              '加载中',
              style: TextStyle(fontSize: 12, color: MyColors.c3C3C3C),
            )
          ],
        ),
      ),
    );
  }
}
