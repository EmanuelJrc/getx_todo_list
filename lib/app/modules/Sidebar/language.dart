import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';

class LanguageSelector extends StatelessWidget {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'CROATIAN', 'locale': Locale('hr', 'CRO')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(
                  'English',
                  style: TextStyle(fontSize: 12.0.sp),
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(
                  'Croatian',
                  style: TextStyle(fontSize: 12.0.sp),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
