import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';

class UpdateTrainingScreen extends StatefulWidget {
  const UpdateTrainingScreen({super.key});

  @override
  State<UpdateTrainingScreen> createState() => _UpdateTrainingScreenState();
}

class _UpdateTrainingScreenState extends State<UpdateTrainingScreen> {
  final _trainingCompany = TextEditingController();
  final _kindOfTrain = TextEditingController();
  final _location = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.secondary),
            child: Column(
              crossAxisAlignment: Responsive.isDesktop(context)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  'Add new training',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(
                  height: 32,
                ),
                Wrap(
                  spacing: 32,
                  runSpacing: 16,
                  children: [
                    InfoTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Company location field is required';
                        }
                        return null;
                      },
                      controller: _trainingCompany,
                      hintText: 'Enter company name',
                      labelText: 'Company name',
                    ),
                    InfoTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Company location field is required';
                        }
                        return null;
                      },
                      controller: _kindOfTrain,
                      hintText: 'Enter job title',
                      labelText: 'Job title',
                    ),
                    InfoTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Company location field is required';
                        }
                        return null;
                      },
                      controller: _location,
                      hintText: 'Enter job title',
                      labelText: 'Job title',
                    ),
                  ],
                ),
                AddButton(
                  text: 'Add job',
                  onPressed: () {},
                  isAddLoading: isLoading,
                  color: AppColor.blue,
                )
              ],
            )));
  }
}
