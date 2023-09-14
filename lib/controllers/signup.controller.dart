import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/bindings/routes.dart';
import 'package:sofia_app/use_cases/auth_uc.dart';
import 'package:sofia_app/use_cases/signup_uc.dart';

class SignupController extends GetxController {
  AuthUC authUC = Get.put(AuthUC());
  SignupUC signupUC = Get.put(SignupUC());

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

    if (!GetUtils.isEmail(value)) {
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

  Future<void> signup(BuildContext context) async {
    ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);

    _showSnakBar(scaffold);

    if (!isValid()) {
      return;
    }

    try {
      await signupUC.execute(name, email, password);
      await authUC.execute(email, password);
      Get.offAllNamed(Routes.home);
    } on DioException catch (error) {
      Get.toNamed(
        Routes.error,
        arguments: error,
      );
    } finally {
      _hideSnakBar(scaffold);
    }
  }

  void _showSnakBar(ScaffoldMessengerState scaffold) {
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Estamos criando sua conta, aguarde um momento...'),
      ),
    );
  }

  void _hideSnakBar(ScaffoldMessengerState scaffold) {
    scaffold.hideCurrentSnackBar();
  }
}
