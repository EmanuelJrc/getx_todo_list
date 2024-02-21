import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/modules/Sidebar/custom_list.dart';
import 'package:getx_todo_list/app/modules/Sidebar/language.dart';
import 'package:getx_todo_list/app/modules/Sidebar/settings.dart';
import 'package:getx_todo_list/theme/theme_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.deepOrange, Colors.orangeAccent],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/list.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
          CustomListTile(
              Icons.person, 'Profile'.tr, () => selectedItem(context, 0)),
          CustomListTile(Icons.notifications, 'Notification'.tr,
              () => selectedItem(context, 1)),
          CustomListTile(Icons.settings, 'Dark Mode'.tr, () {
            ThemeService().changeThemeMode();
          }),
          CustomListTile(
              Icons.language, 'Language'.tr, () => selectedItem(context, 3)),
        ],
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LanguageSelector(),
        ));
        break;
    }
  }
}
