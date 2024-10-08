import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/bloc/job_services/job_services_cubit.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/gender.dart';
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
  final _companyEmail = TextEditingController();
  final _companyPhone = TextEditingController();
  final _jobTitle = TextEditingController();
  final _experiencesForJob = TextEditingController();
  final _workTime = TextEditingController();
  final _location = TextEditingController();
  int selectedGender = 1;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _companyName.dispose();
    _companyEmail.dispose();
    _companyPhone.dispose();
    _jobTitle.dispose();
    _experiencesForJob.dispose();
    _workTime.dispose();
    _location.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobServicesCubit, JobServicesState>(
      bloc: JobServicesCubit(),
      listener: (context, state) {
        if (state is JobServicesLoading) {
          isLoading = true;
        } else if (state is JobServicesSuccess) {
          isLoading = false;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.secondary),
              child: Column(
                crossAxisAlignment: Responsive.isDesktop(context)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_rounded)),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Create new job',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
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
                            return 'Company email field is required';
                          }
                          return null;
                        },
                        controller: _companyEmail,
                        hintText: 'Enter company email',
                        labelText: 'Company email',
                      ),
                      InfoTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Company phone field is required';
                          }
                          return null;
                        },
                        controller: _companyPhone,
                        hintText: 'Enter company phone',
                        labelText: 'Company phone',
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
                  Row(
                    children: [
                      AddButton(
                        text: 'Create',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<JobServicesCubit>().addJob(
                                context,
                                _companyName.text,
                                _companyEmail.text,
                                _companyPhone.text,
                                _jobTitle.text,
                                _experiencesForJob.text,
                                _workTime.text,
                                _location.text,
                                Gender.getGender(selectedGender));
                          }
                          GoRouter.of(context).pop();
                        },
                        isAddLoading: isLoading,
                        color: AppColor.blue,
                      ),
                      const SizedBox(width: 8),
                      AddButton(
                        text: 'Create & create another',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<JobServicesCubit>().addJob(
                                context,
                                _companyName.text,
                                _companyEmail.text,
                                _companyPhone.text,
                                _jobTitle.text,
                                _experiencesForJob.text,
                                _workTime.text,
                                _location.text,
                                Gender.getGender(selectedGender));
                          }
                        },
                        isAddLoading: isLoading,
                        color: AppColor.blue,
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }
}
