import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/controller/utilities/screen_size.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';

class AddCard extends StatelessWidget {
  const AddCard(
      {super.key,
      this.onCancelPressed,
      required this.onAddPressed,
      required this.fieldList,
      this.isAddLoading = false,
      required this.label});
  final void Function()? onCancelPressed;
  final void Function() onAddPressed;
  final List<Widget> fieldList;
  final bool isAddLoading;
  final String label;

  @override
  Widget build(BuildContext context) {
      return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
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
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                      onPressed: onCancelPressed,
                      icon: const Icon(Icons.close_rounded))
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Wrap(
                spacing: 32,
                runSpacing: 16,
                children: fieldList,
              ),
              AddButton(
                text: 'Add job',
                onPressed: onAddPressed,
                isAddLoading: isAddLoading,
                color: AppColor.blue,
              )
            ],
          ));
  }
}
