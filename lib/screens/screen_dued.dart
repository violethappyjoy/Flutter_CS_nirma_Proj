import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proj1/API_Conn/API_Conn.dart';
import 'package:proj1/screens/screen_login.dart';

Future<List<dynamic>> pastDueList() async {
  final response = await http.post(Uri.parse(API.getPtodo), body: {'uid': uid});
  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData;
  } else {
    throw Exception('Failed to fetch data from PHP script');
  }
}

class Dued extends StatelessWidget{
  const Dued({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back when the arrow button is pressed
            },
          ),
          title: const Text(
            "To Do (Past Due)",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 35,
              fontFamily: 'SofiaSansCondensed',
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: PastDueTodoList(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
class PastDueTodoList extends StatefulWidget {
  @override
  _PastDueTodoListState createState() => _PastDueTodoListState();
}

class _PastDueTodoListState extends State<PastDueTodoList> {
  Future<List<dynamic>>? _todosFuture;

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  Future<void> _fetchTodos() async {
    setState(() {
      _todosFuture = pastDueList();
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
          List<dynamic> todos = snapshot.data!;
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
            child: Text('No todos found.'),
          );
        }
      },
    );
  }
}