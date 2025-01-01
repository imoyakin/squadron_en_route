import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

void initWindow() async {
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    // size: Size(Storage().windowWidth, Storage().windowHeight),
    // minimumSize: const Size(320, 640),
    // center: Storage().windowX == null || Storage().windowY == null,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    // if (Storage().windowX != null && Storage().windowY != null) {
    //   await windowManager
    //       .setPosition(Offset(Storage().windowX!, Storage().windowY!));
    // }
    await windowManager.show();
    await windowManager.focus();
  });
}
