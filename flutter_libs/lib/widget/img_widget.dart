import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libs/widget/loading_widget.dart';

class ImgWidget extends StatelessWidget {
  final String url;
  const ImgWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      fit: BoxFit.fill,
      cache: true,
      border: Border.all(color: Colors.red, width: 1.0),
      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      loadStateChanged: (ExtendedImageState stauts) {
        switch (stauts.extendedImageLoadState) {
          case LoadState.loading:
            return const LoadingWidget();
          case LoadState.failed:
            return const Text('加载失败');
          case LoadState.completed:
        }
      },
    );
  }
}
