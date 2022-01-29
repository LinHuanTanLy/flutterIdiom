import 'package:flutter/material.dart';
import 'package:flutter_libs/res/my_colors.dart';
import 'package:flutter_libs/res/my_unit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUnit.w100,
      height: MyUnit.w100,
      child: const CircularProgressIndicator(
        color: MyColors.cFF445E,
      ),
    );
  }
}
