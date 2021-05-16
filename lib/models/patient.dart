class Patient {
  String id;
  String picture;
  String fullName;
  String birthDate;
  int age;
  String adress;
  String neighborhood;
  int phone;
  String city;
  bool state;

  Patient({
    this.id,
    this.picture,
    this.fullName,
    this.birthDate,
    this.age,
    this.adress,
    this.neighborhood,
    this.phone,
    this.city,
    this.state
  });
}

List<Patient> patients = [
  Patient(
    id: '1066285875',
    picture: 'https://images.pexels.com/photos/4067766/pexels-photo-4067766.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    fullName: 'Mario Mendoza Rodriguez',
    birthDate: '11/02/2002',
    age: 19,
    adress: 'Calle 11 # 21 - 04',
    neighborhood: 'Iracal',
    phone: 3023904474,
    city: 'Valledupar',
    state: true
  ),
  Patient(
    id: '1086772842',
    picture: 'https://images.pexels.com/photos/1759530/pexels-photo-1759530.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    fullName: 'Jose Mestre Cardona',
    birthDate: '13/01/1955',
    age: 66,
    adress: 'Cra 20 # 7 - 40',
    neighborhood: 'Cortijos',
    phone: 3009684273,
    city: 'Valledupar',
    state: false
  ),
  Patient(
    id: '12317473829',
    picture: 'https://images.pexels.com/photos/7673585/pexels-photo-7673585.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    fullName: 'Carlos Padilla Campo',
    birthDate: '18/5/2000',
    age: 20,
    adress: 'Calle 13 # 12 - 45',
    neighborhood: 'Random',
    phone: 312245672,
    city: 'Valledupar',
    state: true
  ),
];