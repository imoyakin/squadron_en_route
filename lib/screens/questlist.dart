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
  late int apiCount;
  late int apiCompletedKind;
  late List<Quest> apiList = [];
  late int apiExecCount;
  late List<ApiClist> apiCList;
  late int apiExecType;

  @override
  void initState() {
    super.initState();
    apiList = [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestlistCubit, QuestlistState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loaded: (apiCount, apiCompletedKind, apiList, apiExecCount,
                apiCList, apiExecType) {
              this.apiCount = apiCount;
              this.apiCompletedKind = apiCompletedKind;
              this.apiList = List.from(apiList);
              this.apiExecCount = apiExecCount;
              this.apiCList = apiCList;
              this.apiExecType = apiExecType;
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
                  setState(() {
                    apiList.sort(
                        (a, b) => b.apiState.index.compareTo(a.apiState.index));
                  });
                },
              ),
            ),
          ]),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Tooltip(
                      message: apiList[index].apiDetail,
                      child: ListTile.selectable(
                      leading: Text('月'),
                      title: Text(apiList[index].apiTitle),
                      trailing: Text(apiList[index].apiState.toString()),
                      selected:
                          apiList[index].apiState != QuestState.unaccepted,
                    ));
                  },
                  itemCount: apiList.length)),
        ]));
  }
}
