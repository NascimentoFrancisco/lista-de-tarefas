import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gerenciador_tarefas/models/todo.dart';
import 'package:gerenciador_tarefas/pages/todo_list_page.dart';
import 'package:intl/intl.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({ Key? key, required this.todo , required this.onDelete}) : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(DateFormat('dd/MM/yyyy - HH:mm').format(todo.dateTime),
              style: TextStyle(
                fontSize: 12
              ),),
            Text(todo.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ]
        ),
      ),
      actionExtentRatio: 0.2,
      actionPane: const SlidableDrawerActionPane(),
      //Para os botões aparecerem na esquerda
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
          caption: 'Deletar',
          onTap: () {
            onDelete(todo);
          },
        )
      ],
      ),
    );
  }
}