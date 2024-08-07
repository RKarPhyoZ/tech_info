import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinfo/util/extensions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: const Color(0xffFFFFFF),
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Language".tr),
            10.heightBox(),
            const Divider(),
            10.heightBox(),
            selectLanguage(() {}, "assets/flags/thailand.jpg", "Thailand".tr),
            30.heightBox(),
            selectLanguage(
                () {}, "assets/flags/united_state.jpg", "English".tr),
          ],
        ),
      ),
    );
  }

  Widget selectLanguage(Function onTap, String flag, String text) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 30,
              height: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(flag),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            20.widthBox(),
            Text(text),
          ],
        ),
      ),
    );
  }
}
