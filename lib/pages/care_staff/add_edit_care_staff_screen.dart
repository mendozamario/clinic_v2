import 'package:clinic/data/care_staff_data.dart';
import 'package:clinic/models/careStaff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AddEditCareStaffScreen extends StatefulWidget {
  String title;
  CareStaff careStaff;
  AddEditCareStaffScreen({Key key, this.title, this.careStaff}) : super(key: key);

  @override
  _AddEditCareStaffScreenState createState() => _AddEditCareStaffScreenState();
}

class _AddEditCareStaffScreenState extends State<AddEditCareStaffScreen> {
  TextEditingController idController;
  TextEditingController pictureController;
  TextEditingController fullNameController;
  TextEditingController typeController;
  bool state;
  bool working;

  @override
  void initState() { 
    super.initState();
    
    addOrEditMethod(widget.title, widget.careStaff);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: createUi(),
        ),
      )
    );
  }

  Widget buildTextField(String title, TextEditingController controller, Icon icon) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black)
          ),
          labelText: title,
          prefixIcon: icon,
        ),
      ),
    );
  }
  
  Widget buildSwitchWorking() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "En turno",
            style: TextStyle(
              fontSize: 18
            ),
          ),
          FlutterSwitch(
            value: working,
            onToggle: (val){
              setState(() {
                working = val;
              });
            },
          )
        ],
      ),
    );
  }

 Widget buildSwitchState() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text(
            "Estado",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          FlutterSwitch(
            value: state,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                state = val;
              });
            },
          ),
        ],
      )
    );
  }


  Widget buildButtons() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
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
              "Cancelar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            onPressed: () => Navigator.pop(context),
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
              "Guardar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            onPressed: () => addCareStaff(widget.careStaff.id, widget.title),
          )
        ],
      ),
    );
  }

  Widget createUi() { 
    return Container(
      child: Column(
        children: <Widget>[
          buildTextField("Foto de perfil", pictureController, Icon(Icons.person_pin_rounded)),
          buildTextField("Identificación", idController, Icon(Icons.assignment_ind_outlined)),
          buildTextField("Nombre completo", fullNameController, Icon(Icons.people_outline_rounded)),
          buildTextField("Especialidad", typeController, Icon(Icons.add)),
          buildSwitchState(),
          buildSwitchWorking(),
          buildButtons(),
        ],
      ),
    );
  }

  void addOrEditMethod(String title, CareStaff careStaff) {
    if (title == "Editar personal") {
      idController = TextEditingController(text: careStaff.id);
      pictureController = TextEditingController(text: careStaff.picture);
      fullNameController = TextEditingController(text: careStaff.fullName);
      typeController = TextEditingController(text: careStaff.type);
      state = careStaff.state;
      working = careStaff.working;
    } else {
      idController = TextEditingController();
      pictureController = TextEditingController();
      fullNameController = TextEditingController();
      typeController = TextEditingController();
      state = false;
      working = false;
    }
  }

  void addCareStaff(String idEdit, String title) {
    String stateText;
    String workingText;

    if (state == false) {
      stateText = "0";
    } else {
      stateText = "1";
    }

    if (working == false) {
      workingText = "0";
    } else {  
      workingText = "1";
    }

    if(title == "Editar personal") {
      deleteCareStaff(idEdit);
    }

    postCareStaff(
      idController.text, 
      pictureController.text, 
      fullNameController.text, 
      typeController.text, 
      stateText, 
      workingText
    );

    Navigator.of(context).pop();
  }

}