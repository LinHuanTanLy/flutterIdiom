import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///自定义appBar
class PageBar extends PreferredSize {
  //标题
  final String? title;
  final BuildContext context;

  final VoidCallback? goBack;

  final bool ifGoback;

  PageBar(this.context,
      {Key? key, this.title, this.goBack, this.ifGoback = true})
      : assert(title != null),
        super(
            key: key,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).padding.top, 0, 0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ifGoback
                      ? Positioned(
                          left: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (goBack != null) {
                                goBack.call();
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Image.network(
                                'https://upload-images.jianshu.io/upload_images/1924616-07ab294a8c51dccf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
                                width: 24,
                                height: 24,
                                // package: "flutter_libs",
                                color: const Color(0xff3c3c3c),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Container(
                    width: 750,
                    margin: const EdgeInsets.only(left: 60, right: 60),
                    alignment: Alignment.center,
                    child: Text(
                      title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color(0xff3c3c3c),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size(MediaQuery.of(context).size.width, 44));
}
