import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/bindings/route.binding.dart';
import 'package:sofia_app/pages/error_page.dart';
import 'package:sofia_app/services/users.service.dart';
import 'package:sofia_app/view_models/user_response.dart';

class SignupController extends GetxController {
  UserService userService = Get.put(UserService());

  final _formKey = GlobalKey<FormState>();
  final _name = ''.obs;
  final _email = ''.obs;
  final _password = ''.obs;

  GlobalKey<FormState> get formKey => _formKey;
  String get name => _name.value;
  String get email => _email.value;
  String get password => _password.value;

  set name(String value) => _name(value);
  set email(String value) => _email(value);
  set password(String value) => _password(value);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onNameChanged(String value) {
    name = value;
  }

  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }

  @override
  void onInit() {
    clear();

    nameController.addListener(() => name = nameController.text);
    emailController.addListener(() => email = emailController.text);
    passwordController.addListener(() => password = passwordController.text);

    super.onInit();
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Precisamos saber seu nome para continuar';
    }

    if (value.length < 3 || value.split(' ').length < 2) {
      return 'Parece que esse nome não esta completo';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Precisamos saber seu email para continuar';
    }

    if (!value.contains('@') || !value.contains('.')) {
      return 'Parece que esse email não é valido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Você precisa definir uma senha para continuar';
    }

    if (value.length < 6) {
      return 'Sua senha deve ter pelo menos 6 caracteres';
    }

    return null;
  }

  bool isValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  Future<void> submit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      UserResponse response = await userService.signup(name, email, password);
      print({
        'id': response.id,
        'name': response.name,
        'email': response.email,
        'createdAt': response.createdAt,
      });
    } on Exception catch (error, stacktrace) {
      Navigator.push(
        context,
        RouteBinding.generateRoute(
          RouteSettings(
            name: RouteBinding.error,
            arguments: error,
          ),
        ),
      );
    }
  }
}
