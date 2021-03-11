import 'package:flutter/material.dart';
import 'package:fluttone_music/homePage/tracks_screen.dart';
import 'package:fluttone_music/screen/favourite_screen.dart';
import 'package:fluttone_music/screen/search_screen.dart';
import 'package:fluttone_music/screen/userProfile.dart';
import 'package:fluttone_music/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List tabs = [
    TrackScreen(),
    SearchScreen(),
    FavouriteScreen(),
    UserProfile(),
  ];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  bool closeTopContainer = false;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kBackgroundColor,

            ///Removed gesture detector to IconButton for more [TapTargetSize]
            leading: isDrawerOpen
                ? IconButton(
                    padding: EdgeInsets.only(left: 30),
                    onPressed: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 32,
                      color: Colors.red,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        xOffset = 230;
                        yOffset = 150;
                        scaleFactor = 0.7;
                        isDrawerOpen = true;
                      });
                    },
                    child: Icon(
                      Icons.menu,
                      size: 32,
                      color: Colors.red,
                    ),
                  ),
            centerTitle: true,
            title: Text(
              'Fluttone',
              style: kAppTitleTextStyle,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserProfile(),
                    ));
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://instagram.fccj5-1.fna.fbcdn.net/v/t51.2885-19/s320x320/152028982_174949217495072_3479078532080741611_n.jpg?_nc_ht=instagram.fccj5-1.fna.fbcdn.net&_nc_ohc=_5oVEYN-5z8AX_h437c&tp=1&oh=186eca818478933e6de59189694d88ff&oe=605AF83F'),
                  ),
                ),
              )
            ],
          ),
          body: tabs[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.red,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.favorite_outline),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black38,
            onTap: _onItemTapped,
          )),
    );
  }
}
