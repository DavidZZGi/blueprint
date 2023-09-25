import 'package:blueprint/data/model/repo_model.dart';

abstract class IRepoService{
  Future<List<Repo>>getRepos(String username);
}