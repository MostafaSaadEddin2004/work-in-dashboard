import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:work_in_dashboard/controller/bloc/training_services/training_services_cubit.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';
import 'package:work_in_dashboard/view/components/info_text_field.dart';

class UpdateTrainingScreen extends StatefulWidget {
  const UpdateTrainingScreen({
    super.key,
    required this.trainingId,
    required this.trainingCompany,
    required this.companyEmail,
    required this.companyPhone,
    required this.kindOfTrain,
    required this.location,
  });
  final String trainingId;
  final String trainingCompany;
  final String companyEmail;
  final String companyPhone;
  final String kindOfTrain;
  final String location;

  @override
  State<UpdateTrainingScreen> createState() => _UpdateTrainingScreenState();
}

class _UpdateTrainingScreenState extends State<UpdateTrainingScreen> {
  final _trainingCompany = TextEditingController();
  final _kindOfTrain = TextEditingController();
  final _companyEmail = TextEditingController();
  final _companyPhone = TextEditingController();
  final _location = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _trainingCompany.text = widget.trainingCompany;
    _companyEmail.text = widget.companyEmail;
    _companyPhone.text = widget.companyPhone;
    _kindOfTrain.text = widget.kindOfTrain;
    _location.text = widget.location;
  }

  @override
  void dispose() {
    super.dispose();
    _trainingCompany.dispose();
    _companyEmail.dispose();
    _companyPhone.dispose();
    _kindOfTrain.dispose();
    _location.dispose();
  }

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
                          'Update Training',
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
                              return 'Company name is required';
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
                              return 'Company email is required';
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
                              return 'Company phone is required';
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
                              return 'Kind of train is required';
                            }
                            return null;
                          },
                          controller: _kindOfTrain,
                          hintText: 'Enter kind oof train',
                          labelText: 'Kind of train',
                        ),
                        InfoTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Company location is required';
                            }
                            return null;
                          },
                          controller: _location,
                          hintText: 'Enter company location',
                          labelText: 'Company location',
                        ),
                      ],
                    ),
                    AddButton(
                      text: 'Save changes',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<TrainingServicesCubit>().updateTraining(
                                context,
                                widget.trainingId,
                                _trainingCompany.text,
                                _companyEmail.text,
                                _companyPhone.text,
                                _kindOfTrain.text,
                                _location.text,
                              );
                        }
                      },
                      isAddLoading: isLoading,
                      color: AppColor.blue,
                    )
                  ],
                )));
      },
    );
  }
}
