import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitWave(
      color: AppColor.white,
      duration: Duration(seconds: 2),
      type: SpinKitWaveType.center,itemCount: 5,size: 15,
    );
  }
}
