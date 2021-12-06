import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String title;
  final String message;
  const NoData({
    Key? key,
    required this.title,
    this.message = 'Nenhum registro encontrado',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
