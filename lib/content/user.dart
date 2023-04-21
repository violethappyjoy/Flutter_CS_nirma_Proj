class User
{
  String name;
  String email;
  String password;
  String dob;
  String address;

  User(
      this.name,
      this.email,
      this.password,
      this.dob,
      this.address,
      );
  Map<String, dynamic> toJson()=>
      {
        'name':name,
        'email':email,
        'password':password,
        'dob':dob,
        'address':address,
      };
}