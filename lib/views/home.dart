import 'package:first_application/views/second_screen.dart';
import 'package:first_application/views/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 105,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('images/OIP.jpg'),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailCont,
                  validator: (value) {
                    if (value!.contains('@')) {
                      return null;
                    } else {
                      return 'not valid';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'email',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length > 8) {
                      return null;
                    } else {
                      return 'not valid';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  saveemail(emailCont.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(
                                email: emailCont.text,
                              )));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: MyButn(
                    text: 'Log in',
                    ForeColor: Colors.white,
                    backColor: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "forgot password?",
                style: TextStyle(fontSize: 10),
              ),
            ),
            MyButn(
                text: 'Sign up',
                ForeColor: Colors.white,
                backColor: Colors.grey),
          ],
        ),
      ),
    );
  }

  saveemail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }
}
