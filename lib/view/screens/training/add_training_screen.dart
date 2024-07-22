import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_in_dashboard/controller/bloc/training_services/training_services_cubit.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';

class AddTrainingScreen extends StatefulWidget {
  const AddTrainingScreen({super.key});

  @override
  State<AddTrainingScreen> createState() => _AddTrainingScreenState();
}

class _AddTrainingScreenState extends State<AddTrainingScreen> {
  final _trainingCompany = TextEditingController();
  final _kindOfTrain = TextEditingController();
  final _location = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrainingServicesCubit, TrainingServicesState>(
      bloc: TrainingServicesCubit(),
      listener: (context, state) {
        if (state is TrainingServicesLoading) {
          isLoading = true;
        } else if (state is TrainingServicesSuccess) {
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
                      text: 'Add Training',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<TrainingServicesCubit>().addTraining(
                              context,
                              _kindOfTrain.text,
                              _location.text,
                              _trainingCompany.text);
                        }
                      },
                      isAddLoading: isLoading,
                      color: AppColor.blue,
                    ),
                    AddButton(
                      text: 'Add & add another',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<TrainingServicesCubit>().addTraining(
                              context,
                              _kindOfTrain.text,
                              _location.text,
                              _trainingCompany.text);
                        }
                      },
                      isAddLoading: isLoading,
                      color: AppColor.blue,
                    ),
                  ],
                )));
      },
    );
  }
}
