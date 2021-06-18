import 'package:clinic/data/care_staff_data.dart';
import 'package:clinic/data/patient_data.dart';
import 'package:clinic/models/appoiment.dart';
import 'package:clinic/models/patient.dart';
import 'package:clinic/models/user.dart';
import 'package:clinic/pages/home/care_staff_screen.dart';
import 'package:clinic/pages/home/patient_screen.dart';
import 'package:clinic/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget {
  User user;
  HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Citas",
          style: TextStyle(
            color: Colors.black   
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => LoginScreen()
                )
              );
            },
          )
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.dehaze_rounded),
              color: Colors.black,
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: Drawer(
        elevation: 5,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.profilePicture),
                    radius: 55,
                  ),
                  Text(
                    widget.user.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("Pacientes"),
              leading: FaIcon(FontAwesomeIcons.userInjured),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => GetPatients(profilePicture: widget.user.profilePicture,),
                  )  
                );
              },
            ),
            ListTile(
              title: Text("Personal de Apoyo"),
              leading: FaIcon(FontAwesomeIcons.hospitalUser),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => GetCareStaff(profilePicture: widget.user.profilePicture)
                  )
                );
              },
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: listAppoimentsCards(context),
      ),
    );
  }

  Widget appoimentCard(int index) {
    return Card(
      color: chekedColor(index),
      elevation: 5,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              appoiments[index].code,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
          ),
          SizedBox(
            width: 10
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Nombre: " + "Mario Mendoza",
                ),
                Text(
                  "Especialidad: " + appoiments[index].type
                ),
                Text(
                  "Fecha: " + appoiments[index].date
                ),
                Text(
                  "Sala: " + appoiments[index].room
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listAppoimentsCards(BuildContext context) {
    return ListView.builder(
      itemCount: appoiments.length,
      itemBuilder: (context, index) {
        return appoimentCard(index);
      },
    );
  }
}


Color chekedColor(int index) {
  if (appoiments[index].cheked == true) {
    return Color(0xFFc2f8cb);
  } else {
    return Color(0xFFffa9a3);
  }
}
