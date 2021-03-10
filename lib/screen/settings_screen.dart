import 'package:flutter/material.dart';
import 'package:fluttone_music/screen/userProfile.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
              Container(
                alignment: Alignment.topLeft,
                child:Positioned(
                      left: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            color: Colors.white.withOpacity(0.5)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                ),
              ),
            Container(margin: EdgeInsets.only(top: 22),
              alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10),
                child: Text('Settings',style: TextStyle(color: Colors.white,fontSize: 38,
                fontWeight: FontWeight.bold),
                ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children:[
                Icon(Icons.person_add_outlined,color: Colors.white,size: 20,),
                SizedBox(width: 10,),
                Text('Account',style: TextStyle(color: Colors.white,fontSize: 15),),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
                  },
                  tileColor: Colors.red.withOpacity(0.6),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  title: Text('Edit profile',style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
                  },
                  tileColor: Colors.red.withOpacity(0.6),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  title: Text('Change password',style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
                  },
                  tileColor: Colors.red.withOpacity(0.6),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  title: Text('Premium',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),SizedBox(height: 40,
            ),
            RaisedButton(
              elevation: 10,
                onPressed: (){
                
            },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.grey,
              highlightColor: Colors.deepOrange,
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
