import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/kancolle_model/kancolle_model.dart';

class FleetForcesCommand extends StatefulWidget {
  const FleetForcesCommand({super.key});

  @override
  State<StatefulWidget> createState() => FleetForcesCommandState();
}

class FleetForcesCommandState extends State<FleetForcesCommand> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KancollePortCubit, KancollePortState>(
        builder: (context, state) {
      return state.when(
          initial: () => Text('data'),
          loaded: (apiMaterial, apiDeckPort, apiNdock, apiShip, apiBasic,
              apiLog, apiPBgmId, apiParallelQuestCount, apiDestShipSlot) {
            return Container(
              color: FluentTheme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 4.0, 
                  runSpacing: 4.0,
                  children: [
                    fccInfo(FluentIcons.anchor_lock, apiBasic.apiNickname),
                    fccInfo(FluentIcons.unknown, apiBasic.apiLevel.toString()),
                    fccInfo(FluentIcons.trophy, apiBasic.apiRank.toString()),
                    fccInfo(FluentIcons.trophy, apiBasic.apiRank.toString()),
                    fccInfo(FluentIcons.clock, apiBasic.apiPlayTime.toString()),
                    fccInfo(FluentIcons.trophy, apiBasic.apiExperience.toString()),
                    fccInfo(FluentIcons.trophy, apiBasic.apiMaxSlotItem.toString()),
                    fccInfo(FluentIcons.trophy, apiBasic.apiTutorial.toString()),
                    fccInfo(FluentIcons.trophy, apiBasic.apiCountDeck.toString()),
                    fccInfo(FluentIcons.trophy, apiBasic.apiMaxChara.toString()),
                    fccInfo(FluentIcons.trophy, apiBasic.apiMaxKagu.toString()),
                  ],
                ),
              ),
            );
          });
    });
  }

  Widget fccInfo(IconData icon, String content, {InfoBarSeverity? severity}) {
    return InfoBar(
      isIconVisible: false,
      title: Icon(icon),
      content: Text(content),
      severity: severity ?? InfoBarSeverity.info,
    );
  }
}
