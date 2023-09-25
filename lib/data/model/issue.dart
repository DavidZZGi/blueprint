import 'package:blueprint/data/model/user.dart';

class Issue{
final  int id;
final  String state;
final String title;
final User user;
Issue(
  {required this.id,
  required this.state,
  required this.title,
  required this.user
});

factory Issue.fromJson(Map<String,dynamic>json){
  return 
  Issue(
    id: json['id']??0,
   state: json['state']??'',
    title: json['title']??'',
    user: User.fromJson(json['user']??User(login: '', id: 0, avatarUrl: ''))
    );
    
}

}