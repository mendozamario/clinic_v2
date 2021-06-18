import 'package:clinic/models/careStaff.dart';
import 'package:clinic/pages/care_staff/add_edit_care_staff_screen.dart';
import 'package:clinic/pages/care_staff/consult_care_staff_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CareStaffScreen extends StatefulWidget {
  final String profilePicture;
  final List<CareStaff> careStaffs;
  CareStaffScreen({Key key, this.profilePicture, this.careStaffs}) : super(key: key);

  @override
  _CareStaffScreenState createState() => _CareStaffScreenState();
}

class _CareStaffScreenState extends State<CareStaffScreen> {
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
            builder: (context) => ConsultCareStaffScreen(careStaff: widget.careStaffs[index])
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
                backgroundImage: NetworkImage(widget.careStaffs[index].picture),
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
                    widget.careStaffs[index].fullName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Especialidad: ' + widget.careStaffs[index].type,
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
      itemCount: widget.careStaffs.length,
      itemBuilder: (context, index) {
        return careStaffCard(index);
      },
    );
  }

  Color stateColor(int index) {
    if (widget.careStaffs[index].state == true){
      return Color(0xFFc2f8cb);
    } else {
      return Color(0xFFffa9a3);
    }
  }

  String workingStatus(int index) {
    if (widget.careStaffs[index].working == true) {
      return "En turno";
    } else {
      return "En descanso";
    }
  }
}