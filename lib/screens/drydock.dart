import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadron_en_route/components/kancolle_model/kancolle_model.dart';

class Drydock extends StatelessWidget {
  const Drydock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NdockCubit, NdockState>(builder: (context, state) {
      return state.when(
        initial: () => Text('data'),
        loaded: (ndock){
          return ListView.builder(
            itemCount: ndock?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ndock?[index].apiShipId?.toString() ?? ''),
              );
            },
          );
        }
      );
    });
  }
}