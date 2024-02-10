import 'package:flutter/material.dart';

class MyDrawerButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final void Function()? onpressed;
  const MyDrawerButton({super.key, required this.iconData, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(6.0),
      width: double.infinity,
      child: TextButton.icon(
        onPressed: onpressed,
        icon: Icon(
          iconData,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        label: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
  }
}
