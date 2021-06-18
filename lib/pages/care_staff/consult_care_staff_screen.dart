import 'package:clinic/data/care_staff_data.dart';
import 'package:clinic/models/careStaff.dart';
import 'package:flutter/material.dart';

import 'add_edit_care_staff_screen.dart';

class ConsultCareStaffScreen extends StatefulWidget {
  final CareStaff careStaff;
  ConsultCareStaffScreen({Key key, this.careStaff}) : super(key: key);

  @override
  _ConsultCareStaffScreenState createState() => _ConsultCareStaffScreenState();
}

class _ConsultCareStaffScreenState extends State<ConsultCareStaffScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.careStaff.fullName,
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
        child: buildPatient(widget.careStaff),
      ),
    );
  }

  Widget buildPatient(CareStaff careStaff) {
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
              backgroundImage: NetworkImage(careStaff.picture),
              radius: 90,
            ),
          ),
          buildText("Identificación: ", careStaff.id, Colors.black),
          buildText("Nombre: ", careStaff.fullName, Colors.black),
          buildText("Epecialidad: ", careStaff.type, Colors.black),
          buildState(careStaff.state),
          buildWorking(careStaff.working),
          buildButtons(),
        ],
      ),
    );
  }

  Widget buildText(String title, String variable, Color color) {
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
            onPressed: () => {
              deleteCareStaffMethod()
            },
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
                  builder: (context) => AddEditCareStaffScreen(title: "Editar personal", careStaff: widget.careStaff),
                )
              );
            },
          )
        ],
      ),
    );
  }

  void deleteCareStaffMethod() {
    showDialog(
      context: context, 
      builder: (_) =>
        AlertDialog(
          title: Text("Eliminar"),
          content: Text("Esta seguro que desea eliminar al paciente " + widget.careStaff.fullName),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Cancelar")
            ),
            TextButton( 
              onPressed: (){          
                deleteCareStaff(widget.careStaff.id);
                Navigator.of(context).pop();
              }, 
              child: Text("Eliminar", style: TextStyle(color: Colors.red),)
            )
          ],
        )
    );
  }
}

Widget buildState(bool working) {
  if (working == true) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      child: Row(
        children: <Widget>[
          Text(
            "Estado: ".toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
          Text(
            "Disponible",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Colors.green
            ),
          )
        ]
      ),
    );
  } else { 
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      child:Row(
        children: <Widget>[
          Text(
            "Estado: ".toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
          Text(
            "No disponible",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Colors.red
            ),
          )
        ]
      ),
    );
  }
}

Widget buildWorking(bool state) {
  if (state == true) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      child: Row(
        children: <Widget>[
          Text(
            "En turno: ".toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
          Text(
            "Trabajando",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Colors.green
            ),
          )
        ]
      ),
    );
  } else { 
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      child: Row(
        children: <Widget>[
          Text(
            "En turno: ".toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
          Text(
            "De descanso",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Colors.red
            ),
          )
        ]
      ),
    );
    
  }
  
}

