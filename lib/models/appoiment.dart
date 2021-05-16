class Appoiment {
  String code;
  String patientId;
  String careStaffId;
  String date;
  String room;
  String type;
  bool cheked;

  Appoiment({
    this.code,
    this.patientId,
    this.careStaffId,
    this.date,
    this.room,
    this.type,
    this.cheked
  });
}

List<Appoiment> appoiments = [
  Appoiment(
    code: "001",
    patientId: "1066285875",
    careStaffId: "1066285875",
    date: "15/07/2021",
    room: "502",
    type: "Odontologia",
    cheked: false
  ),
  Appoiment(
    code: "002",
    patientId: "1086772842",
    careStaffId: "1066285875",
    date: "17/02/2021",
    room: "401",
    type: "Oncologia",
    cheked: true
  ),
  Appoiment(
    code: "003",
    patientId: "12317473829",
    careStaffId: "1066285875",
    date: "11/09/2021",
    room: "705",
    type: "Medicina Interna",
    cheked: true
  ),
];

