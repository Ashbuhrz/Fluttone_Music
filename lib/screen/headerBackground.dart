import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttone_music/screen/bodyImageClipper.dart';

class HeaderBackground extends StatefulWidget {
  @override
  _HeaderBackgroundState createState() => _HeaderBackgroundState();
}

class _HeaderBackgroundState extends State<HeaderBackground> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width * 0.3,
          height: size.height * 0.17,
          margin: EdgeInsets.only(top: size.width * 0.7),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(blurRadius: 40, spreadRadius: 30, color: Colors.grey),
          ]),
        ),
        ClipPath(
          clipper: BodyImageCLipper(),
          child: Container(
            margin: EdgeInsets.only(top: 5),
            height: size.height * 0.55,
            color: Colors.white,
          ),
        ),
        ClipPath(
          clipper: BodyImageCLipper(),
          child: Container(
            height: size.height * 0.55,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.macrumors.com/t/sqodWOqvWOvq6cU8t2ahMlU4AJM=/1600x0/article-new/2018/05/apple-music-note.jpg'),
                  fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        )
      ],
    );
  }
}
