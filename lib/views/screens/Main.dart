import 'package:first_application/models/work_list.dart';
import 'package:first_application/services/list_services.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List<ToDoListModel> works = [];
  bool isLoading = true;
  String complete = "";
  getWorks() async {
    works = await ListServices().getToDoList();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorks();
  }

  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: works.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(works[index].userId.toString()),
                title: Text(works[index].title ?? "--"),
                subtitle: Text(works[index].completed.toString()),
                trailing: Icon(Icons.edit),
              );
            });
  }
}
