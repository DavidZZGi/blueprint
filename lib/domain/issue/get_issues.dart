import 'package:blueprint/core/use_case.dart';
import 'package:blueprint/data/model/repo_model.dart';
import 'package:blueprint/data/repository/issue_repo.dart';

import '../../data/model/get_issues_params.dart';
import '../../data/model/response_obeject.dart';

class GetIssues implements UseCase<ResponseIntegration,NoParams>{
  IssueRepo issueRepo;
  GetIssues({
    required this.issueRepo
  });
  @override
  Future<ResponseIntegration> execute(NoParams noParams)=>issueRepo.getAllIssuesWithinRepo();
 

}