import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preference_list/preference_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PluginSharedPreferencesPage extends StatefulWidget {
  const PluginSharedPreferencesPage({Key? key}) : super(key: key);

  @override
  _PluginSharedPreferencesPageState createState() =>
      _PluginSharedPreferencesPageState();
}

class _PluginSharedPreferencesPageState
    extends State<PluginSharedPreferencesPage> {
  late SharedPreferences _prefs;
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Widget _buildBody(BuildContext context) {
    return PreferenceList(
      children: <Widget>[
        PreferenceListSection(
          children: [
            PreferenceListItem(
              title: const Text('setBool'),
              onTap: () async {
                for (var i = 0; i < 10; i++) {
                  await _prefs.setBool('boolkey_$i', i % 2 == 0);
                }
              },
            ),
            PreferenceListItem(
              title: const Text('setInt'),
              onTap: () async {
                for (var i = 0; i < 10; i++) {
                  await _prefs.setInt('intkey_$i', i);
                }
              },
            ),
            PreferenceListItem(
              title: const Text('setDouble'),
              onTap: () async {
                for (var i = 0; i < 10; i++) {
                  await _prefs.setDouble('doublekey_$i', i * 0.1);
                }
              },
            ),
            PreferenceListItem(
              title: const Text('setString'),
              onTap: () async {
                for (var i = 0; i < 10; i++) {
                  await _prefs.setString('stringkey_$i', 'stringvalue_$i');
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences'),
      ),
      body: _buildBody(context),
    );
  }
}
