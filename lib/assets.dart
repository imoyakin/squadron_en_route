import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Assets {
  static final Assets _instance = Assets._internal();
  factory Assets() => _instance;
  Assets._internal();

  static late String kancolleInjectJS;
  static late String kancolleResourceHackJS;
  
  static Future<void> init() async {
    kancolleInjectJS =
        await rootBundle.loadString('assets/js/kancolle_inject.js');

    kancolleResourceHackJS =
        await rootBundle.loadString('assets/js/resource-hack.js');
  }
}

UserScript get kancolleUserScript => UserScript(
    source: Assets.kancolleInjectJS,
    injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
    forMainFrameOnly: false,
    groupName: "kancolle");

UserScript get kancolleResourceHackScript => UserScript(
    source: Assets.kancolleInjectJS,
    injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
    forMainFrameOnly: false,
    groupName: "kancolle");

