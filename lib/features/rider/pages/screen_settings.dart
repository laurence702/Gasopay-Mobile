import 'package:flutter/material.dart';
import 'package:project_wee/widgets/app_list_item.dart';

class RiderSettingsPage extends StatelessWidget {
  const RiderSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
            ),
            const Text(
              'user.name',
              style: TextStyle(fontSize: 8 * 2.5, fontWeight: FontWeight.bold),
            ),
            const Text(
              'user.email',
              style: TextStyle(fontSize: 8 * 2),
            ),
            const SizedBox(height: 30),
            ListItemCategory(
              title: 'Settings',
              items: [
                AppListItem(
                  title: 'Push Notifications',
                  onTap: () => debugPrint('wee'),
                  listItemType: AppListItemType.toggle,
                  icon: Icons.notifications,
                ),
                AppListItem(
                  title: 'Talk to us',
                  icon: Icons.call,
                  onTap: () => debugPrint('wee'),
                ),
                AppListItem(
                  title: 'Log out',
                  iconColor: Colors.red,
                  icon: Icons.exit_to_app,
                  onTap: () => debugPrint('wee'),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
