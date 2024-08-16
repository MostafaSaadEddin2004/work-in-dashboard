import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/utilities/side_nav_bar_item_color.dart';
import 'package:work_in_dashboard/controller/utilities/uri_path.dart';
import 'package:work_in_dashboard/model/nav_bar_model.dart';

class DesktopSideNavBar extends StatefulWidget {
  const DesktopSideNavBar({
    super.key,
    required this.navShell,
  });
  final StatefulNavigationShell navShell;
  @override
  State<DesktopSideNavBar> createState() => _DesktopSideNavBarState();
}

class _DesktopSideNavBarState extends State<DesktopSideNavBar> {
  void changetBranch(int index) {
    widget.navShell.goBranch(index,
        initialLocation: index == widget.navShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).fullPath!;
    int selectedIndex = UriPath.getNav(context, path);

    return ListView.builder(
      itemCount: NavBarModel.navData.length,
      itemBuilder: (context, index) => InkWell(
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
            margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: SideNavBarItemColor.itemColor(
                    index, selectedIndex, NavBarModel.navData[index].isHovered),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: NavBarModel.navData[index].icon,
                ),
                Text(
                  NavBarModel.navData[index].title,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          )),
    );
  }
}
