import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:squadron_en_route/assets.dart';
import 'package:squadron_en_route/components/kancolle_model/kancolle_parse.dart';
import 'package:squadron_en_route/constant.dart';
import 'package:uuid/uuid.dart';
import '../main.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({super.key});

  @override
  State createState() => AppWebViewState();
}

class AppWebViewState extends State<AppWebView> {
  double progress = 0;
  late InAppWebViewController controller;
  InAppWebViewSettings webViewSetting = InAppWebViewSettings(
    javaScriptEnabled: true,
    javaScriptBridgeEnabled: true,
    javaScriptHandlersForMainFrameOnly: false,
    isInspectable: true,
    // userAgent: customUA.isNotEmpty ? customUA : defaultUA,
    userAgent: AppConstants.defaultUA,
    preferredContentMode: UserPreferredContentMode.DESKTOP,
    //Allow window.open JS
    javaScriptCanOpenWindowsAutomatically: true,
    useShouldInterceptRequest: true,
    // useShouldInterceptFetchRequest: true,
    isElementFullscreenEnabled: false,
    mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
    upgradeKnownHostsToHTTPS: false,
  );

  final String styleIdO = Uuid().v4().substring(0, 8);
  final String styleIdI = Uuid().v4().substring(0, 8);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
            aspectRatio: 5 / 3,
            child: InAppWebView(
              keepAlive: keepAlive,
              initialUrlRequest:
                  URLRequest(url: WebUri.uri(AppConstants.kancolleUri)),
              initialSettings: webViewSetting,
              initialUserScripts: UnmodifiableListView([
                kancolleUserScript,
                kancolleResourceHackScript,
              ]),
              onWebViewCreated: (c) {
                WebMessageListener kcl = WebMessageListener(
                  jsObjectName: "kcMessage",
                  onPostMessage:
                      (message, sourceOrigin, isMainFrame, replyProxy) {
                    // _kancolleMessageHandle(message!);

                    kancolleMessageHandle(context, message!);
                    print(json);
                  },
                );
                controller = c;
                controller.addWebMessageListener(kcl);
              },
              onLoadStart: (controller, uri) async {
                print('Page started loading: $uri');
              },
              onLoadStop: (controller, uri) async {},
              onReceivedError: (controller, request, error) {
                if (error.type == -1007) {
                  // Handle the error here
                  print('Error: ${error.description}');
                  // You can show an alert dialog or a custom error page
                }
              },
              onConsoleMessage: (controller, consoleMessage) =>
                  print(consoleMessage),
            )),
            
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              controller.reload();
            },
            child: Icon(Icons.refresh),
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              print("clear cache");
              InAppWebViewController.clearAllCache();
              controller.clearCache();
            },
            child: Icon(Icons.refresh),
          ),
        ),
        Positioned(
          bottom: 80,
          right: 16,
          child: FloatingActionButton(
            onPressed: () async {
              controller.injectJavascriptFileFromAsset(
                  assetFilePath: 'assets/js/autoScaleIOS.js');
            },
            child: Icon(Icons.zoom_in),
          ),
        ),
        progress < 1.0
            ? LinearProgressIndicator(
                value: progress,
                color: Colors.amber,
                backgroundColor: Colors.transparent,
              )
            : Container(),
      ],
    );
  }
}
