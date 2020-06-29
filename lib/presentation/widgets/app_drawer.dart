import 'package:actin/navigator.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   child: Text('Drawer Header'),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
            ListTile(
              title: Text('Главная'),
              onTap: () {
                _pushUntilSelected(context, ActinRoutes.activityList);
              },
            ),
            ListTile(
              title: Text('Редактирование Activity'),
              onTap: () {
                _pushUntilSelected(context, ActinRoutes.activityEdit);
              },
            ),
            ListTile(
              title: Text('Профиль'),
              onTap: () {
                _pushUntilSelected(context, ActinRoutes.profile);
              },
            ),
            ListTile(
              title: Text('Редактировать профиль'),
              onTap: () {
                _pushUntilSelected(context, ActinRoutes.editProfile);
              },
            ),
          ],
        ),
      ),
    );
  }

  // void _pushUntilSelected(BuildContext context, String newRouteName) {
  //   Navigator.pushNamedAndRemoveUntil(
  //       context, newRouteName, ModalRoute.withName('/'));
  // }

  void _pushUntilSelected(BuildContext context, String newRouteName) {
    Navigator.pushNamed(context, newRouteName);
  }

  void _selectItem(BuildContext context, Function f) {
    f();
    Navigator.pop(context);
  }
}
