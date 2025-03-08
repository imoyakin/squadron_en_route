import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadron_en_route/components/kancolle_model/kancolle_model.dart';
import 'package:squadron_en_route/helper/mod.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestlistView extends StatefulWidget {
  const QuestlistView({super.key});

  @override
  State<StatefulWidget> createState() => QuestlistViewState();
}

class QuestlistViewState extends State<QuestlistView> {
  late QuestlistStateData? apiData;
  final flyoutCtlr = FlyoutController();

  @override
  void initState() {
    super.initState();
    apiData = context
        .read<QuestlistBloc>()
        .state
        .when(initial: () => null, loaded: (data, _) => data);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestlistBloc, QuestlistState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loaded: (apiData, sortOrder) {
              this.apiData = apiData;
              setState(() {});
            },
          );
        },
        child: Column(children: [
          CommandBar(primaryItems: [
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: context.L.webviewCameraTakePic,
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.increase_indent),
                onPressed: () {
                  context
                      .read<QuestlistBloc>()
                      .add(QuestlistEvent.sort(SortOrder.ongoingAsc));
                },
              ),
            ),
          ]),
          Expanded(
              child: apiData == null
                  ? const Center()
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return FlyoutTarget(
                            controller: flyoutCtlr,
                            child: GestureDetector(
                              onTapDown: (details) {
                                _showContextMenu(
                                    context,
                                    details.globalPosition,
                                    apiData!.apiList[index].apiTitle);
                              },
                              child: Tooltip(
                                message: apiData!.apiList[index].apiDetail,
                                child: ListTile.selectable(
                                  leading: Text('月'),
                                  title: Text(apiData!.apiList[index].apiTitle),
                                  trailing: Text(apiData!
                                      .apiList[index].apiState
                                      .toString()),
                                  selected: apiData!.apiList[index].apiState !=
                                      QuestState.unaccepted,
                                ),
                              ),
                            ));
                      },
                      itemCount: apiData!.apiList.length))
        ]));
  }

  void _showContextMenu(BuildContext content, Offset position, String quest) {
    flyoutCtlr.showFlyout(
        position: position,
        builder: (context) {
          return FlyoutContent(
              child: MenuFlyout(
            items: [
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.accept),
                text: const Text('google'),
                onPressed: () async {
                  final Uri url = Uri.parse(
                      'https://www.google.com/search?q=${Uri.encodeComponent(quest)}');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                },
              ),
              const MenuFlyoutSeparator(),
            ],
          ));
        });
  }
}
