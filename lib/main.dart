import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'assets.dart';
import 'bloc/global/global_bloc.dart';
import 'components/kancolle_model/kancolle_model.dart';
import 'constant.dart';
import 'global.dart';
import 'screens/home.dart';
import 'widgets/mod.dart';
import 'window.dart';

final keepAlive = InAppWebViewKeepAlive();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Assets.init();
  Global();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) initWindow();
  ErrorWidget.builder = (error) => CustomErrorWidget(errorDetails: error);

  ProxyController proxyController = ProxyController.instance();
  await proxyController.clearProxyOverride();
  await proxyController.setProxyOverride(
      settings: ProxySettings(
          proxyRules: [ProxyRule(url: 'http://127.0.0.1:10802')]));

  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalBloc>(
            create: (context) => GlobalBloc(), lazy: false),
        BlocProvider<KancollePortCubit>(create: (context) => KancollePortCubit()),
        BlocProvider<BattleCubit>(create: (context) => BattleCubit()),
        BlocProvider<NdockCubit>(create: (context) => NdockCubit()),
        BlocProvider<SlotItemCubit>(create: (context) => SlotItemCubit()),
        BlocProvider<FurnitureCubit>(create: (context) => FurnitureCubit()),
        BlocProvider<UnsetslotCubit>(create: (context) => UnsetslotCubit()),
        BlocProvider<Start2GetDataCubit>(create: (context) => Start2GetDataCubit()),
        BlocProvider<QuestlistBloc>(create: (context) => QuestlistBloc()),
        BlocProvider<PracticeBattleResultCubit>(create: (context)=> PracticeBattleResultCubit()),
      ],
      child: BlocConsumer<GlobalBloc, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            return appHome(context, state);
          }),
    );
  }

  FluentApp appHome(BuildContext context, GlobalState state) {
    return FluentApp(
      title: AppConstants.appName,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
      ],
      darkTheme: FluentThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.dark,
      home: HomeView(),
    );
  }
}
