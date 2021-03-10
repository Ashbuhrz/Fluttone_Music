import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttone_music/homePage/main_screen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2020/07/23/11/58/man-5431169_1280.jpg'),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fluttone",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: 'Amita',
                  ),
                ),
                Text(
                  "PLAY THE MUSIC YOU LOVE",
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 500),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                ButtonTheme(
                  minWidth: 180,
                  height: 44,
                  child: RaisedButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.red[800],
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MusicScreen(),
                      ));
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
