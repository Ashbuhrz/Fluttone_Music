import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:fluttone_music/homePage/homePage.dart';
import 'package:fluttone_music/screen/userProfile.dart';
import 'dart:io';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<SongInfo> favourites = [];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 22),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Favourites',
                style: TextStyle(
                    color: Colors.white38,

                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
