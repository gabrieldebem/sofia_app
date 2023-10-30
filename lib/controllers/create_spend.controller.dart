import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sofia_app/bindings/routes.dart';
import 'package:sofia_app/use_cases/create_spend_uc.dart';

class CreateSpendController extends GetxController {
  final CreateSpendUC _createSpendUC = Get.put(CreateSpendUC());

  final _formKey = GlobalKey<FormState>();
  final _amount = ''.obs;
  final _description = ''.obs;
  final _category = ''.obs;
  final Rx<DateTime> _date = DateTime.now().obs;

  GlobalKey<FormState> get formKey => _formKey;
  String get amount => _amount.value;
  String get description => _description.value;
  String get category => _category.value;
  DateTime get date => _date.value;

  set amount(String value) => _amount(value);
  set description(String value) => _description(value);
  set category(String value) => _category(value);
  set date(DateTime value) => _date(value);

  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void onAmountChanged(String value) => amount = value;

  void onDescriptionChanged(String value) => description = value;

  void onCategoryChanged(String value) => category = value;

  void onDateChanged(DateTime value) => date = value;

  @override
  void onInit() {
    clear();

    amountController.addListener(() => amount = amountController.text);
    descriptionController
        .addListener(() => description = descriptionController.text);
    categoryController.addListener(() => category = categoryController.text);
    dateController
        .addListener(() => date = DateTime.parse(dateController.text));

    super.onInit();
  }

  void clear() {
    amountController.clear();
    descriptionController.clear();
    categoryController.clear();
    dateController.clear();
  }

  String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ainda não sabemos o valor';
    }

    return null;
  }

  String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Defina uma categoria';
    }

    return null;
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Quando foi isso?';
    }

    return null;
  }

  bool isValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  submit(BuildContext context) async {
    if (!isValid()) {
      return;
    }
    try {
      await _createSpendUC(
        amount: NumberFormat('###.00', 'pt_BR')
            .parse(amount.replaceAll('R\$', ''))
            .toDouble(),
        description: description,
        category: category,
        date: date,
      );

      Get.showSnackbar(const GetSnackBar(
        title: 'Sucesso!',
        message: 'Sua transação foi registrada com sucesso!',
        duration: Duration(seconds: 5),
      ));
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Ops!',
        message:
            e.response?.data['message'].toString() ?? 'Erro ao criar despesa',
        duration: const Duration(seconds: 5),
      ));
    } finally {
      Get.offAllNamed(Routes.home);
      clear();
    }
  }

  pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }
}
