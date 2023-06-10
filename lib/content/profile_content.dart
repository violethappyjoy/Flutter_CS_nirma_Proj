import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proj1/API_Conn/API_Conn.dart';
import 'package:proj1/screens/screen_login.dart';

class ProfDat {
  Future<dynamic> getDat() async {
    var url = Uri.parse(API.getProfile);
    var response = await http.post(url, body: {'uid': uid});

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      return decodedResponse[0];
    } else {
      throw Exception('Failed to fetch PHP output');
    }
  }
}

class ProfID extends StatefulWidget {
  const ProfID({super.key});

  @override
  State<ProfID> createState() => _ProfIDState();
}

class _ProfIDState extends State<ProfID> {
  ProfDat p = ProfDat();

  Future<String> pID() async {
    try {
      Map<String, dynamic> data = await p.getDat();
      var id = data['uid'];
      return id.toString();
    } catch (e) {
      print('Error decoding JSON: $e');
      return 'ERROR';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: pID(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.black,
            height: 45.0,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 45.0,
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Text(
            snapshot.data!,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 30,
              fontFamily: 'SofiaSansCondensed',
              fontWeight: FontWeight.w400,
            ),
          );
        }
      },
    );
  }
}

class ProfName extends StatefulWidget {
  const ProfName({super.key});

  @override
  State<ProfName> createState() => _ProfNameState();
}

class _ProfNameState extends State<ProfName> {
  ProfDat p = ProfDat();

  Future<String> pName() async {
    try {
      Map<String, dynamic> data = await p.getDat();
      var name = data['name'];
      return name.toString();
    } catch (e) {
      print('Error decoding JSON: $e');
      return 'ERROR';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: pName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.black,
            height: 45.0,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 45.0,
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Text(
            snapshot.data!,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 30,
              fontFamily: 'SofiaSansCondensed',
              fontWeight: FontWeight.w400,
            ),
          );
        }
      },
    );
  }
}

class ProfPhno extends StatefulWidget {
  const ProfPhno({super.key});

  @override
  State<ProfPhno> createState() => _ProfPhnoState();
}

class _ProfPhnoState extends State<ProfPhno> {
  ProfDat p = ProfDat();

  Future<String> pPhno() async {
    try {
      Map<String, dynamic> data = await p.getDat();
      var phno = data['phno'];
      return phno.toString();
    } catch (e) {
      print('Error decoding JSON: $e');
      return 'ERROR';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: pPhno(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.black,
            height: 45.0,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 45.0,
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Text(
            snapshot.data!,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 30,
              fontFamily: 'SofiaSansCondensed',
              fontWeight: FontWeight.w400,
            ),
          );
        }
      },
    );
  }
}

class ProfEmail extends StatefulWidget {
  const ProfEmail({super.key});

  @override
  State<ProfEmail> createState() => _ProfEmailState();
}

class _ProfEmailState extends State<ProfEmail> {
  ProfDat p = ProfDat();

  Future<String> pEmail() async {
    try {
      Map<String, dynamic> data = await p.getDat();
      var email = data['email'];
      return email.toString();
    } catch (e) {
      print('Error decoding JSON: $e');
      return 'ERROR';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: pEmail(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.black,
            height: 45.0,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 45.0,
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Text(
            snapshot.data!,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 30,
              fontFamily: 'SofiaSansCondensed',
              fontWeight: FontWeight.w400,
            ),
          );
        }
      },
    );
  }
}

class ProfDob extends StatefulWidget {
  const ProfDob({super.key});

  @override
  State<ProfDob> createState() => _ProfDobState();
}

class _ProfDobState extends State<ProfDob> {
  ProfDat p = ProfDat();

  Future<String> pDob() async {
    try {
      Map<String, dynamic> data = await p.getDat();
      var dob = data['dob'];
      return dob.toString();
    } catch (e) {
      print('Error decoding JSON: $e');
      return 'ERROR';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: pDob(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.black,
            height: 45.0,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 45.0,
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Text(
            snapshot.data!,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 30,
              fontFamily: 'SofiaSansCondensed',
              fontWeight: FontWeight.w400,
            ),
          );
        }
      },
    );
  }
}

class ProfAddr extends StatefulWidget {
  const ProfAddr({super.key});

  @override
  State<ProfAddr> createState() => _ProfAddrState();
}

class _ProfAddrState extends State<ProfAddr> {
  ProfDat p = ProfDat();

  Future<String> pAddr() async {
    try {
      Map<String, dynamic> data = await p.getDat();
      var addr = data['address'];
      return addr.toString();
    } catch (e) {
      print('Error decoding JSON: $e');
      return 'ERROR';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: pAddr(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.black,
            height: 45.0,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 45.0,
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Text(
            snapshot.data!,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 30,
              fontFamily: 'SofiaSansCondensed',
              fontWeight: FontWeight.w400,
            ),
          );
        }
      },
    );
  }
}
