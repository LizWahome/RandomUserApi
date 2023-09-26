import 'package:random_api_one/models/username_model.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final UserName name;
  final Location location;
  final DoB dob;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.name,
    required this.location,
    required this.dob
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}

class Street {
  final int number;
  final String name;

  Street({required this.name, required this.number});
}

class Location {
  final Street street;
  final Coordinates coordinates;
  final Timezone timezone;
  final String city;
  final String state;
  final String country;
  final String postcode;

  Location(
      {required this.street,
      required this.coordinates,
      required this.timezone,
      required this.city,
      required this.country,
      required this.postcode,
      required this.state});
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});
}

class Timezone {
  final String offset;
  final String description;

  Timezone({required this.offset, required this.description});
}

class DoB {
  final DateTime date;
  final int age;

  DoB({required this.date, required this.age});
}
