import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({ Key? key }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text('20/08/2022',
            style: TextStyle(
              fontSize: 12
            ),),
          Text('23/08/2022',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ]
      ),
    );
  }
}