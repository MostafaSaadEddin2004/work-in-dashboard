import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:work_in_dashboard/controller/getx/side_navigation_bar_controller.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/view/components/desktop_side_nav_bar.dart';
import 'package:work_in_dashboard/view/components/mobile_side_nav_bar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final navController = Get.put(SideNavigationBarController());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AppColor.primary,
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _globalKey.currentState?.openDrawer();
                },
              ),
              title: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            )
          : const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      drawer: !Responsive.isDesktop(context)? Drawer(
        width: 100.w,
        backgroundColor: AppColor.secondary,
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            SizedBox(height: 60,width: 80,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                  onPressed: () {
                    _globalKey.currentState?.closeDrawer();
                  },
                  icon:   Image.asset('assets/images/workin-logo.png')),
            ),
            const Expanded(child: MobileSideNavBar()),
          ],
        ),
      ):const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            Expanded(
                flex: 1,
                child: Container(
                    color: AppColor.secondary,
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            height: 80.h,
                            width: 160.w,
                            child:
                                Image.asset('assets/images/workin-logo.png')),
                        const SizedBox(
                          height: 24,
                        ),
                        const Expanded(child: DesktopSideNavBar()),
                      ],
                    ))),
          Expanded(
              flex: 5,
              child: Container(
                color: AppColor.primary,
                child: SingleChildScrollView(
                    child: Obx(
                  () => navController.currentScreen,
                )),
              ))
        ],
      ),
    );
  }
}
