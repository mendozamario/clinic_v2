import 'package:clinic/models/careStaff.dart';
import 'package:clinic/pages/care_staff/add_edit_care_staff_screen.dart';
import 'package:clinic/pages/care_staff/consult_care_staff_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CareStaff extends StatefulWidget {
  String profilePicture;
  CareStaff({Key key, this.profilePicture}) : super(key: key);

  @override
  _CareStaffState createState() => _CareStaffState();
}

class _CareStaffState extends State<CareStaff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Personal de Apoyo",
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
              right: 10,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.profilePicture),
            ),
          )
        ],
      ),
      body:  Container(
        color: Colors.white,
        child: listCareStaffCards(context),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: FaIcon(FontAwesomeIcons.plus, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => AddEditCareStaffScreen(title: "Añadir personal"),
            )
          );
        }
      ),
    );
  }

  Widget careStaffCard(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConsultCareStaffScreen(careStaff: careStaffs[index])
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
                backgroundImage: NetworkImage(careStaffs[index].picture),
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
                    careStaffs[index].fullName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Especialidad: ' + careStaffs[index].type,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Text(
                    'Estado. ' + workingStatus(index),
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

  Widget listCareStaffCards(BuildContext context) {
    return ListView.builder(
      itemCount: careStaffs.length,
      itemBuilder: (context, index) {
        return careStaffCard(index);
      },
    );
  }
}

Color stateColor(int index) {
  if (careStaffs[index].state == true){
    return Color(0xFFc2f8cb);
  } else {
    return Color(0xFFffa9a3);
  }
}

String workingStatus(int index) {
  if (careStaffs[index].working == true) {
    return "En turno";
  } else {
    return "En descanso";
  }
}