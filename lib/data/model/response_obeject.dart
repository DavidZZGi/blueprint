import 'package:blueprint/data/model/issue.dart';
import 'package:blueprint/data/model/repo_model.dart';
import 'package:blueprint/data/model/user.dart';

class ResponseIntegration{
 final User user;
 final List<Repo>repos;

 ResponseIntegration({
  required this.repos,
  required this.user
 });
  
  


}