import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/bindings/route.binding.dart';
import 'package:sofia_app/services/storage.service.dart';
import 'package:sofia_app/services/users.service.dart';
import 'package:sofia_app/view_models/auth_response.dart';

class LoginController extends GetxController {
  UserService userService = Get.put(UserService());
  IStorageService _storageService = Get.put(StorageService());

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
      AuthResponse response = await userService.auth(email, password);
      await _storageService.set('token', response.accessToken!);
      print(await _storageService.get('token'));
      Navigator.of(context).pushNamed(RouteBinding.home);
    } catch (e) {
      print(e);
      _hideSnakBar(scaffold);
      _showFailedLoginSnackBar(scaffold, context, e);
      clear();
    } finally {
      _hideSnakBar(scaffold);
    }
  }

  void _showFailedLoginSnackBar(
      ScaffoldMessengerState scaffold, BuildContext context, Object e) {
    scaffold.showSnackBar(
      SnackBar(
        content: Text(e.toString()),
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
