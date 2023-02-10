import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = 
    "https://avatars.githubusercontent.com/u/107750881?v=4";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                accountName: Text("Rifat Amin"),
                accountEmail: Text("raifathai17@gmail.com"),
                currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),  
                )
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,
               color: Colors.white,),
               title: Text("Home",
               textScaleFactor: 1.3,
               style: TextStyle(
                color: Colors.white,
               ),
               ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
               color: Colors.white,),
               title: Text("Profile",
               textScaleFactor: 1.3,
               style: TextStyle(
                color: Colors.white,
               ),
               ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,
               color: Colors.white,),
               title: Text("Email",
               textScaleFactor: 1.3,
               style: TextStyle(
                color: Colors.white,
               ),
               ),
            ),
          ],
        ),
      ),
    );
  }
}
