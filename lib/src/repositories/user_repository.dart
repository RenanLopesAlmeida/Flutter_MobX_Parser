import 'package:flutter_auth/src/models/user_model.dart';
import 'package:flutter_auth/src/repositories/parse_errors.dart';
import 'package:flutter_auth/src/repositories/parse_table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepository {
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser
      ..set<String>(keyUserName, user.nickname)
      ..set<String>(keyUserPhone, user.phone)
      ..set<int>(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return mapParseToUser(parseUser);
    } else {
      return Future.error(response.error.message);
    }
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      nickname: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      phone: parseUser.get(keyUserPhone),
      type: UserType.values[parseUser.get(keyUserType)],
    );
  }
}
