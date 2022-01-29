import 'package:flutter/material.dart';
import 'package:flutter_libs/res/my_colors.dart';
import 'package:flutter_libs/res/my_unit.dart';
import 'package:flutter_libs/utils/toast_utils.dart';
import 'package:flutter_libs/utils/screen_utils.dart';

import 'home/home_view.dart';
import 'person/person_view.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currIndex = 0;
  int _lastClickTime = 0;

  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  /// 推出应用
  Future<bool> _doExitApp() {
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime < 1500) {
      return Future.value(true);
    } else {
      Toast.show(
        "再按一次退出应用",
      );
      _lastClickTime = nowTime;
      return Future.value(false);
    }
  }

  void _changePage(int page) {
    pageController.animateToPage(page,
        duration: kTabScrollDuration, curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return WillPopScope(
      onWillPop: _doExitApp,
      child: Scaffold(
        body: PageView.custom(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            childrenDelegate:
                SliverChildListDelegate([HomePage(), PersonPage()])),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          child: SizedBox(
            height: MyUnit.w120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.home,
                    size: MyUnit.w60,
                      color:
                          _currIndex == 0 ? MyColors.cFF445E : MyColors.c3C3C3C,
                    ),
                    onPressed: () {
                      setState(() {
                        _currIndex = 0;
                        _changePage(0);
                      });
                    }),
                IconButton(
                    icon: Icon(
                      Icons.person,
                      size: MyUnit.w60,
                      color:
                          _currIndex == 1 ? MyColors.cFF445E : MyColors.c3C3C3C,
                    ),
                    onPressed: () {
                      setState(() {
                        _currIndex = 1;
                        _changePage(1);
                      });
                    }),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          elevation: 10.0,

          ///阴影
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Color(0xffff445e),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked, //放在中间
      ),
    );
  }
}
