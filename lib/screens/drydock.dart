import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadron_en_route/components/kancolle_model/kancolle_model.dart';

class Drydock extends StatefulWidget {
  const Drydock({super.key});

  @override
  State<StatefulWidget> createState() => _DrydockState();
}

class _DrydockState extends State<Drydock> {
  late List<Ndock> ndocks = [];
  late List<KancolleShip> shipData = [];
  late List<ApiShip> userShips = [];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    context.read<Start2GetDataCubit>().state.maybeMap(
          loaded: (value) => shipData = value.apiMstShip ?? [],
          orElse: () {},
        );
    context.read<NdockCubit>().state.maybeMap(
          loaded: (value) => ndocks = value.ndocks ?? [],
          orElse: () {},
        );
    context.read<KancollePortCubit>().state.maybeMap(
          loaded: (value) => userShips = value.apiShip ?? [],
          orElse: () {},
        );

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<Start2GetDataCubit, Start2GetDataState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              loaded: (state) {
                setState(() {
                  shipData = state.apiMstShip ?? [];
                });
              },
            );
          },
        ),
        BlocListener<NdockCubit, NdockState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (ndock) {
                setState(() {
                  ndocks = ndock ?? [];
                });
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: ListView.builder(
        itemCount: ndocks.length,
        itemBuilder: (context, index) {
          var userShip = userShips.firstWhere(
            (element) => element.apiId == ndocks[index].apiShipId,
            orElse: () => ApiShip(),
          );
          KancolleShip ship = shipData.firstWhere(
            (element) => element.apiId == userShip.apiShipId,
            orElse: () => KancolleShip(),
          );

          return ship.apiName == ''
              ? ListTile()
              : _buildListTile(ship, ndocks[index]);
        },
      ),
    );
  }

  Widget _buildListTile(KancolleShip ship, Ndock ndock) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: ValueNotifier(DateTime.now()),
      builder: (context, currentTime, child) {
        var finishTime =
            DateTime.fromMillisecondsSinceEpoch(ndock.apiCompleteTime);
        var timeLeft = finishTime.difference(currentTime);
        String formattedTimeLeft =
            "${timeLeft.inHours}:${(timeLeft.inMinutes % 60).toString().padLeft(2, '0')}:${(timeLeft.inSeconds % 60).toString().padLeft(2, '0')}";

        return ListTile(
          leading: SizedBox(),
          title: Text(ship.apiName ?? ''),
          subtitle: Text(formattedTimeLeft),
        );
      },
    );
  }
}
