class CareStaff {
  String id;
  String picture;
  String fullName;
  String type;
  bool state;
  bool working;

  CareStaff({
    this.id,
    this.picture,
    this.fullName,
    this.type,
    this.state,
    this.working,
  });
}

List<CareStaff> careStaffs = [
  CareStaff(  
    id: '8625792',
    picture: 'https://images.pexels.com/photos/6812524/pexels-photo-6812524.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    fullName: 'Ricardo Mendoza',
    type: 'Odontologo',
    state: true,
    working: true,
  ),
  CareStaff(  
    id: '1003225678',
    picture: 'https://images.pexels.com/photos/3279197/pexels-photo-3279197.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    fullName: 'Ricardo Mendoza',
    type: 'Cirujano',
    state: true,
    working: false,
  ),
  CareStaff(  
    id: '1062785243',
    picture: 'https://images.pexels.com/photos/3985163/pexels-photo-3985163.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    fullName: 'Juliana Ariza',
    type: 'General',
    state: false,
    working: false,
  ),
];