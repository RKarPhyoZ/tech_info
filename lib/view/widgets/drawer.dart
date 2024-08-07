import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinfo/service/local_storage_service.dart';
import 'package:techinfo/util/common.dart';
import 'package:techinfo/util/extensions.dart';

import '../../util/app_localization.dart';

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
            selectLanguage(() {
              Get.updateLocale(Locale(AppLanguages.th.name));
              LocalStorageServices.setLanguage("th");
            }, "assets/flags/thailand.jpg", "Thailand".tr,
                LocalStorageServices.getLanguage() == "th"),
            30.heightBox(),
            selectLanguage(() {
              Get.updateLocale(Locale("${AppLanguages.th.name}-us"));
              LocalStorageServices.setLanguage("${AppLanguages.en.name}-us");
            }, "assets/flags/united_state.jpg", "English".tr,
                LocalStorageServices.getLanguage() == "en-us"),
          ],
        ),
      ),
    );
  }

  Widget selectLanguage(
      Function() onTap, String flag, String text, bool isSelected) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isSelected ? Colors.grey.withOpacity(0.2) : Colors.transparent,
        padding: const EdgeInsets.all(10),
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
            10.widthBox(),
            Text(text),
          ],
        ),
      ),
    );
  }
}
