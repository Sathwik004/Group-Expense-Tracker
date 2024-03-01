import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_expense_tracker/models/my_drawer_button.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //width: width,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  size: 40,
                  Icons.monetization_on,
                ),
                const SizedBox(width: 10,),
                Text(
                  'Tracker',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            MyDrawerButton(iconData: Icons.watch_later_outlined, text: 'History', onpressed: (){}),
            MyDrawerButton(iconData: Icons.group, text: 'Friends', onpressed: (){}),
            MyDrawerButton(iconData: Icons.info_outline, text: 'Info', onpressed: (){}),
            MyDrawerButton(iconData: Icons.settings, text: 'Settings', onpressed: (){}),
            const Spacer(),
            MyDrawerButton(iconData: Icons.logout, text: 'Log Out', onpressed: () => FirebaseAuth.instance.signOut(),),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
