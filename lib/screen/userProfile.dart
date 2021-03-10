import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttone_music/utilities/constants.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: NetworkImage(
                        'https://instagram.fccj5-1.fna.fbcdn.net/v/t51.2885-19/s320x320/152028982_174949217495072_3479078532080741611_n.jpg?_nc_ht=instagram.fccj5-1.fna.fbcdn.net&_nc_ohc=_5oVEYN-5z8AX_h437c&tp=1&oh=186eca818478933e6de59189694d88ff&oe=605AF83F'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "User Name,",
                          filled: true,
                          fillColor: Color(0xff28272a),
                          hintStyle: TextStyle(color: Colors.white38),
                          prefixIcon: Icon(Icons.person_sharp),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),),),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Change Password",
                          filled: true,
                          fillColor: Color(0xff28272a),
                          hintStyle: TextStyle(color: Colors.white38),
                          prefixIcon: Icon(Icons.lock_open),
                          border: kTextFieldBorder,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          filled: true,
                          fillColor: Color(0xff28272a),
                          hintStyle: TextStyle(color: Colors.white38),
                          prefixIcon: Icon(Icons.lock_open),
                          border: kTextFieldBorder),
                    ),
                  ),
                  RaisedButton(
                    elevation: 10,
                    onPressed: () {
                    },
                    color: Colors.red[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Save Changes",
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
