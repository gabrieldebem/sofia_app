import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Exception exception;
  const ErrorPage({
    Key? key,
    required this.exception,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ocorreu um erro'),
      ),
      body: Center(
        child: Text(
          exception.toString(),
          style: const TextStyle(
            fontSize: 18.0,
          ),
        )
      ),
    );
  }
}
