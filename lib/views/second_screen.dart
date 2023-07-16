import 'package:first_application/views/screens/Main.dart';
import 'package:first_application/views/screens/profile.dart';
import 'package:first_application/views/screens/settings.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  String email;
  SecondPage({super.key, required this.email});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int sellectedIndex = 0;
  List<Widget> page = [Main(), Profile(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
        backgroundColor: Colors.blue,
      ),
      body: page[sellectedIndex],
      //Column(children: [
      //TextField(
      //decoration: InputDecoration(
      //border: OutlineInputBorder(),
      //hintText:widget.email ,
      //),
      //),

      //]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'main'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'settings'),
        ],
        onTap: (value) {
          sellectedIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
