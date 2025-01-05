import 'package:docking/docking.dart';

import 'global.dart';
import 'screens/mod.dart';

class AppConstants {
  static const String appName = 'Squadron En Route';

  static final Uri kancolleUri =
      Uri.parse('http://www.dmm.com/netgame/social/-/gadgets/=/app_id=854854');

  static final String defaultUA =
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36";
}

class DockingView {
  static DockingItem webView = DockingItem(
      name: 'webView', weight: 0, keepAlive: true, widget: Global.appWebView);

  static DockingItem setting =
      DockingItem(name: 'setting', weight: 0.2, widget: SettingView());
  
  static DockingItem createFFC() => DockingItem(name: 'fcc', weight: 0.2, widget: FleetForcesCommand());

  static DockingItem createDryDock() => DockingItem(name: 'drydock', weight: 0.2, widget: Drydock());

  static DockingItem createFleet(int id) => DockingItem(name: 'fleet$id', weight: 0.2, widget: FleetFormation(id: id));

  static DockingItem createQuestlist() => DockingItem(name: 'questlist', weight: 0.2, widget: QuestlistView());
}
