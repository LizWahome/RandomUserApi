import 'package:random_api_one/models/randomuser_model.dart';
import 'package:random_api_one/models/username_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  Future<List<User>> fetchUsers() async {
    print("Api called");
    const url = "https://randomuser.me/api/?results=10";
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final body = res.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final transformed = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final location = Location(
          street: Street(
              name: e['location']['street']['name'],
              number: e['location']['street']['number']),
          coordinates: Coordinates(
              latitude: e['location']['coordinates']['latitude'],
              longitude: e['location']['coordinates']['longitude']),
          timezone: Timezone(
              offset: e['location']['timezone']['offset'],
              description: e['location']['timezone']['description']),
          city: e['location']['city'],
          country: e['location']['country'],
          postcode: e['location']['postcode'].toString(),
          state: e['location']['state']);
      final date = e['dob']['date'];
      final dob = DoB(date: DateTime.parse(date), age: e['dob']['age']);
      return User(
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          name: name,
          location: location,
          dob: dob);
    }).toList();
    print("Users fetched");
    return transformed;
  }
}
