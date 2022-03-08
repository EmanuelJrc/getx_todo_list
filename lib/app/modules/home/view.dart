import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/values/colors.dart';
import 'package:getx_todo_list/app/data/models/task.dart';
import 'package:getx_todo_list/app/modules/Sidebar/custom_list.dart';
import 'package:getx_todo_list/app/modules/Sidebar/language.dart';
import 'package:getx_todo_list/app/modules/Sidebar/settings.dart';
import 'package:getx_todo_list/app/modules/home/controller.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';
import 'package:getx_todo_list/app/modules/home/widgets/add_card.dart';
import 'package:getx_todo_list/app/modules/home/widgets/add_dialog.dart';
import 'package:getx_todo_list/app/modules/home/widgets/task_card.dart';
import 'package:getx_todo_list/app/modules/report/view.dart';
import 'package:getx_todo_list/theme/theme_service.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.deepOrange,
                  Colors.orangeAccent
                ])),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/list.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                )),
            CustomListTile(
                Icons.person, 'Profile'.tr, () => selectedItem(context, 0)),
            CustomListTile(Icons.notifications, 'Notification'.tr,
                () => selectedItem(context, 1)),
            CustomListTile(
              Icons.settings,
              'Dark Mode'.tr,
              () {
                ThemeService().changeThemeMode();
              },
            ),
            CustomListTile(
                Icons.language, 'Language'.tr, () => selectedItem(context, 3)),
          ],
        ),
      ),
      // backgroundColor: Colors.black54, //Change the color of the main screen
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0.wp),
                    child: Text(
                      'My List'.tr,
                      style: TextStyle(
                        fontSize: 24.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Obx(
                    () => GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        ...controller.tasks
                            .map((element) => LongPressDraggable(
                                data: element,
                                onDragStarted: () =>
                                    controller.changeDeleting(true),
                                onDraggableCanceled: (_, __) =>
                                    controller.changeDeleting(false),
                                onDragEnd: (_) =>
                                    controller.changeDeleting(false),
                                feedback: Opacity(
                                  opacity: 0.8,
                                  child: TaskCard(task: element),
                                ),
                                child: TaskCard(task: element)))
                            .toList(),
                        AddCard()
                      ],
                    ),
                  )
                ],
              ),
            ),
            ReportPage(),
          ],
        ),
      ),
      floatingActionButton: DragTarget<Task>(
        builder: (_, __, ___) {
          return Obx(
            () => FloatingActionButton(
              backgroundColor: controller.deleting.value ? Colors.red : blue,
              onPressed: () {
                if (controller.tasks.isNotEmpty) {
                  Get.to(() => AddDialog(), transition: Transition.downToUp);
                } else {
                  EasyLoading.showInfo('Please create your task type'.tr);
                }
              },
              child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
            ),
          );
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess('Delete Success'.tr);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Obx(
          () => BottomNavigationBar(
            onTap: (int index) => controller.changeTabIndex(index),
            currentIndex: controller.tabIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                label: 'Home'.tr,
                icon: Padding(
                  padding: EdgeInsets.only(right: 15.0.wp),
                  child: const Icon(
                    Icons.apps,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Report'.tr,
                icon: Padding(
                  padding: EdgeInsets.only(left: 15.0.wp),
                  child: const Icon(
                    Icons.data_usage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Set what you want the buttons in the sidebar to do

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
