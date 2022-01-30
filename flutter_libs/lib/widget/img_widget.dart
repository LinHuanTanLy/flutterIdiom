import 'package:flutter/material.dart';

class ImgWidget extends StatelessWidget {
  final String url;
  const ImgWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
