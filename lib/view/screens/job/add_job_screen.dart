import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/api/services/job_services.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';
import 'package:work_in_dashboard/view/components/gender_radio_buttons.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({super.key});

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final _companyName = TextEditingController();
  final _jobTitle = TextEditingController();
  final _experiencesForJob = TextEditingController();
  final _workTime = TextEditingController();
  final _location = TextEditingController();
  int selectedGender = 1;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
                'Add new job',
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
                        return 'Company name field is required';
                      }
                      return null;
                    },
                    controller: _companyName,
                    hintText: 'Enter company name',
                    labelText: 'Company name',
                  ),
                  InfoTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Job title field is required';
                      }
                      return null;
                    },
                    controller: _jobTitle,
                    hintText: 'Enter job title',
                    labelText: 'Job title',
                  ),
                  InfoTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required experiences field is required';
                      }
                      return null;
                    },
                    controller: _experiencesForJob,
                    hintText: 'Enter required experiences',
                    labelText: 'Required experiences',
                  ),
                  InfoTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Work time field is required';
                      }
                      return null;
                    },
                    controller: _workTime,
                    hintText: 'Enter work time',
                    labelText: 'WorkTime',
                  ),
                  InfoTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Company location field is required';
                      }
                      return null;
                    },
                    controller: _location,
                    hintText: 'Enter company location',
                    labelText: 'Company location',
                  ),
                  GenderRadioButton(
                    selectedRadio: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  )
                ],
              ),
              AddButton(
                text: 'Add job',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    await JobServices.addJob(
                        companyName: _companyName.text,
                        jobTitle: _jobTitle.text,
                        experiencesForJob: _experiencesForJob.text,
                        workTime: _workTime.text,
                        companyNav: _location.text,
                        gender: selectedGender == 1 ? 'Male' : 'Female');
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                isAddLoading: isLoading,
                color: AppColor.blue,
              )
            ],
          )),
    );
  }
}
