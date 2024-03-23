import 'package:flutter/material.dart';
import 'package:tasks/models/user.dart';
import 'package:tasks/utils/constants.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: kAccentColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    users[4].imageUrl ?? '',
                  ),
                ),
                mediumSizedBoxSizeHeight,
                Text(
                  'Hello, ${users[4].name}!',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              'Back to home screen',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: Text(
              'Close',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
