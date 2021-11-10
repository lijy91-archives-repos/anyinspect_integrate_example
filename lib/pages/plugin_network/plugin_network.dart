import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preference_list/preference_list.dart';

class PluginNetworkPage extends StatefulWidget {
  const PluginNetworkPage({Key? key}) : super(key: key);

  @override
  _PluginNetworkPageState createState() => _PluginNetworkPageState();
}

class _PluginNetworkPageState extends State<PluginNetworkPage> {
  final Dio _dio = Dio();
  Widget _buildBody(BuildContext context) {
    return PreferenceList(
      children: <Widget>[
        PreferenceListSection(
          children: [
            PreferenceListItem(
              title: const Text('Get 200'),
              onTap: () async {
                final response =
                    await _dio.get('https://api.github.com/users/lijy91/orgs');
                print(response.data);
              },
            ),
            PreferenceListItem(
              title: const Text('Get 404'),
              onTap: () async {
                final response =
                    await _dio.get('https://api.github.com/users/x/x');
                print(response.data);
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
        title: const Text('Network'),
      ),
      body: _buildBody(context),
    );
  }
}
