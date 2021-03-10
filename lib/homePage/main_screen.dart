import 'package:flutter/material.dart';
import 'package:fluttone_music/homePage/drawerScreen.dart';
import 'package:fluttone_music/homePage/home_screen.dart';

class MusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
