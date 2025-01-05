import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadron_en_route/components/kancolle_model/kancolle_model.dart';
import 'package:squadron_en_route/helper/mod.dart';

class QuestlistView extends StatefulWidget {
  const QuestlistView({super.key});

  @override
  State<StatefulWidget> createState() => QuestlistViewState();
}

class QuestlistViewState extends State<QuestlistView> {
  late QuestlistStateData? apiData;

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
                        return Tooltip(
                            message: apiData!.apiList[index].apiDetail,
                            child: ListTile.selectable(
                              leading: Text('月'),
                              title: Text(apiData!.apiList[index].apiTitle),
                              trailing: Text(
                                  apiData!.apiList[index].apiState.toString()),
                              selected: apiData!.apiList[index].apiState !=
                                  QuestState.unaccepted,
                            ));
                      },
                      itemCount: apiData!.apiList.length))
        ]));
  }
}
