import 'package:clinic/data/patient_data.dart';
import 'package:clinic/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AddEditPatient extends StatefulWidget {
  final String title;
  final Patient patient;
  AddEditPatient({Key key, this.title, this.patient}) : super(key: key);

  @override
  _AddEditPatientState createState() => _AddEditPatientState();
}

class _AddEditPatientState extends State<AddEditPatient> {

  TextEditingController idController;
  TextEditingController pictureController;
  TextEditingController fullNameController;
  TextEditingController birthDateController = TextEditingController();
  TextEditingController ageController;
  TextEditingController adressController;
  TextEditingController neighborhoodController;
  TextEditingController phoneController;
  TextEditingController cityController;
  bool state;
  String idEdit;

  @override
  void initState() { 
    super.initState();
    
    addOrEditMethod(widget.title, widget.patient);

    state = false;
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

  Widget buildDatatimePicker() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: DateTimePicker(
        controller: birthDateController,
        type: DateTimePickerType.date,
        dateMask: "dd/MM/yyyy",
        initialValue: DateTime.now().toString(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2050),
        icon: Icon(Icons.calendar_today),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black)
          ),
          prefixIcon: Icon(Icons.calendar_today)
        ),
      ),
    );
  }

  Widget buildSwitch() {
    return Container(
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
            onPressed: () => addPatient(widget.title),
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
          buildTextField("Fecha de nacimiento", birthDateController, Icon(Icons.calendar_today)),
          buildTextField("Dirección", adressController, Icon(Icons.home_outlined)),
          buildTextField("Barrio", neighborhoodController, Icon(Icons.family_restroom_outlined)),
          buildTextField("Número telefonico", phoneController, Icon(Icons.phone)),
          buildTextField("Ciudad", cityController, Icon(Icons.location_city)),
          buildSwitch(),
          buildButtons(),
        ],
      ),
    );
  }

  void addOrEditMethod(String title, Patient patient) {
    if (title == "Editar paciente") {
      idController = TextEditingController(text: patient.id);
      pictureController = TextEditingController(text: patient.picture);
      fullNameController = TextEditingController(text: patient.fullName);
      birthDateController = TextEditingController(text: patient.birthDate);
      ageController  = TextEditingController(text: patient.age.toString());
      adressController = TextEditingController(text: patient.adress);
      neighborhoodController = TextEditingController(text: patient.neighborhood);
      phoneController = TextEditingController(text: patient.phone.toString());
      cityController = TextEditingController(text: patient.city);
      state = patient.state;
      idEdit = patient.id;
    } else {
      idController = TextEditingController();
      pictureController = TextEditingController();
      fullNameController = TextEditingController();
      birthDateController = TextEditingController();
      ageController  = TextEditingController();
      adressController = TextEditingController();
      neighborhoodController = TextEditingController();
      phoneController = TextEditingController();
      cityController = TextEditingController();
      state = false;
    }
  }

  void addPatient(String title) {
    String stateText;
    String idEdit = widget.patient.id;

    if (state == false) {
      stateText = "0";
    } else {
      stateText = "1";
    }

    if (title == "Editar paciente") {
      deletePatient(idEdit);
    } 
    postPatient(
      idController.text, 
      pictureController.text, 
      fullNameController.text, 
      birthDateController.text,  
      adressController.text, 
      neighborhoodController.text, 
      phoneController.text,
      cityController.text, 
      stateText
    );
  

    Navigator.of(context).pop();
  }
}

