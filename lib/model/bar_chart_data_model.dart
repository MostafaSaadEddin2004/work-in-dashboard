import 'package:work_in_dashboard/model/company_mode.dart';
import 'package:work_in_dashboard/model/job_model.dart';
import 'package:work_in_dashboard/model/training_model.dart';
import 'package:work_in_dashboard/model/user_model.dart';

class ChartData {
 final int userX;
  final int userY;
  final int companyX;
  final int companyY;
  final int jobX;
  final int jobY;
  final int trainingX;
  final int trainingY;

  ChartData(
      {required this.userX,
      required this.userY,
      required this.companyX,
      required this.companyY,
      required this.jobX,
      required this.jobY,
      required this.trainingX,
      required this.trainingY});

  static List<ChartData> monthlySummary(
      List<UserModel> userData,
      List<CompanyModel> companyData,
      List<JobModel> jobData,
      List<TrainingModel> trainingData) {
    return [
      ChartData(
        userX: 0,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.january)
            .toList()
            .length,
        companyX: 0,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.january)
            .toList()
            .length,
        jobX: 0,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.january)
            .toList()
            .length,
        trainingX: 0,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.january)
            .toList()
            .length,
      ),
      ChartData(
        userX: 1,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.february)
            .toList()
            .length,
        companyX: 1,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.february)
            .toList()
            .length,
        jobX: 1,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.february)
            .toList()
            .length,
        trainingX: 1,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.february)
            .toList()
            .length,
      ),
      ChartData(
        userX: 2,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.march)
            .toList()
            .length,
        companyX: 2,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.march)
            .toList()
            .length,
        jobX: 2,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.march)
            .toList()
            .length,
        trainingX: 2,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.march)
            .toList()
            .length,
      ),
      ChartData(
        userX: 3,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.april)
            .toList()
            .length,
        companyX: 3,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.april)
            .toList()
            .length,
        jobX: 3,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.april)
            .toList()
            .length,
        trainingX: 3,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.april)
            .toList()
            .length,
      ),
      ChartData(
        userX: 4,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.may)
            .toList()
            .length,
        companyX: 4,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.may)
            .toList()
            .length,
        jobX: 4,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.may)
            .toList()
            .length,
        trainingX: 4,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.may)
            .toList()
            .length,
      ),
      ChartData(
        userX: 5,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.june)
            .toList()
            .length,
        companyX: 5,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.june)
            .toList()
            .length,
        jobX: 5,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.june)
            .toList()
            .length,
        trainingX: 5,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.june)
            .toList()
            .length,
      ),
      ChartData(
        userX: 6,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.july)
            .toList()
            .length,
        companyX: 6,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.july)
            .toList()
            .length,
        jobX: 6,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.july)
            .toList()
            .length,
        trainingX: 6,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.july)
            .toList()
            .length,
      ),
      ChartData(
        userX: 7,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.august)
            .toList()
            .length,
        companyX: 7,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.august)
            .toList()
            .length,
        jobX: 7,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.august)
            .toList()
            .length,
        trainingX: 7,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.august)
            .toList()
            .length,
      ),
      ChartData(
        userX: 8,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.september)
            .toList()
            .length,
        companyX: 8,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.september)
            .toList()
            .length,
        jobX: 8,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.september)
            .toList()
            .length,
        trainingX: 8,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.september)
            .toList()
            .length,
      ),
      ChartData(
        userX: 9,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.october)
            .toList()
            .length,
        companyX: 9,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.october)
            .toList()
            .length,
        jobX: 9,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.october)
            .toList()
            .length,
        trainingX: 9,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.october)
            .toList()
            .length,
      ),
      ChartData(
        userX: 10,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.november)
            .toList()
            .length,
        companyX: 10,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.november)
            .toList()
            .length,
        jobX: 10,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.november)
            .toList()
            .length,
        trainingX: 10,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.november)
            .toList()
            .length,
      ),
      ChartData(
        userX: 11,
        userY: userData
            .where((element) => element.createdAt.month == DateTime.december)
            .toList()
            .length,
        companyX: 11,
        companyY: companyData
            .where((element) => element.createdAt.month == DateTime.december)
            .toList()
            .length,
        jobX: 11,
        jobY: jobData
            .where((element) => element.createdAt.month == DateTime.december)
            .toList()
            .length,
        trainingX: 11,
        trainingY: trainingData
            .where((element) => element.createdAt.month == DateTime.december)
            .toList()
            .length,
      ),
    ];
  }
}
