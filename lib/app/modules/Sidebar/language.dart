import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';

class LanguageSelector extends StatelessWidget {
  final lang = GetStorage();

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
                onTap: () {
                  var locale = Locale('en', 'US');
                  Get.updateLocale(locale);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(
                  'Croatian',
                  style: TextStyle(fontSize: 12.0.sp),
                ),
                onTap: () {
                  var locale = Locale('hr', 'HR');
                  Get.updateLocale(locale);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
