import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Theme.of(context).primaryColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: OutlinedButton(onPressed: () async {
            var uri = Uri.parse('tel:18013582148');
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            } else {
              throw 'Could not launch $uri';
            }
          }, child: const Row(
            children: [
              Text("Call"),
              SizedBox(width: 8),
              Icon(Icons.phone)
            ],
          ),
          ),
        )
      ],
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      // elevation: 200,
      scrolledUnderElevation: 16,
      //surfaceTintColor: Theme.of(context).primaryColorLight,
      shadowColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}