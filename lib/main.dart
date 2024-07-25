import 'dart:io';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/bloc/company_service/company_services_cubit.dart';
import 'package:work_in_dashboard/controller/bloc/job_services/job_services_cubit.dart';
import 'package:work_in_dashboard/controller/bloc/training_services/training_services_cubit.dart';
import 'package:work_in_dashboard/controller/bloc/user_service/user_service_cubit.dart';
import 'package:work_in_dashboard/controller/constants/nav_items.dart';
import 'package:work_in_dashboard/controller/theme/app_theme.dart';
import 'package:work_in_dashboard/model/http_override_model.dart';
import 'package:work_in_dashboard/view/screens/landing_screen.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final GlobalKey<BeamerState> beamerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserServiceCubit(),
        ),
        BlocProvider(
          create: (context) => CompanyServicesCubit(),
        ),
        BlocProvider(
          create: (context) => JobServicesCubit(),
        ),
        BlocProvider(
          create: (context) => TrainingServicesCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 819.5),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            routeInformationParser: BeamerParser(),
            routerDelegate: BeamerDelegate(
              locationBuilder: RoutesLocationBuilder(
              routes: {
              BeamerNavItem.route: (context, state, data) => BeamPage(
                key: ValueKey(BeamerNavItem.routeKey),
                type: BeamPageType.slideTopTransition,
                child: const LandingScreen()),
            }).call)),
      ),
    );
  }
}
