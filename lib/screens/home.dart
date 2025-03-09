import 'package:docking/docking.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:squadron_en_route/constant.dart';

import '../helper/mod.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with LayoutParserMixin, AreaBuilderMixin {
  late DockingLayout _layout;

  @override
  void initState() {
    super.initState();
    _layout = DockingLayout(
      root: DockingTabs([
        DockingView.webView,
        DockingView.setting,
      ], id: 'root'),
    );
    try {
      _layout.load(layout: '', parser: this, builder: this);
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: [
        PlatformMenuItemGroup(
          members: [
            PlatformMenu(label: 'Message', menus: [
              PlatformMenuItem(
                label: 'add',
                onSelected: () {
                  _layout.addItemOnRoot(
                      newItem: DockingItem(
                          name: '3',
                          weight: 0.2,
                          widget: Center(child: Text('1'))),
                      dropPosition: DropPosition.top);
                },
              ),
              PlatformMenuItem(
                label: 'Receive',
                onSelected: () {},
              ),
            ]),
          ],
        ),
        PlatformMenuItemGroup(members: [
          PlatformMenu(label: 'panel', menus: [
            PlatformMenuItem(
              label: context.L.menubar_webview,
              onSelected: () {},
            ),
            PlatformMenuItem(
              label: 'FleetForcesCommand',
              onSelected: () {
                addItemOnWebview(DockingView.createFFC());
              },
            ),
            PlatformMenuItemGroup(members: [
              PlatformMenu(label: 'fleet', menus: [
                PlatformMenuItem(
                  label: 'dry dock',
                  onSelected: () {
                    addItemOnWebview(DockingView.createDryDock());
                  },
                ),
                PlatformMenuItem(
                  label: 'FleetForcesCommand',
                  onSelected: () {},
                ),
                PlatformMenuItem(
                  label: 'quest',
                  onSelected: () {
                    addItemOnWebview(DockingView.createQuestlist());
                  },
                ),
              ]),
            ]),
            PlatformMenuItem(
              label: 'quest',
              onSelected: () {
                addItemOnWebview(DockingView.createQuestlist());
              },
            ),
          ]),
        ]),
        PlatformMenuItemGroup(members: [
          PlatformMenu(label: 'help', menus: [
            PlatformMenuItem(
              label: 'about',
              onSelected: () {},
            ),
          ]),
        ]),
      ],
      child: ScaffoldPage(
          content: TabbedViewTheme(
              data: TabbedViewThemeData.dark(),
              child: Container(
                  padding: const EdgeInsets.all(2),
                  child: Docking(layout: _layout)))),
    );
  }

  @override
  DockingItem buildDockingItem(
      {required id, required double? weight, required bool maximized}) {
    return DockingItem(
      name: id,
      weight: weight,
      maximizable: maximized,
      widget: Center(child: Text(id)),
    );
  }

  void addItemOnWebview(DockingItem newItem) {
    try {
      DockingTabs root = _layout.findDockingArea('root') as DockingTabs;
      _layout.addItemOn(
          newItem: newItem, targetArea: root, dropIndex: root.childrenCount);
    } catch (e) {
      print(e);
    }
  }
}
