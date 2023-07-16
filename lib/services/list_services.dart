import 'package:dio/dio.dart';
import 'package:first_application/models/work_list.dart';

class ListServices {
  String url = "https://jsonplaceholder.typicode.com/todos";
  Future<List<ToDoListModel>> getToDoList() async {
    List<ToDoListModel> listItem = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((jsonElement) {
      ToDoListModel list = ToDoListModel.fromJson(jsonElement);
      listItem.add(list);
    });

    return listItem;
  }
}
