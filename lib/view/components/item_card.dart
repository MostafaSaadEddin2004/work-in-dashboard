import 'package:flutter/material.dart';
import 'package:work_in_dashboard/controller/style/app_color.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({
    super.key,
    required this.title,
    required this.icon,
    required this.circelColor,
    required this.subtitbitle,
  });
  final String title;
  final IconData icon;
  final Color circelColor;
  final String subtitbitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.secondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(
            width: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: circelColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(title),
            ],
          ),
          Text(
            'Annual $subtitbitle statistics.',
            style:
                TextStyle(fontSize: 14, color: AppColor.white.withOpacity(0.7)),
          )
        ],
      ),
    );
  }
}
