import 'package:fluent_ui/fluent_ui.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final TextEditingController _httpProxyController = TextEditingController();
  final TextEditingController _socksProxyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _setProxy() {}

  void _clearProxy() {}

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(12.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.5,
      ),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Theme Settings',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Theme Mode:'),
                    const SizedBox(width: 8),
                    ComboBox<String>(
                      value: 'System',
                      items: [
                        'System',
                        'Light',
                        'Dark',
                      ]
                          .map((mode) => ComboBoxItem<String>(
                                value: mode,
                                child: Text(mode),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // TODO: Implement theme change
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Accent Color:'),
                    const SizedBox(width: 8),
                    ComboBox<String>(
                      value: 'Blue',
                      items: [
                        'Blue',
                        'Red',
                        'Green',
                        'Orange',
                        'Purple',
                      ]
                          .map((color) => ComboBoxItem<String>(
                                value: color,
                                child: Text(color),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // TODO: Implement accent color change
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Proxy Settings Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Proxy Settings',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                InfoLabel(
                  label: 'HTTP Proxy',
                  child: TextBox(
                    controller: _httpProxyController,
                    placeholder: 'http://proxy.example.com:8080',
                  ),
                ),
                const SizedBox(height: 8),
                InfoLabel(
                  label: 'SOCKS Proxy',
                  child: TextBox(
                    controller: _socksProxyController,
                    placeholder: 'socks5://proxy.example.com:1080',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      child: const Text('Clear Proxy'),
                      onPressed: _clearProxy,
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      child: const Text('Apply'),
                      onPressed: _setProxy,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Advanced Settings Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Advanced Settings',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Language:'),
                    const SizedBox(width: 8),
                    ComboBox<String>(
                      value: 'English',
                      items: [
                        'English',
                        'Chinese',
                        'Spanish',
                      ]
                          .map((lang) => ComboBoxItem<String>(
                                value: lang,
                                child: Text(lang),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // TODO: Implement language change
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ToggleSwitch(
                  checked: true,
                  content: const Text('Enable automatic updates'),
                  onChanged: (value) {
                    // TODO: Handle update setting
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
