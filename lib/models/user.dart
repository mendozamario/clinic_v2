class User {
  String username;
  String password;
  String email;
  String profilePicture;

  User({
    this.username,
    this.password,
    this.email,
    this.profilePicture
  });
}

List<User> users = [
  User(
    username: 'eme.mendozar',
    password: 'mendoza2002',
    email: 'menriquemendoza@unicesar.edu.co',
    profilePicture: 'https://images.pexels.com/photos/7618389/pexels-photo-7618389.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
    username: 'ceduerose',
    password: 'calvo2002',
    email: 'cjcalvo@unicesar.edu.co',
    profilePicture: 'https://images.pexels.com/photos/1615776/pexels-photo-1615776.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
    username: 'arnet',
    password: 'agudelo1999',
    email: 'acagudelo@unicesar.edu.co',
    profilePicture: 'https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  )
];