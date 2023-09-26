import 'package:flutter/material.dart';

import 'package:random_api_one/models/randomuser_model.dart';
import 'package:random_api_one/services/randomuser_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest Api Call"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.network(users[index].),
              // ),
              title: Text(
                users[index].fullName,
              ),
              subtitle: Text(users[index].dob.age.toString()),
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    final respose = await UserApi().fetchUsers();
    setState(() {
      users = respose;
    });
  }
}
