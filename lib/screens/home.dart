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
      ]),
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
                  print('object');
                  //setState(() {
                  _layout.addItemOnRoot(
                      newItem: DockingItem(
                          name: '3',
                          weight: 0.2,
                          widget: Center(child: Text('1'))),
                      dropPosition: DropPosition.top);
                  //});
                },
              ),
              PlatformMenuItem(
                label: 'Receive',
                onSelected: () {
                  print('Receive');
                },
              ),
            ]),
          ],
        ),
        PlatformMenuItemGroup(members: [
          PlatformMenu(label: 'panel', menus: [
            PlatformMenuItem(
              label: context.L.menubar_webview,
              onSelected: () {
                print('Send');
              },
            ),
            PlatformMenuItem(
              label: 'FleetForcesCommand',
              onSelected: () {
                print("object");
                _layout.addItemOnRoot(
                    newItem: DockingView.createFFC(),
                    dropPosition: DropPosition.top);
              },
            ),
            PlatformMenuItemGroup(members: [
              PlatformMenu(label: 'fleet', menus: [
                PlatformMenuItem(
                  label: 'webview',
                  onSelected: () {
                    print('Send');
                  },
                ),
                PlatformMenuItem(
                  label: 'FleetForcesCommand',
                  onSelected: () {},
                ),
                PlatformMenuItem(
                  label: 'task',
                  onSelected: () {
                    print('Receive');
                  },
                ),
              ]),
            ]),
            PlatformMenuItem(
              label: 'task',
              onSelected: () {
                print('Receive');
              },
            ),
          ]),
        ]),
        PlatformMenuItemGroup(members: [
          PlatformMenu(label: 'help', menus: [
            PlatformMenuItem(
              label: 'about',
              onSelected: () {
                print('Send');
              },
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
}
