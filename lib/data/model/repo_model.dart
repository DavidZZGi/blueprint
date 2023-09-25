import 'package:blueprint/data/model/issue.dart';

class Repo {
  final String name;
  final String description;
  final List<Issue> issues;

  Repo({required this.name, required this.description, required this.issues});

 
}