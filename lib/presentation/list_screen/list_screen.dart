import 'package:blueprint/app/utils/const.dart';

import 'package:flutter/material.dart';

import '../../app/widgets/export_widget.dart';



class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      appBar: TopBar(title: 'Github Issues'),
      body: BodyWidget(),
    );
  }
}