import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:fluttone_music/screen/customBody.dart';
import 'package:fluttone_music/utilities/constants.dart';

class TrackScreen extends StatefulWidget {
  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
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

  Widget customImage() {
    return CarouselSlider(
      options: CarouselOptions(
          initialPage: 0,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2)),
      items: [
        Image.network("https://i.ytimg.com/vi/Oozz4APJpiM/maxresdefault.jpg"),
        Image.network("https://i.ytimg.com/vi/zj13J-12IBU/maxresdefault.jpg"),
        Image.network(
            "https://siachenstudios.com/wp-content/uploads/2020/08/3geuv3sxgy0.jpg")
      ],
    );
  }

  // Widget scrl(){
  //   return ScrollController(
  //
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          customImage(),
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3, top: 200),
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
                trailing: Icon(Icons.playlist_add),
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
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 5),
          //   child: SlidingUpPanel(
          //     panel: CustomBody(),
          //     minHeight: 55,
          //     maxHeight: MediaQuery.of(context).size.height,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(18),
          //       topRight: Radius.circular(18),
          //       bottomLeft: Radius.circular(18),
          //       bottomRight: Radius.circular(18),
          //     ),
          //     collapsed: Container(
          //       width: double.infinity,
          //       height: double.infinity,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(18),
          //           topRight: Radius.circular(18),
          //           bottomLeft: Radius.circular(18),
          //           bottomRight: Radius.circular(18),
          //         ),
          //         gradient: LinearGradient(
          //           begin: Alignment.topLeft,
          //           end: Alignment.bottomRight,
          //           stops: [
          //             0.0,
          //             0.7,
          //           ],
          //           colors: [
          //             Color(0xFF47ACE1),
          //             Color(0xFFDF5F9D),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
