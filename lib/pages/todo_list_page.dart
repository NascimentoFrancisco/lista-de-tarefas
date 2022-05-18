import 'package:flutter/material.dart';
import 'package:gerenciador_tarefas/models/todo.dart';
import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({ Key? key }) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoControler = TextEditingController();

  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deletedTodoPos;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                          Todo newTodo = Todo(title: text, dateTime: DateTime.now());
                          todos.add(newTodo);
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
                        for(Todo todo in todos)
                          TodoListItem(
                            todo:todo,
                            onDelete: onDelete
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Você possui ${todos.length} tarefas pendentes',
                        ),
                      ),
                      ElevatedButton(onPressed: showDeleteMessagerTodosConfirmationDialog, 
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
      ),
    );
  }

  //Call Back
  void onDelete(Todo todo){
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tarefa ${todo.title} foi removida com sucesso!',
        style: TextStyle(color: Color.fromARGB(255, 29, 21, 43)), 
      ),
      backgroundColor: Colors.white,
      action: 
        SnackBarAction(
          label: 'Desfazer',
          textColor: Color.fromARGB(255, 29, 21, 43),
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeleteMessagerTodosConfirmationDialog(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo?'),
        content: Text('Você tem certeza que deseja apagra todas as ${todos.length} tarefas?'),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, 
            child: Text('Cancelar'),
            style: TextButton.styleFrom(primary: Color.fromARGB(255, 108, 31, 231)),
          ),
          TextButton(onPressed: () {
            Navigator.of(context).pop();
            deleteAllTodos();
          },
            child: Text('Limpar tudo'),
            style: TextButton.styleFrom(primary: Colors.red),
          )
        ],
      ),
    );
  }

  void deleteAllTodos(){
    setState(() {
      todos.clear();
    });
  }
}