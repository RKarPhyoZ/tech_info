import 'package:flutter/material.dart';
import 'package:techinfo/util/common.dart';
import 'package:techinfo/view/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
