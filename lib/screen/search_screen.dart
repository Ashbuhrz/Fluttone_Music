import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:fluttone_music/utilities/constants.dart';
import 'customBody.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  final GlobalKey<CustomBodyState> key = GlobalKey<CustomBodyState>();
  List<SongInfo> songs = [];
  int currentIndex = 0;
  ScrollController controller = ScrollController();

  void initState() {
    super.initState();
    getTracks();

  }
  void getTracks() async {
    songs = await audioQuery.getSongs();
    setState(() {
      songs = songs;
    });
  }

  void changeTrack(bool isNext) {
    if (isNext) {
      if (currentIndex != songs.length - 1) {
        currentIndex++;
      }
    } else {
      if (currentIndex != 0) {
        currentIndex--;
      }
    }
    key.currentState.setSong(songs[currentIndex]);
  }

  Future searchBar(String val)async {
    List<SongInfo> serch = await audioQuery.searchSongs(query: "$val");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children:[ Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value){
                  setState(() {
                    searchBar(value);
                    print('searched value is $value');
                  });

                },
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, top: 50),
                  child: ListView.separated(
                    controller: controller,
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: songs.length,
                    itemBuilder: (context, index) => ListTile(
                      tileColor: Colors.black38,
                      leading: CircleAvatar(
                        backgroundImage: songs[index].albumArtwork == null
                            ? NetworkImage(
                            'https://images.macrumors.com/t/sqodWOqvWOvq6cU8t2ahMlU4AJM=/1600x0/article-new/2018/05/apple-music-note.jpg')
                            : FileImage(File(songs[index].albumArtwork)),
                      ),
                      title: Text(

                        songs[index].title,
                        style: kMusicTitleTextStyle,
                      ),
                      subtitle: Text(
                        songs[index].artist,
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      onTap: () {
                        currentIndex = index;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CustomBody(
                                changeTrack: changeTrack,
                                songInfo: songs[currentIndex],
                                key: key)));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),],
      ),
    );
  }
}
