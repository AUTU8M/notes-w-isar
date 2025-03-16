import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  final String text;
  const TextTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: ListTile(title: Text(text)),
    );
  }
}
