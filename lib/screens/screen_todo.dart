import 'package:flutter/material.dart';
import 'package:proj1/content/list_view_content.dart';
import 'package:proj1/content/todo_content.dart';

class ToDo1 extends StatelessWidget{
  const ToDo1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Task(),
      debugShowCheckedModeBanner: false,
    );
  }

}
class Task extends StatelessWidget{
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     // Navigator.pop(context); // Navigate back when the arrow button is pressed
        //   },
        // ),
        title: const Text(
            "To Do",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 35,
            fontFamily: 'SofiaSansCondensed',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body:
      Row(
        children:[
          const SizedBox(
            height: 100,
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint("Completed");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: const StadiumBorder(),
            ),
            child: const TaskText(),
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint("Urgent");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: const StadiumBorder(),
            ),
            child: const TaskText2(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(
            Icons.add),
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ToDo_Form()),
          );
        },

      ),
    );
  }

}
class TaskText extends StatelessWidget{
  const TaskText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Completed",
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 35,
        fontFamily: 'SofiaSansCondensed',
        fontWeight: FontWeight.w700,
      ),
    );
  }

}
class TaskText2 extends StatelessWidget{
  const TaskText2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Urgent",
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 35,
        fontFamily: 'SofiaSansCondensed',
        fontWeight: FontWeight.w700,
      ),
    );
  }

}