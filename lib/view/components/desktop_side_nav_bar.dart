import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_in_dashboard/controller/getx/side_navigation_bar_controller.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/side_nav_bar_item_color.dart';
import 'package:work_in_dashboard/model/nav_bar_model.dart';

class DesktopSideNavBar extends StatefulWidget {
  const DesktopSideNavBar({super.key});

  @override
  State<DesktopSideNavBar> createState() => _DesktopSideNavBarState();
}

class _DesktopSideNavBarState extends State<DesktopSideNavBar> {
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
    return ListView.builder(
      itemCount: navData.length,
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            navController.changeScreen(index);
          },
          onHover: (value) {
            setState(() {
              navData[index].isHovered = value;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
            margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: SideNavBarItemColor.itemColor(index,
                    navController.currentIndex.value, navData[index].isHovered),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: navData[index].icon,
                ),
                Text(
                  navData[index].title,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          )
          // ListTile(
          //   tileColor: selectedIndex == index
          //       ? navData[index].activeColor
          //       : navData[index].unactiveColor,
          //   leading: navData[index].icon,
          //   title: Text(
          // navData[index].title,
          // style: Theme.of(context).textTheme.bodySmall,
          //   ),
          // ),
          ),
    );
  }
}
