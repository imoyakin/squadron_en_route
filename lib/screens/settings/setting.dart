import 'package:flutter/material.dart';

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

  void _setProxy() {
  }

  void _clearProxy() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _httpProxyController,
              decoration: InputDecoration(labelText: 'HTTP Proxy'),
            ),
            TextField(
              controller: _socksProxyController,
              decoration: InputDecoration(labelText: 'SOCKS5 Proxy'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _setProxy,
                  child: Text('Set Proxy'),
                ),
                ElevatedButton(
                  onPressed: _clearProxy,
                  child: Text('Clear Proxy'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}