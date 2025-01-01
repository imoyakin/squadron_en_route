[macos]
flutter:
	flutter pub run build_runner build --delete-conflicting-outputs
	flutter gen-l10n

[macos]
build:
    flutter build macos --release
