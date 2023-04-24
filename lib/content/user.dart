class User
{
  int uid;
  String name;
  String email;
  String password;
  String dob;
  String address;

  User(
      this.uid,
      this.name,
      this.email,
      this.password,
      this.dob,
      this.address,
      );
  Map<String, dynamic> toJson()=>
      {

        "uid":uid.toString(),
        "name":name,
        "email":email,
        "password":password,
        "dob":dob,
        "address":address
      };
}