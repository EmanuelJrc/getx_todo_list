import 'package:shared_preferences/shared_preferences.dart';

class DrawerState {
  static const String _drawerKey = 'drawer_open';

  // Method to save the drawer state to SharedPreferences
  static Future<void> saveDrawerState(bool isOpen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_drawerKey, isOpen);
  }

  // Method to retrieve the drawer state from SharedPreferences
  static Future<bool> getDrawerState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_drawerKey) ?? false;
  }
}
