import 'dart:io';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/controller/theme/app_theme.dart';
import 'package:work_in_dashboard/model/http_override_model.dart';
import 'package:work_in_dashboard/view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 819.5),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          routeInformationParser: BeamerParser(),
          routerDelegate: BeamerDelegate(
              transitionDelegate: const NoAnimationTransitionDelegate(),
              locationBuilder: RoutesLocationBuilder(routes: {
                BeamerNavItem.route: (context, state, data) => LayoutBuilder(
                    builder: (context, constraints) => const HomeScreen()),
              }).call)),
    );
  }
}
