import 'dart:convert';
import 'package:clinic/models/user.dart';
import 'package:clinic/pages/login/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

String url = "https://clinic-mm.000webhostapp.com/userList.php";

Future<dynamic> _getUsers() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print("Error: Response incorrect");
  }
}

class getUsers extends StatelessWidget {
  const getUsers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: _getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot);
            return LoginScreen(
              users: userList(snapshot.data),
            );
          } else {
            print("No have information");
            return Text("Not Data");
          }
        },
        initialData: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

List<User> userList(List<dynamic> info) {
  List<User> users = [];

  info.forEach((element) {
    User user = new User(
        username: element["username"],
        password: element["password"],
        email: element["email"],
        profilePicture: element["profile_picture"]);

    users.add(user);
  });

  return users;
}
