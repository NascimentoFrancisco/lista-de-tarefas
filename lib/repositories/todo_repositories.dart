
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo.dart';

const todo_listKey = 'todo_list';

class TodoRepository {
  /*
    O plugin SharedPreferences armazena dados primitivos, ou seja, inteiros, dubles e strings.
    Ele persite os dados no padrão json, lembrando que a quantidade de dados que esse plugin armazena
    é pouca, não recomendado para aplicações que necessita armazenar muitos dados.
  */
  late SharedPreferences sharedPreferences;

  //Buscando as tarefas já salvas ao reiniciar o app
  Future <List<Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todo_listKey) ?? '[]';
    final List jsonDecode = json.decode(jsonString) as List;
    return jsonDecode.map((e) => Todo.fromJson(e)).toList();
  }

  //Salvanso as tarefas 
  void saveTodoList(List<Todo> todos){
    final String jsonString = json.encode(todos);
    sharedPreferences.setString(todo_listKey, jsonString);
  }

}