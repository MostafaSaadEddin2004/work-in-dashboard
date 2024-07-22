import 'dart:ui';

import 'package:work_in_dashboard/controller/style/app_color.dart';

abstract class SideNavBarItemColor {
  static Color itemColor(
    int index,
    int selectedIndex,
    bool isHovered,
  ) {
    if (index != selectedIndex) {
      if (isHovered == true) {
        return AppColor.blue.withOpacity(0.5);
      } else {
        return AppColor.primary;
      }
    } else {
      return AppColor.blue;
    }
    
  }
}
