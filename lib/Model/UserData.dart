class UserData{
  String email;
  String password;
  String id;
  String gender;
  String name;
  String birthdate;

  UserData({
    this.name,
    this.email,
    this.password,
    this.id,
    this.gender,
    this.birthdate
  });

  Map<String, dynamic> returnUserData(){
    return {
      "name" : this.name,
      "id" : this.id,
      "gender" : this.gender,
      "birthdate" : this.birthdate
    };
  }
}