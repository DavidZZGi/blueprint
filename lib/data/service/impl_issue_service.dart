import 'dart:convert';

import 'package:blueprint/app/utils/const.dart';
import 'package:blueprint/app/utils/util_preferences.dart';
import 'package:blueprint/data/model/issue.dart';
import 'package:blueprint/data/model/repo_model.dart';
import 'package:blueprint/data/model/user.dart';
import 'package:blueprint/data/remote/http_exception.dart';
import 'package:blueprint/data/service/issue_service/interface_issue_service.dart';
import 'package:blueprint/data/service/repo_service/interface_repo_service.dart';
import 'package:blueprint/data/service/user_service/interface_user_service.dart';

import 'package:http/http.dart' as http;

import '../model/response_obeject.dart';
class IssueService implements IIssueServices,IRepoService,IUserService{
   HttHandlerException handlerException=HttHandlerException();
   final _prefs=UtilPreferences();

 Future<ResponseIntegration>fetchUserReposIssues()async{
  final user=await getUser();
  final repoList=await getRepos(user.login);
  ResponseIntegration responseIntegration =ResponseIntegration(repos: repoList, user: user);
  return responseIntegration;
 }

  @override
  Future<List<Issue>> getIssues(String userName, String repoName) async{
 final response = await http.get(
      Uri.parse('$baseUrlRepo/$userName/$repoName/issues?state=all'),
      headers: {
        'Authorization': 'token ${_prefs.getGithubToken}',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> issuesData = json.decode(response.body);
      final List<Issue> issues = [];

      for (final issueData in issuesData) { 
        issues.add(Issue.fromJson(issueData));
      }

      return issues;
    } else {
      throw Exception(handlerException.handleStatusCode(response.statusCode));
    }
  }

  @override
  Future<List<Repo>> getRepos(String username)async {
    final response = await http.get(
      Uri.parse('$baseUrlUsers/$username/repos'),
      headers: {
        'Authorization': 'Bearer ${_prefs.getGithubToken}',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> repositories = json.decode(response.body);
      final List<Repo> repos = [];

      for (int i=0;i<repositories.length;i++) {
        final repoTitle = repositories[i]['name'];
        final repoDescription = repositories[i]['description']??'';
        final issue = await getIssues(username,repoTitle);
          repos.add(Repo(name: repoTitle, description: repoDescription, issues: issue));
      }

      return repos;
    } else {
      throw Exception(handlerException.handleStatusCode(response.statusCode));
    }
  }

  @override
  Future<User> getUser()async {
 final response = await http.get(
      Uri.parse(baseUrlUser),
      headers: {
        'Authorization': 'token ${_prefs.getGithubToken}',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      return User(login: userData['login'], id: userData['id'], avatarUrl: userData['avatar_url']); 
       // 'login' es el campo que contiene el nombre de usuario
    } else {
      throw Exception(handlerException.handleStatusCode(response.statusCode));
    }
  }

 
    
  }





  
