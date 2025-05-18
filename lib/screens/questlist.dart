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
                        final questItem = apiData!.apiList[index];
                        final theme = FluentTheme.of(context);

                        Color progressFillColor;
                        final double progress;

                        // api_progress_flag	：進捗　0=空白(達成含む), 1=50%以上達成, 2=80%以上達成
                        switch (questItem.apiProgressFlag) {
                          case 0:
                            progress = 0.0;
                            progressFillColor = Colors.grey.withOpacity(0.2);
                            break;
                          case 1:
                            progress = 0.5;
                            progressFillColor = Colors.warningPrimaryColor.withOpacity(0.4);
                            break;
                          case 2:
                          default: // Fallback untuk nilai yang tidak terduga
                            progress = 0.8;
                            progressFillColor = Colors.successPrimaryColor.withOpacity(0.6);
                            break;
                        }

                        final Color listTileBaseBackgroundColor = theme.cardColor;

                        final Decoration listTileProgressBackground = BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              progressFillColor,
                              progressFillColor,
                              listTileBaseBackgroundColor,
                              listTileBaseBackgroundColor,
                            ],
                            stops: [
                              0.0,
                              progress.clamp(0.0, 1.0),
                              progress.clamp(0.0, 1.0),
                              1.0,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        );

                        return FlyoutTarget(
                            controller: flyoutCtlr,
                            child: GestureDetector(
                                onTapDown: (details) {
                                  _showContextMenu(
                                      context,
                                      details.globalPosition,
                                      questItem.apiTitle);
                                },
                                child: Tooltip(
                                  message: questItem.apiDetail,
                                  child: DecoratedBox(
                                    decoration: listTileProgressBackground,
                                    child: ListTile.selectable(
                                      tileColor: WidgetStateProperty.all(Colors.transparent),
                                      leading: Text(questItem.cycleInfo.localizedName(context)),
                                      title: Text(questItem.apiTitle),
                                      trailing: questItem.apiState == QuestState.ongoing
                                          ? const Icon(FluentIcons.check_mark)
                                          : null, // Menampilkan null (tidak ada) untuk status lainnya
                                      selected: questItem.apiState != QuestState.unaccepted,
                                    ),
                                  ),
                                )));
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
