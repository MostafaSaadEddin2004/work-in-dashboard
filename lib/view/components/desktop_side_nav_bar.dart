import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/utilities/side_nav_bar_item_color.dart';
import 'package:work_in_dashboard/model/nav_bar_model.dart';

class DesktopSideNavBar extends StatefulWidget {
  const DesktopSideNavBar({super.key, required this.beam});
  final GlobalKey<BeamerState> beam;
  @override
  State<DesktopSideNavBar> createState() => _DesktopSideNavBarState();
}

class _DesktopSideNavBarState extends State<DesktopSideNavBar> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: NavBarModel.navData.length,
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.beam.currentState?.routerDelegate
                  .beamToNamed(NavBarModel.navData[index].nav);
            });
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
                    index,
                    selectedIndex,
                    NavBarModel.navData[index].isHovered),
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
