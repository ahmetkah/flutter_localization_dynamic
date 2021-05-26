import 'package:flutter/material.dart';

class ItemDialog extends StatelessWidget {
  const ItemDialog({
    Key? key,
    required this.path,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String path;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Image.asset(
              'assets/icons/$path',
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 16.0,
            ),
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
