import 'package:clinic/models/careStaff.dart';
import 'package:clinic/pages/home/care_staff_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

String listUrl = "https://clinic-mm.000webhostapp.com/CareStaffList.php";
String addUrl = "https://clinic-mm.000webhostapp.com/AddCareStaff.php";
String deleteUrl = "https://clinic-mm.000webhostapp.com/DeleteCareStaff.php";
String updateUrl = "https://clinic-mm.000webhostapp.com/UpdateCareStaff.php";

Future<dynamic> _getCareStaff() async {
  final response = await http.get(Uri.parse(listUrl));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print("Error: Response incorrect");
  }
}

class GetCareStaff extends StatelessWidget {
  final String profilePicture;
  const GetCareStaff({Key key, this.profilePicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: _getCareStaff(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot);
            return CareStaffScreen(
              careStaffs: careStaffList(snapshot.data),
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

List<CareStaff> careStaffList(List<dynamic> info) {
  List<CareStaff> careStaffs = [];

  info.forEach((element) {
    CareStaff careStaff = new CareStaff(
      id: element["id"],
      picture: element["picture"],
      fullName: element["full_name"],
      type: element["tipo"],
      state: booleanConvert(element["estado"]),
      working: booleanConvert(element["working"])
    );  

    careStaffs.add(careStaff);
  });

  return careStaffs;
}

bool booleanConvert(String data) {
  if (data == "0") {
    return false;
  } else {
    return true;
  }
}

void postCareStaff(
  String id,
  String picture,
  String fullName,
  String type,
  String state, 
  String working
) async {
  await http.post(Uri.parse(addUrl), body: {
    'id': id,
    'picture': picture,
    'full_name': fullName,
    'tipo': type,
    'estado': state,
    'working': working
  });
}

void deleteCareStaff(String id) async {
  await http.post(Uri.parse(deleteUrl), body: {'id_delete': id});
}

void updateCareStaff(
  String id,
  String picture,
  String fullName,
  String type,
  String state, 
  String working,
  String updatedId,
) async {
  await http.post(Uri.parse(updateUrl), body: {
    'id': id,
    'picture': picture,
    'full_name': fullName,
    'tipo': type,
    'estado': state,
    'working': working,
    'updated_id': updatedId
  });
}