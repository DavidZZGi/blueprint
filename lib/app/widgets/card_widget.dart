import 'package:blueprint/data/model/issue.dart';
import 'package:flutter/material.dart';

import '../../data/model/repo_model.dart';
import 'list_tile_body.dart';

class CardBody extends StatelessWidget {
  final Issue? issue;
  const CardBody({super.key, this.issue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 8.0,
        color: const Color.fromRGBO(64, 75, 96, 0.939),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: ListTileBody(issue: issue!),
      ),
    );
  }
}
