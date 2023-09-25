import 'package:blueprint/data/model/user.dart';

abstract class IUserService{

  Future<User>getUser();
}