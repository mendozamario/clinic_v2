import 'package:clinic/models/patient.dart';
import 'package:flutter/material.dart';

class AddEditPatient extends StatefulWidget {
  String title;
  Patient patient;
  AddEditPatient({Key key, this.title, this.patient}) : super(key: key);

  @override
  _AddEditPatientState createState() => _AddEditPatientState();
}

class _AddEditPatientState extends State<AddEditPatient> {
  TextEditingController idController;
  TextEditingController fullNameController;
  TextEditingController birthDateController;
  TextEditingController ageController;
  TextEditingController adressController;
  TextEditingController neigborhoodController;
  TextEditingController phoneController;
  TextEditingController cityController;
  bool state;

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

  Widget buildCircleAvatar() {
    return Container(
      margin: EdgeInsets.all(10),
      child: CircleAvatar(
        child: Text('Foto'),
        radius: 70,
      ),
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
              "Guardar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            onPressed: () => null,
          )
        ],
      ),
    );
  }

  Widget createUi() { 
    return Container(
      child: Column(
        children: <Widget>[
          buildCircleAvatar(),
          buildTextField("Identificación", idController, Icon(Icons.assignment_ind_outlined)),
          buildTextField("Nombre completo", fullNameController, Icon(Icons.people_outline_rounded)),
          buildTextField("Fecha de nacimiento", birthDateController, Icon(Icons.calendar_today)),
          buildTextField("Dirección", adressController, Icon(Icons.home_outlined)),
          buildTextField("Barrio", neigborhoodController, Icon(Icons.family_restroom_outlined)),
          buildTextField("Número telefonico", phoneController, Icon(Icons.phone)),
          buildTextField("Ciudad", cityController, Icon(Icons.location_city)),
          buildButtons(),
        ],
      ),
    );
  }

  void addOrEditMethod(String title, Patient patient) {
    if (title == "Editar paciente") {
      idController = TextEditingController(text: patient.id);
      fullNameController = TextEditingController(text: patient.fullName);
      birthDateController = TextEditingController(text: patient.birthDate);
      ageController  = TextEditingController(text: patient.age.toString());
      adressController = TextEditingController(text: patient.adress);
      neigborhoodController = TextEditingController(text: patient.neighborhood);
      phoneController = TextEditingController(text: patient.phone.toString());
      cityController = TextEditingController(text: patient.city);
    } else {
      idController = TextEditingController();
      fullNameController = TextEditingController();
      birthDateController = TextEditingController();
      ageController  = TextEditingController();
      adressController = TextEditingController();
      neigborhoodController = TextEditingController();
      phoneController = TextEditingController();
      cityController = TextEditingController();
    }
  }
}

