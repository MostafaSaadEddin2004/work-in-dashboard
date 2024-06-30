import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_in_dashboard/controller/getx/side_navigation_bar_controller.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/side_nav_bar_item_color.dart';
import 'package:work_in_dashboard/model/nav_bar_model.dart';

class MobileSideNavBar extends StatefulWidget {
  const MobileSideNavBar({super.key});

  @override
  State<MobileSideNavBar> createState() => _MobileSideNavBarState();
}

class _MobileSideNavBarState extends State<MobileSideNavBar> {
  final List<NavBarModel> navData = [
    NavBarModel(
        title: 'Users',
        icon: const Icon(
          Icons.person,
          color: AppColor.white,
          size: 25,
        ),
        isHovered: false,
        activeColor: AppColor.blue,
        unactiveColor: AppColor.primary),
    NavBarModel(
        title: 'Companies',
        icon: const Icon(
          Icons.business_rounded,
          color: AppColor.white,
          size: 25,
        ),
        isHovered: false,
        activeColor: AppColor.blue,
        unactiveColor: AppColor.primary),
    NavBarModel(
        title: 'Jobs',
        icon: const Icon(
          Icons.business_center_rounded,
          color: AppColor.white,
          size: 25,
        ),
        isHovered: false,
        activeColor: AppColor.blue,
        unactiveColor: AppColor.primary),
    NavBarModel(
        title: 'Training',
        icon: const Icon(
          Icons.accessibility_new_sharp,
          color: AppColor.white,
          size: 25,
        ),
        isHovered: false,
        activeColor: AppColor.blue,
        unactiveColor: AppColor.primary),
  ];
  final navController = Get.put(SideNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          itemCount: navData.length,
          itemBuilder: (context, index) => InkWell(
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  navController.changeScreen(index);
                },
                onHover: (value) {
                  setState(() {
                    navData[index].isHovered = value;
                  });
                },
                child: Obx(
                  ()=> AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    width: 60,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: SideNavBarItemColor.itemColor(
                            index,
                            navController.currentIndex.value,
                            navData[index].isHovered),
                        borderRadius: BorderRadius.circular(32)),
                    child: navData[index].icon,
                  ),
                ),
              )),
    );
  }
}
