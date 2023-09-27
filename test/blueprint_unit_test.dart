import 'package:blueprint/app/utils/util_preferences.dart';
import 'package:blueprint/data/model/get_issues_params.dart';
import 'package:blueprint/data/repository/issue_repo.dart';
import 'package:blueprint/data/service/impl_issue_service.dart';
import 'package:blueprint/domain/issue/get_issues.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async{
  
   WidgetsFlutterBinding.ensureInitialized();
  final prefs = UtilPreferences();
  await prefs.initPrefs();
  String token='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';
  prefs.setGitHubToken=token;
  GetIssues getIssues=GetIssues(issueRepo: IssueRepo(issueService: IssueService()));
  test('getDataFromApi', () async {
    final response = await getIssues.call(NoParams());
      print('repos: ${response.repos}');
    print('user:  ${response.user}');
  });
}