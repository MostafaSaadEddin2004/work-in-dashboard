import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_in_dashboard/controller/bloc/company_service/company_services_cubit.dart';
import 'package:work_in_dashboard/controller/bloc/job_services/job_services_cubit.dart';
import 'package:work_in_dashboard/controller/bloc/training_services/training_services_cubit.dart';
import 'package:work_in_dashboard/controller/bloc/user_service/user_service_cubit.dart';
import 'package:work_in_dashboard/controller/router/app_router.dart';
import 'package:work_in_dashboard/controller/theme/app_theme.dart';
import 'package:work_in_dashboard/model/http_override_model.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiBlocProvider(
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
    child: const Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(641, 1366),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: AppRoute.appGoRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
