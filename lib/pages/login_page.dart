import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/bindings/routes.dart';
import 'package:sofia_app/controllers/login.controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.guest),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Acesse sua conta'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Form(
          key: _controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Bem vindo de volta!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => _controller.validateEmail(value),
                  onChanged: (value) => _controller.onEmailChanged(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller.passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (value) => _controller.validatePassword(value),
                  onChanged: (value) => _controller.onPasswordChanged(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 8, left: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.signup);
                      },
                      child: const Text('Quero criar uma conta'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      onPressed: () async => await _controller.login(context),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
