import 'package:flutter/material.dart';

//ConstantTextStyles and Colors
const kBackgroundColor = Color(0xff1d1c22);

const kMusicTitleTextStyle =
    TextStyle(color: Colors.white, fontFamily: 'Source Sans');

const kAppTitleTextStyle =
    TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Amita');

const kSongTitile = TextStyle(
    fontFamily: 'Source Sans',
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold);

//TextField Border
const kTextFieldBorder=OutlineInputBorder(
    borderSide: BorderSide(width: 2),
    borderRadius: const BorderRadius.all(
        const Radius.circular(30.0)));