import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageSelector extends StatelessWidget {
  final lang = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(
                  'English',
                  style: TextStyle(fontSize: 12.0),
                ),
                onTap: () {
                  var locale = Locale('en', 'US');
                  Get.updateLocale(locale);
                  lang.write(
                      'language', 'en_US'); // Save language to local storage
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(
                  'Croatian',
                  style: TextStyle(fontSize: 12.0),
                ),
                onTap: () {
                  var locale = Locale('hr', 'HR');
                  Get.updateLocale(locale);
                  lang.write(
                      'language', 'hr_HR'); // Save language to local storage
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
