import  'package:shared_preferences/shared_preferences.dart';

class UtilPreferences {
  static final UtilPreferences _instance = UtilPreferences._internal();


  factory UtilPreferences() {
    return _instance;
  }

  UtilPreferences._internal();

  SharedPreferences ? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get getGithubToken =>_prefs!.getString('githubToken');
  set setGitHubToken(String gitHubToken){
      _prefs!.setString('githubToken', gitHubToken);
  }
}