import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ListItemCategory extends StatelessWidget {
  final String? title;
  final List<AppListItem> items;
  const ListItemCategory({
    this.title,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            color: AppColors.lightCard,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }
}

class AppListItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback onTap;
  final AppListItemType listItemType;

  const AppListItem({
    required this.title,
    this.icon,
    this.iconColor,
    required this.onTap,
    this.listItemType = AppListItemType.button,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon!,
                color: iconColor,
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
                child: Text(
              title,
              style: const TextStyle(
                fontSize: 8 * 2,
                fontWeight: FontWeight.w600,
              ),
            )),
            const SizedBox(width: 8),
            switch (listItemType) {
              AppListItemType.button => const Icon(
                  Icons.arrow_right_rounded,
                  size: 8 * 2,
                ),
              AppListItemType.toggle => Switch(
                  value: false,
                  onChanged: (v) {},
                ),
            }
          ],
        ),
      ),
    );
  }
}

enum AppListItemType {
  button,
  toggle,
}
