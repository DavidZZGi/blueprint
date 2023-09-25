import 'package:blueprint/data/model/issue.dart';
import 'package:flutter/material.dart';

import '../../data/model/repo_model.dart';
import '../utils/const.dart';

class ListTileBody extends StatelessWidget {
  final Issue issue;
  const ListTileBody({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            issue.user.avatarUrl,
          ),
        ),
        title: Text(
          issue.title,
          style: TextStyle(
            color: Colors.grey.shade300,
          ),
        ),
        subtitle: Row(
          children: <Widget>[
            const Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(issue.user.login, style: const TextStyle(color: Colors.white))
          ],
        ),
        trailing: Text(
          issue.state,
          style: TextStyle(
            color: issue.state == 'open'
                ? Colors.greenAccent.shade400
                : Colors.red,
          ),
        ));
  }
}
