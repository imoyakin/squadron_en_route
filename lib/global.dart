import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:squadron_en_route/components/webview.dart';

class Global {
  static get keepAlive => InAppWebViewKeepAlive();
  static final GlobalKey<AppWebViewState> appWebViewKey = GlobalKey<AppWebViewState>();
  
  static get appWebView => AppWebView(key: appWebViewKey);
}