import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proj1/API_Conn/API_Conn.dart';
import 'package:proj1/screens/screen_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
//[{uid:fds,...,...},{}]
Future<List<dynamic>> incList() async {
  final response = await http.post(Uri.parse(API.getItodo), body: {'uid': uid});
  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData;
  } else {
    throw Exception('Failed to fetch data from PHP script');
  }
}
markComplete(tid) async{
  try{
    var res = await http.post(
      Uri.parse(API.markComp),
      body: {
        'tid': tid
      },
    );
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      if (resbody['marked']) {
        Fluttertoast.showToast(msg: "Task Marked Complete");
      } else {
        Fluttertoast.showToast(msg: "Error");
      }
    }
  }catch(e){
    debugPrint("ERROR");
  }
}
class IncTodoList extends StatefulWidget {
  @override
  _IncTodoListState createState() => _IncTodoListState();
}

class _IncTodoListState extends State<IncTodoList> {
  Future<List<dynamic>>? _todosFuture;

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  Future<void> _fetchTodos() async {
    setState(() {
      _todosFuture = incList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _todosFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          List<dynamic> todos = snapshot.data!; //null assertion operator
          return ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> todo = todos[index];
              return ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(todo['title']),
                        content: Text(todo['tdesc']),
                        actions: [
                          TextButton(
                            onPressed: () {
                              markComplete(todo['tid']);
                              // Navigator.of(context).pop();
                              _fetchTodos();
                            },
                            child: const Text("Mark Complete"),
                          ),
                          TextButton(
                            onPressed: () {
                              _fetchTodos();
                              Navigator.of(context).pop();
                            },
                            child: const Text("Close"),
                          )
                        ],
                      );
                    },
                  );
                  debugPrint(todo['tid'] + " clicked");
                },
                title: Text(
                  todo['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 30,
                    fontFamily: 'SofiaSansCondensed',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: Text(
                  todo['due'],
                  style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontFamily: 'SofiaSansCondensed',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('Nothing todo.'),
          );
        }
      },
    );
  }
}
