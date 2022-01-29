import 'dart:convert';
import 'dart:io';

import 'dart:developer' as devloper;
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libs/init/libs_init.dart';
import 'package:flutter_libs/utils/toast_utils.dart';

import 'model/base_res.dart';

class HttpRequest {
  static const String GET = "get";
  static const String POST = "post";
  static const String PUT = "put";
  static const String DELETE = "delete";

  static HttpRequest? httpRequest;
  static Options? _option;
  static Interceptors? _interceptors;
  late Dio _dio;

  // 网络请求异常自定义回调
  static Function? onHandleError;
  // 网络请求 Loading 自定义展示
  static Function? onShowLoading;
  // 网络请求 Loading 自定义隐藏
  static Function? onHideLoading;

  static initConf(
      {Function? onHandleError,
      Function? onShowLoading,
      Function? onHideLoading}) {
    HttpRequest.onHandleError = onHandleError;
    HttpRequest.onShowLoading = onShowLoading;
    HttpRequest.onHideLoading = onHideLoading;
  }

  static HttpRequest getInstance() {
    httpRequest ??= HttpRequest();
    return httpRequest!;
  }

  HttpRequest() {
    _option = getDioOptions(contentType: Headers.formUrlEncodedContentType);

    _dio = Dio(BaseOptions(
      connectTimeout: 300000,
      receiveTimeout: 300000,
      baseUrl: LibsInitUtils.appBaseUrl,
    ));

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }

  getDio() {
    return _dio;
  }

  // get请求
  static get(String url,
      {required params,
      Function? callBack,
      Function? errorCallBack,
      bool isShowErrorToast = false,
      bool? isTakeParams,
      BuildContext? context,
      Options? options,
      String? baseUrl,
      Interceptors? interceptors,
      bool isShowLoading = false}) async {
    return _request(url,
        method: GET,
        queryParameters: params,
        callBack: callBack,
        errorCallBack: errorCallBack,
        isShowErrorToast: isShowErrorToast,
        isTakeParams: isTakeParams,
        context: context,
        options: options,
        baseUrl: baseUrl,
        interceptors: interceptors,
        isShowLoading: isShowLoading);
  }

  // put请求
  static put(String url,
      {required params,
      Function? callBack,
      Function? errorCallBack,
      bool isShowLoading = false,
      bool isShowErrorToast = false,
      bool? isTakeParams,
      BuildContext? context,
      Options? options,
      String? baseUrl,
      Interceptors? interceptors,
      queryParameters}) async {
    return _request(url,
        method: PUT,
        data: params,
        queryParameters: queryParameters,
        callBack: callBack,
        errorCallBack: errorCallBack,
        isShowErrorToast: isShowErrorToast,
        isTakeParams: isTakeParams,
        context: context,
        options: options,
        baseUrl: baseUrl,
        interceptors: interceptors,
        isShowLoading: isShowLoading);
  }

  // put请求
  static delete(String url,
      {required params,
      Function? callBack,
      Function? errorCallBack,
      bool isShowErrorToast = false,
      bool isShowLoading = false,
      bool? isTakeParams,
      BuildContext? context,
      Options? options,
      String? baseUrl,
      Interceptors? interceptors,
      queryParameters}) async {
    return _request(url,
        method: DELETE,
        data: params,
        queryParameters: queryParameters,
        callBack: callBack,
        errorCallBack: errorCallBack,
        isShowErrorToast: isShowErrorToast,
        isTakeParams: isTakeParams,
        context: context,
        options: options,
        baseUrl: baseUrl,
        interceptors: interceptors,
        isShowLoading: isShowLoading);
  }

  // post请求
  static post(String url,
      {required params,
      Function? callBack,
      Function? errorCallBack,
      bool isShowErrorToast = false,
      BuildContext? context,
      bool isShowLoading = false,
      bool? isTakeParams,
      Options? options,
      String? baseUrl,
      Interceptors? interceptors,
      queryParameters}) async {
    return _request(url,
        method: POST,
        data: params,
        queryParameters: queryParameters,
        callBack: callBack,
        errorCallBack: errorCallBack,
        isShowErrorToast: isShowErrorToast,
        isTakeParams: isTakeParams,
        context: context,
        options: options,
        baseUrl: baseUrl,
        interceptors: interceptors,
        isShowLoading: isShowLoading);
  }

  // 具体的还是要看返回数据的基本结构
  // 公共代码部分
  static _request(String url,
      {required String method,
      data,
      Function? callBack,
      Function? errorCallBack,
      bool isShowErrorToast = false,
      BuildContext? context,
      bool isShowLoading = false,
      Options? options,
      String? baseUrl,
      Interceptors? interceptors,
      bool? isTakeParams,
      queryParameters}) async {
    var reqData = data;
    if (data != null && data is Map) {
      reqData = Map<dynamic, dynamic>.from(data);
    }
    var reqQueryParameters = queryParameters;
    if (queryParameters != null && queryParameters is Map) {
      reqQueryParameters = Map<String, dynamic>.from(queryParameters);
    }

    Dio dio = await HttpRequest.getInstance().getDio();
    dio.options.baseUrl = baseUrl ?? LibsInitUtils.appBaseUrl;
    dio.interceptors.clear();
    dio.interceptors.addAll(interceptors ?? (_interceptors ?? []));
    if (method == GET) {
      return dio
          .get(url,
              queryParameters: reqQueryParameters, options: options ?? _option)
          .then((res) {
        return _handRes(
            res, errorCallBack, callBack, context, isShowErrorToast);
      }).catchError((exception) {
        return _handError(errorCallBack, exception.toString(), 999, context,
            isShowErrorToast);
      });
    } else if (method == POST) {
      return dio
          .post(url,
              data: reqData,
              queryParameters: reqQueryParameters,
              options: options ?? _option)
          .then((res) {
        return _handRes(
            res, errorCallBack, callBack, context, isShowErrorToast);
      }).catchError((exception) {
        return _handError(errorCallBack, exception.toString(), 999, context,
            isShowErrorToast);
      });
    } else if (method == PUT) {
      return dio
          .put(url,
              data: reqData,
              queryParameters: reqQueryParameters,
              options: options ?? _option)
          .then((res) {
        return _handRes(
            res, errorCallBack, callBack, context, isShowErrorToast);
      }).catchError((exception) {
        return _handError(errorCallBack, exception.toString(), 999, context,
            isShowErrorToast);
      });
    } else if (method == DELETE) {
      return dio
          .delete(url,
              data: reqData,
              queryParameters: reqQueryParameters,
              options: options ?? _option)
          .then((res) {
        return _handRes(
            res, errorCallBack, callBack, context, isShowErrorToast);
      }).catchError((exception) {
        return _handError(errorCallBack, exception.toString(), 999, context,
            isShowErrorToast);
      });
    }
  }

  static _handRes(response, errorCallBack, callBack, BuildContext? context,
      bool isShowErrorToast) {
   
    String errorMsg = "";
    int statusCode;

    statusCode = response.statusCode;

    if (statusCode == HttpStatus.ok || statusCode == HttpStatus.created) {
      try {
        String resStr;
        if (response.data is String) {
          resStr = response.data;
        } else {
          resStr = jsonEncode(response.data);
        }
        BaseRes baseRes = BaseRes.fromJson(jsonDecode(resStr));
        if (callBack != null) {
          callBack(baseRes);
        }
        return baseRes;
      } catch (e) {
        errorMsg = "网络请求数据解析错误";
        return _handError(errorCallBack, errorMsg, 888,
            context, isShowErrorToast);
      }
    } else {
      errorMsg = "网络请求错误,状态码:" + statusCode.toString();
      return _handError(errorCallBack, errorMsg, 999,
          context, isShowErrorToast);
    }
  }

  //处理异常
  static BaseRes _handError(Function? errorCallback, String errorMsg,
      int errorCode, BuildContext? context, bool isShowErrorToast) {
   

    if (isShowErrorToast) {
      Toast.show(errorMsg);
    }
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    return BaseRes(resultMsg: errorMsg, result: 'fail', resultCode: errorCode);
  }

  // 生成 DioOptions
  static getDioOptions({String? contentType}) {
    Options options = Options();
    options.contentType = contentType ?? Headers.formUrlEncodedContentType;
    options.responseType = ResponseType.json;
    return options;
  }

 
}
