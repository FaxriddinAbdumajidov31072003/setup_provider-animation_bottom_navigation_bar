import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:setup_provider/application/main_controller.dart';
import 'package:setup_provider/presentation/style/style.dart';
import 'package:setup_provider/presentation/view/pages/home/home_page.dart';
import 'package:setup_provider/presentation/view/pages/notification/notification_page.dart';
import 'package:setup_provider/presentation/view/pages/profile/profile_page.dart';
import 'package:setup_provider/presentation/view/pages/search/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final mainController = Get.put(MainController());

  notificationPermission() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((event) {
      debugPrint("FirebaseMessaging.onMessage");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint("FirebaseMessaging.onMessageOpenedApp");
    });
  }

  @override
  void initState() {
    notificationPermission();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<MainController>(builder: (controller) {
        return Stack(
          children: [
            ProsteIndexedStack(
              index: controller.currentIndex,
              children: [
                IndexedStackChild(child: const HomePage()),
                IndexedStackChild(child: const SearchPage()),
                IndexedStackChild(child: const NotificationPage()),
                IndexedStackChild(child: const ProfilePage()),
              ],
            ),
            Positioned(
              bottom: mainController.offset.dy == 0
                  ? 64
                  : Get.height - mainController.offset.dy - 60.h,
              right: mainController.offset.dx == 0  ? 0 : Get.width - mainController.offset.dx - 220.w,
              child: Container(
                color: Style.transparent,
                width: Get.width,
                child: Center(
                    child: Obx(
                ()=> Draggable(
                  maxSimultaneousDrags:
                        mainController.isScrolling.value ? 1 : 0,
                  feedback: AnimatedContainer(
                    width: mainController.isScrolling.value ? 64 : 160,
                    height: 64,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(32)),
                    duration: const Duration(milliseconds: 500),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          margin: EdgeInsets.only(
                              right: mainController.isScrolling.value
                                  ? 0
                                  : 16,
                          ),
                          duration: const Duration(milliseconds: 500),
                          height: mainController.isScrolling.value ? 0 : 24,
                          width: mainController.isScrolling.value ? 0 : 24,
                          child: Column(children: [
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.r),
                                  child: Icon(
                                    Icons.home,
                                    color: Style.black.withOpacity(
                                        mainController.isScrolling.value ? 0 : 1),
                                  ),
                                ))
                          ]),
                        ),
                        AnimatedContainer(
                          margin: EdgeInsets.only(
                              right: mainController.isScrolling.value
                                  ? 0
                                  : 16),
                          duration: const Duration(milliseconds: 500),
                          height: mainController.isScrolling.value ? 0 : 24,
                          width: mainController.isScrolling.value ? 0 : 24,
                          child: Column(
                            children: [
                              Expanded(
                                  child: Icon(
                                    Icons.search,
                                    color: Style.black.withOpacity(
                                        mainController.isScrolling.value
                                            ? 0
                                            : 1),
                                  )),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          margin: EdgeInsets.only(
                              right: mainController.isScrolling.value
                                  ? 0
                                  : 16),
                          duration: const Duration(milliseconds: 500),
                          height: mainController.isScrolling.value ? 0 : 24,
                          width: mainController.isScrolling.value ? 0 : 24,
                          child: Column(children: [
                            Expanded(
                                child: Icon(
                                  Icons.notifications,
                                  color: Style.black.withOpacity(
                                      mainController.isScrolling.value ? 0 : 1),
                                ))
                          ]),
                        ),
                        AnimatedContainer(
                          margin: EdgeInsets.only(
                              right: 16,
                              bottom:
                              mainController.isScrolling.value ? 18 : 0,
                              left: mainController.isScrolling.value
                                  ? 18
                                  : 0),
                          duration: const Duration(milliseconds: 500),
                          height: mainController.isScrolling.value ? 0 : 24,
                          width: mainController.isScrolling.value ? 0 : 24,
                          child: Column(
                            children: const [
                              Expanded(child: Icon(Icons.person)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  childWhenDragging: const SizedBox.shrink(),
                  onDragEnd: (s) {

                      mainController.changeOffset(s.offset);
                  },
                  child: AnimatedContainer(
                    width: mainController.isScrolling.value ? 64 : 160,
                    height: 64,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(32)),
                    duration: const Duration(milliseconds: 500),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          margin: EdgeInsets.only(
                              right: mainController.isScrolling.value
                                  ? 0
                                  : 16),
                          duration: const Duration(milliseconds: 500),
                          height: mainController.isScrolling.value ? 0 : 24,
                          width: mainController.isScrolling.value ? 0 : 24,
                          child: Column(children: [
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.r),
                                  child: Icon(
                                    Icons.home,
                                    color: Style.black.withOpacity(
                                        mainController.isScrolling.value ? 0 : 1),
                                  ),
                                ))
                          ]),
                        ),
                        AnimatedContainer(
                          margin: EdgeInsets.only(
                              right: mainController.isScrolling.value
                                  ? 0
                                  : 16),
                          duration: const Duration(milliseconds: 500),
                          height: mainController.isScrolling.value ? 0 : 24,
                          width: mainController.isScrolling.value ? 0 : 24,
                          child: Column(
                            children: [
                              Expanded(
                                  child: Icon(
                                    Icons.search,
                                    color: Style.black.withOpacity(
                                        mainController.isScrolling.value
                                            ? 0
                                            : 1),
                                  )),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          margin: EdgeInsets.only(
                              right: mainController.isScrolling.value
                                  ? 0
                                  : 16),
                          duration: const Duration(milliseconds: 500),
                          height: mainController.isScrolling.value ? 0 : 24,
                          width: mainController.isScrolling.value ? 0 : 24,
                          child: Column(children: [
                            Expanded(
                                child: Icon(
                                  Icons.notifications,
                                  color: Style.black.withOpacity(
                                      mainController.isScrolling.value ? 0 : 1),
                                ))
                          ]),
                        ),
                        AnimatedContainer(
                          margin: EdgeInsets.only(
                              right: 16,
                              bottom:
                              mainController.isScrolling.value ? 18 : 0,
                              left: mainController.isScrolling.value
                                  ? 18
                                  : 0),
                          duration: const Duration(milliseconds: 500),
                          height: mainController.isScrolling.value ? 0 : 24,
                          width: mainController.isScrolling.value ? 0 : 24,
                          child: Column(
                            children: const [
                              Expanded(child: Icon(Icons.person)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                    )),
              ),
            )
          ],
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
