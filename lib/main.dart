import 'package:flutter/material.dart';
import 'package:fluttone_music/homePage/main_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'model/hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(path.path)
    ..registerAdapter(SongPlayListAdapter());

  var box = await Hive.openBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MusicScreen(),
      ),
    );
  }
}
