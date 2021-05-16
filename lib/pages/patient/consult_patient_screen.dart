import 'package:clinic/models/patient.dart';
import 'package:flutter/material.dart';

import 'add_edit_patient_screen.dart';

class ConsultPatientScreen extends StatefulWidget {
  Patient patient;
  ConsultPatientScreen({Key key, this.patient}) : super(key: key);

  @override
  _ConsultPatientScreenState createState() => _ConsultPatientScreenState();
}

class _ConsultPatientScreenState extends State<ConsultPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.patient.fullName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: buildPatient(widget.patient),
      ),
    );
  }

  Widget buildPatient(Patient patient) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 7,
              bottom: 20
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(patient.picture),
              radius: 90,
            ),
          ),
          buildText("Identificación: ", patient.id),
          buildText("Nombre: ", patient.fullName),
          buildText("Fecha de nacimiento: ", patient.birthDate),
          buildText("Edad: ", patient.age.toString()),
          buildText("Dirección: ", patient.adress),
          buildText("Barrio: ", patient.neighborhood),
          buildText("Ciudad: ", patient.city),
          buildText("Número telefonico: ", patient.phone.toString()),
          buildButtons(),
        ],
      ),
    );
  }

  Widget buildText(String title, String variable) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      child: Row(
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
          Text(
            variable,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
            ),
          )
        ]
      ),
    );
  }

  Widget buildButtons() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 20
      ),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              elevation: 5,
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 30
              )
            ),
            child: Text(
              "Eliminar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            onPressed: () => null,
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              elevation: 5,
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 40
              )
            ),
            child: Text(
              "Editar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => AddEditPatient(title: "Editar paciente", patient: widget.patient,)
                )
              );
            },
          )
        ],
      ),
    );
  }
}
