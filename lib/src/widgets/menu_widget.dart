import 'package:flutter/material.dart';
import 'package:s10_preferencias_usuario/src/pages/home_page.dart';
import 'package:s10_preferencias_usuario/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/menu-img.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(
              Icons.home,
              color: Colors.lightBlue,
            ),
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            title: Text("Notes"),
            leading: Icon(
              Icons.note,
              color: Colors.lightBlue,
            ),
          ),
          ListTile(
            title: Text("Information"),
            leading: Icon(
              Icons.info,
              color: Colors.lightBlue,
            ),
          ),
          ListTile(
            title: Text("Settings"),
            leading: Icon(
              Icons.settings,
              color: Colors.lightBlue,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          )
        ],
      ),
    );
  }
}
