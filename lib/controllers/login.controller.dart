import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/bindings/routes.dart';
import 'package:sofia_app/use_cases/auth_uc.dart';

class LoginController extends GetxController {
  final AuthUC _authUC = AuthUC();

  final _formKey = GlobalKey<FormState>();
  final _email = ''.obs;
  final _password = ''.obs;

  GlobalKey<FormState> get formKey => _formKey;
  String get email => _email.value;
  String get password => _password.value;

  set email(String value) => _email(value);
  set password(String value) => _password(value);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onEmailChanged(String value) => email = value;

  void onPasswordChanged(String value) => password = value;

  @override
  void onInit() {
    clear();

    emailController.addListener(() => email = emailController.text);
    passwordController.addListener(() => password = passwordController.text);

    super.onInit();
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Precisamos saber seu email para continuar';
    }

    if (!GetUtils.isEmail(value)) {
      return 'Precisamos de um email válido';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Precisamos saber sua senha para continuar';
    }

    if (value.length < 6) {
      return 'Sua senha precisa ter pelo menos 6 caracteres';
    }

    return null;
  }

  bool isValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  Future<void> login(BuildContext context) async {
    if (!isValid()) {
      return;
    }

    ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);

    _showSnakBar(scaffold);
    try {
      await _authUC(email, password);

      Get.toNamed(Routes.home);
    } on DioException catch (e) {
      _hideSnakBar(scaffold);
      _showFailedLoginSnackBar(scaffold, context, e);

      clear();
    } finally {
      _hideSnakBar(scaffold);
    }
  }

  void _showFailedLoginSnackBar(
      ScaffoldMessengerState scaffold, BuildContext context, DioException e) {
    scaffold.showSnackBar(
      SnackBar(
        content: Text(e.response?.data['message'] ?? 'Ocorreu um erro, tente novamente.'),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _showSnakBar(ScaffoldMessengerState scaffold) {
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Fazendo login...'),
      ),
    );
  }

  void _hideSnakBar(ScaffoldMessengerState scaffold) {
    scaffold.hideCurrentSnackBar();
  }
}
