import 'package:clinic/models/user.dart';
import 'package:clinic/pages/home/appoiment_screen.dart';
import 'package:flutter/material.dart';
import 'package:clinic/pages/home/home_screen.dart';

class BodyLogin extends StatefulWidget {
  final List<User> users;
  BodyLogin({Key key, this.users}) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.4),
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 100, horizontal: 70),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Inicio de Sesión".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 350),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        buildTextField("Nombre de usuario", Icon(Icons.people),
                            usernameController, false),
                        buildTextField("Contraseña", Icon(Icons.vpn_key),
                            passwordController, true),
                        buildButton(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(String title, Icon icon,
      TextEditingController controller, bool obscureText) {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black)),
          labelText: title,
          prefixIcon: icon,
        ),
        obscureText: obscureText,
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              child: ElevatedButton(
                onPressed: () {
                  validateCredentials(usernameController.text,
                      passwordController.text, context, widget.users);
                },
                child: Text(
                  "Iniciar Sesión".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 60)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppoimentScreen()));
                },
                child: Text(
                  "Invitado".toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade50,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 60)),
              ),
            )
          ],
        ));
  }

  void validateCredentials(String username, String password,
      BuildContext context, List<User> users) {
    var user = users.firstWhere(
        (user) => user.username == username && user.password == password);
    if (user != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    user: user,
                  )));
    } else {
      print('No se encontro el usuario');
    }
  }
}
