import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/modules/home/controller.dart';

class SettingsPage extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('People'),
      ),
    );
  }
}
