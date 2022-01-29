import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idom_app/conf/router_conf.dart';
import 'package:idom_app/pages/idiom/idiom_view.dart';
import 'package:idom_app/pages/main.dart';
import 'package:flutter_libs/init/libs_init.dart';

void main() {
  LibsInitUtils.init(baseUrl: 'http://150.158.23.24:8877/');

  runApp(GetMaterialApp(
    home: const Main(),
    getPages: [
      GetPage(name: RouterConf.idiom, page: () => IdiomPage()),
    ],
  ));
}
