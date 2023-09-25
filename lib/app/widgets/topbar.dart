import 'package:blueprint/app/utils/const.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TopBar({super.key,required this.title
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
       elevation: 0.1,
      backgroundColor: primaryColor,
      title: Center(child: Text(title)),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {},
        ),
      ]
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
}