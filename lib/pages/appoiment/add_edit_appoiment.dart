import 'package:clinic/models/appoiment.dart';
import 'package:flutter/material.dart';

class AddEditAppoiment extends StatefulWidget {
  final String title;
  final Appoiment appoiment;
  AddEditAppoiment({Key key, this.title, this.appoiment}) : super(key: key);

  @override
  _AddEditAppoimentState createState() => _AddEditAppoimentState();
}

class _AddEditAppoimentState extends State<AddEditAppoiment> {

  TextEditingController codeController;
  TextEditingController patientIdController;
  TextEditingController careStaffIdController;
  TextEditingController dateController;
  TextEditingController roomController;
  TextEditingController typeController;
  bool cheked;

  @override
  void initState() { 
    super.initState();
    
    addOrEditMethod(widget.title, widget.appoiment);
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
      body: Container(
        color: Colors.white,
        child: createUi(),
      ),
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
          buildTextField("Codigo", codeController, Icon(Icons.assignment_ind_outlined)),
          buildTextField("Identificacion del paciente", patientIdController, Icon(Icons.people_outline_rounded)),
          buildTextField("Identificación del especialista", careStaffIdController, Icon(Icons.add)),
          buildTextField("Fecha de cinta", dateController, Icon(Icons.calendar_today)),
          buildTextField("Consultorio", roomController, Icon(Icons.home)),
          buildTextField("Tipo de cita", typeController, Icon(Icons.merge_type)),
          buildButtons(),
        ],
      ),
    );
  }

  void addOrEditMethod(String title, Appoiment appoiment) {
    if (title == "Editar cita") {
      codeController = TextEditingController(text: appoiment.code);
      patientIdController = TextEditingController(text: appoiment.patientId);
      careStaffIdController = TextEditingController(text: appoiment.careStaffId);
      dateController = TextEditingController(text: appoiment.date);
      roomController = TextEditingController(text: appoiment.room);
      typeController = TextEditingController(text: appoiment.type);
    } else {
      codeController = TextEditingController();
      patientIdController = TextEditingController();
      careStaffIdController = TextEditingController();
      dateController = TextEditingController();
      roomController = TextEditingController();
      typeController = TextEditingController();
    }
  }
}