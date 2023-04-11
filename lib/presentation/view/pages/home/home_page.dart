import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:setup_provider/application/main_controller.dart';
import 'package:setup_provider/presentation/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  final mainController = Get.put(MainController());



  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(listen);
    super.initState();
  }


  void listen() {
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      mainController.changeScroll(true);
    } else if (direction == ScrollDirection.forward) {
      mainController.changeScroll(false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          controller: _scrollController,
            itemCount: 50,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  index.toString(),
                  style: Style.bold(),
                ),
              );
            }));
  }
}
