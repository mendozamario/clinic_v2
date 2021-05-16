import 'package:clinic/models/appoiment.dart';
import 'package:clinic/models/patient.dart';
import 'package:flutter/material.dart';

class AppoimentScreen extends StatefulWidget {
  AppoimentScreen({Key key}) : super(key: key);

  @override
  _AppoimentScreenState createState() => _AppoimentScreenState();
}

class _AppoimentScreenState extends State<AppoimentScreen> {
  @override
  Widget build(BuildContext context) {
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
                  "Nombre: " + consultPatient(appoiments[index].patientId).fullName,
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

Patient consultPatient(String id) {
  return patients.firstWhere((patient) => patient.id == id);
}

Color chekedColor(int index) {
  if (appoiments[index].cheked == true) {
    return Color(0xFFc2f8cb);
  } else {
    return Color(0xFFffa9a3);
  }
}