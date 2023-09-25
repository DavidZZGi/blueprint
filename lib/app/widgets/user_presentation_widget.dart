import 'package:blueprint/data/model/issue.dart';
import 'package:flutter/material.dart';

import '../../data/model/repo_model.dart';
import '../../data/model/user.dart';
import '../utils/const.dart';

class UserPresentation extends StatelessWidget {
  final User user;
  const UserPresentation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.avatarUrl,
                ),
              ),
              title: Text(
                'Username: ${user.login}',
                style: TextStyle(
                  color: Colors.grey.shade300,
                ),
              ),
            )));
  }
}
