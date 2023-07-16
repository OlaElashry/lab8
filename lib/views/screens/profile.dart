import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String useremail = "";
  void initState() {
    super.initState();
    getemail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(useremail, style: TextStyle(fontSize: 24))),
    );
  }

  getemail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    useremail = prefs.getString("email") ?? "--";
    setState(() {});
  }
}
