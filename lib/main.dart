import 'package:flutter/material.dart';
import 'package:gerenciador_tarefas/pages/todo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Lembrando que aqui só retira banner de deuga do app, mas o app ainda está no modo debug
      debugShowCheckedModeBanner: false,
      //Page importada da pasta pages
      home: TodoListPage(),
    );
  }
}

