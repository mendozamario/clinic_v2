import 'dart:convert';
import 'package:clinic/models/patient.dart';
import 'package:clinic/pages/home/patient_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

String listUrl = "https://clinic-mm.000webhostapp.com/PatientList.php";
String addUrl = "https://clinic-mm.000webhostapp.com/add_patient.php";
String deleteUrl = "https://clinic-mm.000webhostapp.com/DeletePatient.php";
String updateUrl = "https://clinic-mm.000webhostapp.com/UpdatePatient.php";

Future<dynamic> _getPatients() async {
  final response = await http.get(Uri.parse(listUrl));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print("Error: Response incorrect");
  }
}

class GetPatients extends StatelessWidget {
  final String profilePicture;
  const GetPatients({Key key, this.profilePicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: _getPatients(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot);
            return PatientScreen(
              patients: patientList(snapshot.data),
              profilePicture: profilePicture,
            );
          } else {
            print("No have information");
            return Text("Not Data");
          }
        },
        initialData: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

List<Patient> patientList(List<dynamic> info) {
  List<Patient> patients = [];

  info.forEach((element) {
    Patient patient = new Patient(
      id: element["id"],
      picture: element["picture"],
      fullName: element["full_name"],
      birthDate: element["birth_date"],
      adress: element["adress"],
      neighborhood: element["neighborhood"],
      phone: int.parse(element["phone"]),
      city: element["city"],
      state: state(element["estado"])
    );

    patients.add(patient);
  });

  return patients;
} 

bool state(String data) {
  if (data == "0") {
    return false;
  } else {
    return true;
  }
}

void postPatient(
  String id,
  String picture,
  String fullName,
  String birthDate,
  String adress,
  String neighborhood,
  String phone, 
  String city,
  String state
) async {
  await http.post(Uri.parse(addUrl), body: {
    'id': id,
    'picture': picture,
    'full_name': fullName,
    'birth_date': birthDate,
    'adress': adress,
    'neighborhood': neighborhood,
    'phone': phone,
    'city': city,
    'estado': state
  });
}

void deletePatient(String id) async {
  await http.post(Uri.parse(deleteUrl), body: {'id_delete': id});
}

void updatePatient(
  String id,
  String idEdit,
  String picture,
  String fullName,
  String birthDate,
  String adress,
  String neighborhood,
  String phone, 
  String city,
  String state
) async {
  await http.post(Uri.parse(updateUrl), body: {
    'id': id,
    'picture': picture,
    'full_name': fullName,
    'birth_date': birthDate,
    'adress': adress,
    'neighborhood': neighborhood,
    'phone': phone,
    'city': city,
    'estado': state,
    'id_edit': idEdit,
  });
}