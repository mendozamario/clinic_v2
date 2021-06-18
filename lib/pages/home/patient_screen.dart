import 'package:clinic/pages/patient/add_edit_patient_screen.dart';
import 'package:clinic/pages/patient/consult_patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:clinic/models/patient.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatientScreen extends StatefulWidget {
  final String profilePicture;
  final List<Patient> patients;
  PatientScreen({Key key, this.profilePicture, this.patients}) : super(key: key);

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Pacientes",
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
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: 10
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.profilePicture),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: listPatientsCards(context),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: FaIcon(FontAwesomeIcons.plus, color: Colors.black,),
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => AddEditPatient(title: "Añadir paciente")
            )
          );
        },
      ),
    );
  }

  
  Widget patientCard(int index) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ConsultPatientScreen(patient: widget.patients[index],)
          )
        );
      },
      child: Card(    
        color: stateColor(index),
        elevation: 5,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(widget.patients[index].picture),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 2
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.patients[index].fullName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'C.C. ' + widget.patients[index].id.toString(),
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Text(
                    'Tel. ' + widget.patients[index].phone.toString(),
                    style: TextStyle(
                      fontSize: 16
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listPatientsCards(BuildContext context) {
    return ListView.builder(
      itemCount: widget.patients.length,
      itemBuilder: (context, index) {
        return patientCard(index);
      },
    );
  }

  Color stateColor(int index) {
    if (widget.patients[index].state == true){
      return Color(0xFFc2f8cb);
    } else {
      return Color(0xFFffa9a3);
    }
  }
}


