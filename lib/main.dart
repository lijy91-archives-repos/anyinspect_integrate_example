import 'package:anyinspect/anyinspect.dart';
import 'package:anyinspect_plugin_network/anyinspect_plugin_network.dart';
import 'package:anyinspect_plugin_shared_preferences/anyinspect_plugin_shared_preferences.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'includes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AnyInspect anyInspect = AnyInspect.instance;
  anyInspect.addPlugin(AnyInspectPluginNetwork());
  anyInspect.addPlugin(AnyInspectPluginSharedPreferences());
  anyInspect.start();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff416ff4),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xffF7F9FB),
        dividerColor: Colors.grey.withOpacity(0.3),
      ),
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      home: const HomePage(),
    );
  }
}
