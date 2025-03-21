import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;
  final Widget? label;
  const StatCard({
    required this.title,
    required this.value,
    this.valueColor = Colors.black,
    this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 8 * 2,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 8 * 3,
              fontWeight: FontWeight.w600,
              color: (valueColor != null)
                  ? valueColor
                  : Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          label!,
        ],
      ),
    );
  }
}
