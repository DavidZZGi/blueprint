import 'package:blueprint/app/utils/util_preferences.dart';
import 'package:blueprint/core/blocs/bloc/issue_bloc.dart';
import 'package:blueprint/data/repository/issue_repo.dart';
import 'package:blueprint/data/service/impl_issue_service.dart';
import 'package:blueprint/domain/issue/get_issues.dart';
import 'package:blueprint/presentation/list_screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/utils/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UtilPreferences();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IssueBloc(GetIssues(issueRepo: IssueRepo(issueService: IssueService()))),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BluePrint',
        theme: ThemeData(
          primaryColor: primaryColor),
        home: const ListScreen(),
      ),
    );
  }
}
