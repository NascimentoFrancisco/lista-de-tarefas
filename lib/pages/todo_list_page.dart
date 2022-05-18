import 'package:flutter/material.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({ Key? key }) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoControler = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child:TextField(
                        controller: todoControler,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adcione uma tarefa',
                          hintText: 'Ex: Estudar flutter'
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    ElevatedButton(onPressed: () {
                      String text = todoControler.text;
                      setState(() {
                        todos.add(text);
                      });
                      todoControler.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 108, 31, 231),
                      padding: EdgeInsets.all(14)
                    ), 
                      child: Icon(
                        Icons.add,
                        size: 30,
                      )
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for(String todo in todos)
                        TodoListItem(),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(
                      child: Text('Você possui 0 tarefas pendentes',
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, 
                      child: Text('Limpar tudo'),
                      style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 108, 31, 231),
                      padding: EdgeInsets.all(14)
                    ), 
                    )
                  ],
                )
              ],
            )
        ),
      )
    );
  }
}