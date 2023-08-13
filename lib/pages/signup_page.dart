import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
    const SignupPage({Key? key}) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Signup'),
        ),
        body: const Center(
            child: Text('Pagina de Signup'),
        ),
        );
    }
}
