import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_media_notification/flutter_media_notification.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:fluttone_music/screen/headerBackground.dart';
import 'package:fluttone_music/utilities/constants.dart';
import 'package:just_audio/just_audio.dart';

class CustomBody extends StatefulWidget {
  SongInfo songInfo;
  Function changeTrack;

  final GlobalKey<CustomBodyState> key;
  CustomBody({this.songInfo, this.changeTrack, this.key}) : super(key: key);

  CustomBodyState createState() => CustomBodyState();
}

class CustomBodyState extends State<CustomBody> {
  double minimumValue = 0.0, maximumValue = 0.0, currentValue = 0.0;
  String currentTime = '', endTime = '';

  bool isPlaying = false;
  String status = 'hidden';

  final AudioPlayer player = AudioPlayer();

  void initState() {
    super.initState();
    setSong(widget.songInfo);
    MediaNotification.setListener('pause', () {
      setState(() {
        status = 'pause';
      });
      changeStatus();
    });
    MediaNotification.setListener('play', () {
      setState(() {
        status = 'play';
      });
      changeStatus();
    });
    MediaNotification.setListener('next', () {
      widget.changeTrack(true);
    });
    MediaNotification.setListener('prev', () {
      widget.changeTrack(false);
    });
    MediaNotification.setListener('prev', () {
      widget.changeTrack(false);
    });
    MediaNotification.setListener('select', () {});
  }

  void dispose() {
    super.dispose();
    hideNotfication();
    player?.dispose();
  }

  void setSong(SongInfo songInfo) async {
    widget.songInfo = songInfo;
    currentNotificaton();
    await player.setUrl(widget.songInfo.uri);
    currentValue = minimumValue;
    maximumValue = player.duration.inMilliseconds.toDouble();
    setState(() {
      currentTime = getDuration(currentValue);
      endTime = getDuration(maximumValue);
    });

    isPlaying = false;
    changeStatus();
    player.positionStream.listen((duration) {
      currentValue = duration.inMilliseconds.toDouble();
      setState(() {
        currentTime = getDuration(currentValue);
        if (currentValue >= maximumValue) {
          widget.changeTrack(true);
        }
      });
    });
  }

  void changeStatus() {
    setState(() {
      isPlaying = !isPlaying;
    });
    if (isPlaying) {
      player.play();
      currentNotificaton();
    } else {
      player.pause();
      pausNotification();
    }
  }

  String getDuration(double value) {
    Duration duration = Duration(milliseconds: value.round());
    return [duration.inMinutes, duration.inSeconds]
        .map((e) => e.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }



  //background play notification
  void currentNotificaton() {
    MediaNotification.showNotification(
        title: widget.songInfo.title, author: widget.songInfo.artist);
  }

  //background pause notification
  void pausNotification() {
    MediaNotification.showNotification(
        title: widget.songInfo.title,
        author: widget.songInfo.artist,
        isPlaying: false);
  }

  //function for playing
  void playNotification() {
    MediaNotification.showNotification(
      title: widget.songInfo.title,
      author: widget.songInfo.artist,
      isPlaying: true,
    );
  }

  //hide background play
  void hideNotfication() {
    MediaNotification.hideNotification();
  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // double listHeight =
    //     ((size.height * 0.6) * widget.songInfo.track.length).toDouble();
    return Material(
      child: Column(
        children: [
          CustomHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40 * 1.5),
                    child: Slider(
                      inactiveColor: Colors.black,
                      activeColor: Colors.red,
                      min: minimumValue,
                      max: maximumValue,
                      value: currentValue,
                      onChanged: (value) {
                        currentValue = value;
                        player.seek(Duration(milliseconds: currentValue.round()));
                      },
                    ),
                  ),
                  // Container(
                  //   child: ListView.builder(
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: widget.songInfo.filePath.length,
                  //     itemExtent: size.height * 0.055,
                  //     itemBuilder: (context, index) => ListTile(
                  //         leading: Icon(
                  //           index == currentValue
                  //               ? Icons.pause_circle_filled_outlined
                  //               : Icons.play_arrow_outlined,
                  //           size: 22,
                  //         ),
                  //         title: index == currentValue
                  //             ? Text(
                  //                 widget.songInfo.title,
                  //                 style: TextStyle(
                  //                     fontSize: 14,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.black),
                  //               )
                  //             : Text(
                  //                 widget.songInfo.artist,
                  //                 style: TextStyle(
                  //                     fontSize: 14,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.black),
                  //               ),
                  //         trailing: Text(
                  //           widget.songInfo.artist,
                  //           style: TextStyle(fontSize: 14, color: Colors.black),
                  //         )),
                  //   ),
                  // ),
                  Container(
                    transform: Matrix4.translationValues(0, -15, 0),
                    margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(currentTime,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500)),
                        Text(endTime,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.skip_previous,
                              color: Colors.red, size: 55),
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            widget.changeTrack(false);
                          },
                        ),
                        GestureDetector(
                          child: Icon(
                              isPlaying
                                  ? Icons.pause_circle_filled_rounded
                                  : Icons.play_circle_fill_rounded,
                              color: Colors.red,
                              size: 85),
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            changeStatus();
                          },
                        ),
                        GestureDetector(
                          child: Icon(Icons.skip_next,
                              color: Colors.red, size: 55),
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            widget.changeTrack(true);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  CustomHeader() {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        HeaderBackground(),
        Container(
          alignment: Alignment.center,
          height: size.height * 0.7,
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * 0.06,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.white.withOpacity(0.5)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: FavoriteButton(
                        isFavorite: false,
                        valueChanged: (_isFavorite) {
                          print('Is Favorite : $_isFavorite');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  widget.songInfo.title,
                  style:kSongTitile,
              ),),
              // SizedBox(
              //   height: size.height * 0.1,
              // ),

              Text(
                widget.songInfo.album,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    height: 1.5),
              ),

              // Spacer(),
              // Text(
              //   widget.songInfo.title,
              //   style: TextStyle(color: Colors.black.withOpacity(0.5)),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: size.height * 0.025),
              //   width: size.width * 0.3,
              //   height: 2,
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.centerLeft,
              //       end: Alignment.centerRight,
              //       colors: [
              //         Colors.grey.withOpacity(0.05),
              //         Colors.grey.withOpacity(0.8),
              //         Colors.grey.withOpacity(0.05),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Positioned(
          top: size.height * 0.3,
          child: Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2.0, color: Colors.white),
              image: DecorationImage(
                  image: NetworkImage(
                    'https://images.macrumors.com/t/sqodWOqvWOvq6cU8t2ahMlU4AJM=/1600x0/article-new/2018/05/apple-music-note.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}
