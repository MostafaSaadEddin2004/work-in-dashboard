import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/utilities/side_nav_bar_item_color.dart';
import 'package:work_in_dashboard/model/nav_bar_model.dart';

class MobileSideNavBar extends StatefulWidget {
  const MobileSideNavBar({super.key, required this.beam});
  final GlobalKey<BeamerState> beam;
  @override
  State<MobileSideNavBar> createState() => _MobileSideNavBarState();
}

class _MobileSideNavBarState extends State<MobileSideNavBar> {
  int selectedIndx = -1;
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
                  selectedIndx = index;
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
                width: 60,
                height: 40,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: SideNavBarItemColor.itemColor(index, selectedIndx,
                        NavBarModel.navData[index].isHovered),
                    borderRadius: BorderRadius.circular(32)),
                child: NavBarModel.navData[index].icon,
              ),
            ));
  }
}
