import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
