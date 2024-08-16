import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/utilities/side_nav_bar_item_color.dart';
import 'package:work_in_dashboard/model/nav_bar_model.dart';

class MobileSideNavBar extends StatefulWidget {
  const MobileSideNavBar({
    super.key,
    required this.navShell,
  });
  final StatefulNavigationShell navShell;
  @override
  State<MobileSideNavBar> createState() => _MobileSideNavBarState();
}

class _MobileSideNavBarState extends State<MobileSideNavBar> {
  int selectedIndex = -1;
  void changetBranch(int index) {
    widget.navShell.goBranch(index,
        initialLocation: index == widget.navShell.currentIndex);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: NavBarModel.navData.length,
        itemBuilder: (context, index) => InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                  changetBranch(NavBarModel.navData[index].index);
              },
              onHover: (value) {
                setState(() {
                  NavBarModel.navData[index].isHovered = value;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: 60,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: SideNavBarItemColor.itemColor(index, selectedIndex,
                        NavBarModel.navData[index].isHovered),
                    borderRadius: BorderRadius.circular(32)),
                child: NavBarModel.navData[index].icon,
              ),
            ));
  }
}
