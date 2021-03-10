import 'package:flutter/material.dart';
import 'package:fluttone_music/homePage/home_screen.dart';
import 'package:fluttone_music/screen/favourite_screen.dart';
import 'package:fluttone_music/screen/settings_screen.dart';
import 'package:fluttone_music/screen/userProfile.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: 120, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(
                    'https://instagram.fccj5-1.fna.fbcdn.net/v/t51.2885-19/s320x320/152028982_174949217495072_3479078532080741611_n.jpg?_nc_ht=instagram.fccj5-1.fna.fbcdn.net&_nc_ohc=_5oVEYN-5z8AX_h437c&tp=1&oh=186eca818478933e6de59189694d88ff&oe=605AF83F'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Safvan k',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text('Premium Member',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserProfile()));
                },
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()));
                },
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteScreen()));
                },
                leading: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                title: Text(
                  "Favourite",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(),
                      ));
                },
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log out',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
