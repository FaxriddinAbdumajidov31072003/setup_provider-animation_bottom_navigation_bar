import 'package:flutter/material.dart';

import '../../style/style.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "No Internet",
          style: Style.bold(),
        ),
      ),
    );
  }
}
