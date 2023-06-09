class User
{
  int uid;
  String name;
  String email;
  String phno;
  String password;
  String dob;
  String address;

  User(
      this.uid,
      this.name,
      this.email,
      this.phno,
      this.password,
      this.dob,
      this.address,
      );
  Map<String, dynamic> toJson()=>
      {

        "uid":uid.toString(),
        "name":name,
        "email":email,
        "phno":phno,
        "password":password,
        "dob":dob,
        "address":address
      };
}