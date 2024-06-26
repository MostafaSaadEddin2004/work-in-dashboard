import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';
import 'package:work_in_dashboard/view/components/add_button.dart';

class AddCard extends StatelessWidget {
  const AddCard(
      {super.key,
      required this.onCancelPressed,
      required this.onAddPressed,
      required this.onAddAnotherPressed,
      required this.fieldList,
      this.addMode = false});
  final void Function() onCancelPressed;
  final void Function() onAddPressed;
  final void Function() onAddAnotherPressed;
  final List<Widget> fieldList;
  final bool addMode;
  @override
  Widget build(BuildContext context) {
    if (addMode != false) {
      return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColor.secondary),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Add job',
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
                spacing: 50,
                runSpacing: 16,
                children: fieldList,
              ),
              Row(
                children: [
                  AddButton(
                    text: 'Add job',
                    onTap: onAddPressed,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  AddButton(
                    text: 'Add job and add another',
                    onTap: onAddAnotherPressed,
                  ),
                ],
              )
            ],
          ));
    }
    return const PreferredSize(preferredSize: Size.zero, child: SizedBox());
  }
}
