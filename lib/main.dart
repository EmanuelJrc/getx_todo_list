import 'package:flutter/material.dart';
import 'package:getx_todo_list/app/data/services/storage/services.dart';
import 'package:getx_todo_list/app/modules/home/binding.dart';
import 'package:getx_todo_list/app/modules/home/messages.dart';
import 'package:getx_todo_list/app/modules/home/view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getx_todo_list/app/modules/report/view.dart';
import 'package:getx_todo_list/theme/theme_service.dart';
import 'package:getx_todo_list/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => StorageService().init());

  final lang = GetStorage();
  String? savedLanguage = lang.read('language');
  if (savedLanguage != null) {
    Get.updateLocale(Locale(savedLanguage.split('_')[0], savedLanguage.split('_')[1]));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      title: 'Todo List',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/report', page: () => ReportPage()),
      ],
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      builder: (context, child) {
        return FlutterEasyLoading( // Initialize the EasyLoading widget
          child: child,
        );
      },
    );
  }
}