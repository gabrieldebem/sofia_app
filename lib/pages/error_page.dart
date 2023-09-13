import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  final DioException exception;
  const ErrorPage({
    Key? key,
    required this.exception,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ocorreu um erro',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          onPressed: () => Get.back(),
        )
      ),
      body: Center(
          child: Text(
        exception.response?.data['message'],
        style: TextStyle(
          fontSize: 18.0,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          fontWeight: FontWeight.w400,
        ),
      )),
    );
  }
}
