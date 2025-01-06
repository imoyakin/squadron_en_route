import 'dart:collection';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:squadron_en_route/assets.dart';
import 'package:squadron_en_route/components/kancolle_model/kancolle_parse.dart';
import 'package:squadron_en_route/constant.dart';
import 'package:squadron_en_route/helper/mod.dart';
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
    return ScaffoldPage(
      content: Stack(alignment: Alignment.center, children: [
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
                    kancolleMessageHandle(context, message!);
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
      ]),
      bottomBar: CommandBar(
        primaryItems: [
          CommandBarBuilderItem(
            builder: (context, mode, w) => Tooltip(
              message: context.L.webviewCameraTakePic,
              child: w,
            ),
            wrappedItem: CommandBarButton(
              icon: const Icon(FluentIcons.camera),
              onPressed: () {},
            ),
          ),
          CommandBarBuilderItem(
            builder: (context, mode, w) => Tooltip(
              message: context.L.webviewScale,
              child: w,
            ),
            wrappedItem: CommandBarButton(
              icon: const Icon(FluentIcons.back_to_window),
              onPressed: () {
                controller.injectJavascriptFileFromAsset(
                    assetFilePath: 'assets/js/autoScaleIOS.js');
              },
            ),
          ),
          CommandBarBuilderItem(
            builder: (context, mode, w) => Tooltip(
              message: context.L.webviewRefresh,
              child: w,
            ),
            wrappedItem: CommandBarButton(
              icon: const Icon(FluentIcons.refresh),
              onPressed: () {
                controller.reload();
              },
            ),
          ),
        ],
        secondaryItems: [
          CommandBarBuilderItem(
            builder: (context, mode, w) => Tooltip(
              message: context.L.webviewForceRefresh,
              child: w,
            ),
            wrappedItem: CommandBarButton(
              icon: const Icon(FluentIcons.refresh),
              onPressed: () {
                InAppWebViewController.clearAllCache();
                controller.clearCache();
              },
            ),
          ),
        ],
        isCompact: true,
      ),
    );
  }
}
