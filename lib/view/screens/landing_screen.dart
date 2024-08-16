import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/controller/utilities/uri_path.dart';
import 'package:work_in_dashboard/view/components/desktop_side_nav_bar.dart';
import 'package:work_in_dashboard/view/components/logo_button.dart';
import 'package:work_in_dashboard/view/components/mobile_side_nav_bar.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key, required this.navShell});
  final StatefulNavigationShell navShell;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).fullPath!;
    final title = UriPath.getTitle(context, path);
    return Scaffold(
      key: _globalKey,
      backgroundColor: AppColor.primary,
      drawer: !Responsive.isDesktop(context)
          ? Drawer(
              width: 100.w,
              backgroundColor: AppColor.secondary,
              child: Column(
                children: [
                  const LogoButton(),
                  Expanded(
                      child: MobileSideNavBar(
                    navShell: widget.navShell,
                  )),
                ],
              ),
            )
          : const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                  flex: 1,
                  child: Container(
                      color: AppColor.secondary,
                      child: Column(
                        children: [
                          const LogoButton(),
                          const SizedBox(
                            height: 24,
                          ),
                          Expanded(
                              child: DesktopSideNavBar(
                            navShell: widget.navShell,
                          )),
                        ],
                      ))),
            Expanded(
                flex: 5,
                child: Container(
                  color: AppColor.primary,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      if (!Responsive.isDesktop(context))
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                icon: const Icon(Icons.menu),
                                onPressed: () {
                                  _globalKey.currentState?.openDrawer();
                                },
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                title,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              UriPath.getButtonTitle(context, path)
                            ],
                          ),
                        ),
                      widget.navShell
                    ],
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
