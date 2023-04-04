import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              // you can change the icon widget by userPicture
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            accountName: Text("Account Name"),
            accountEmail: null),
        ListTile(
          onTap: () {
            // TODO : setting function
          },
          leading: const Icon(Icons.settings),
          title: const Text("Setting"),
        ),
        ListTile(
          onTap: () {
            // TODO : send feedback function
          },
          leading: const Icon(Icons.feedback),
          title: const Text("Send Feedback"),
        ),
        ListTile(
          onTap: () {
            // TODO : help function
          },
          leading: const Icon(Icons.help),
          title: const Text("Help"),
        ),
        ListTile(
          onTap: () {
            // TODO : logout function
          },
          leading: const Icon(Icons.logout),
          title: const Text("logout"),
        ),
      ],
    );
  }
}

