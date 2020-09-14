import '../model/users.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<User> users = usersFromJson(response.body);
        return users;
      } else if (400 == response.statusCode) {
        print("Bad request");
      } else {
        return List<User>();
      }
    } catch (e) {
      return List<User>();
    }
  }
}
