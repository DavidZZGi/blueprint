import 'package:blueprint/data/model/issue.dart';

abstract class IIssueServices{
  Future <List<Issue>>getIssues(String userName,String repoName);
}