import 'package:blueprint/data/model/issue.dart';
import 'package:blueprint/data/model/repo_model.dart';
import 'package:blueprint/data/model/response_obeject.dart';
import 'package:blueprint/data/service/impl_issue_service.dart';

 class IssueRepo{
IssueService issueService;
IssueRepo( {required this.issueService});

Future<ResponseIntegration>getAllIssuesWithinRepo()async{
 final response=await issueService.fetchUserReposIssues();
  return response;
}


}