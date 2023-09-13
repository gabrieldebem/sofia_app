import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sofia_app/enums/spend_type.dart';
import 'package:sofia_app/services/spends.service.dart';

class CreateSpendController extends GetxController {
  final SpendService _spendService = Get.put(SpendService());

  final _formKey = GlobalKey<FormState>();
  final _amount = ''.obs;
  final _description = ''.obs;
  final _category = ''.obs;
  final _date = ''.obs;
  final _type = ''.obs;

  GlobalKey<FormState> get formKey => _formKey;
  String get amount => _amount.value;
  String get description => _description.value;
  String get category => _category.value;
  String get date => _date.value;
  String get type => _type.value;

  set amount(String value) => _amount(value);
  set description(String value) => _description(value);
  set category(String value) => _category(value);
  set date(String value) => _date(value);
  set type(String value) => _type(value);

  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  void onAmountChanged(String value) => amount = value;

  void onDescriptionChanged(String value) => description = value;

  void onCategoryChanged(String value) => category = value;

  void onDateChanged(String value) => date = value;

  void onTypeChanged(String value) => type = value;

  @override
  void onInit() {
    clear();

    amountController.addListener(() => amount = amountController.text);
    descriptionController
        .addListener(() => description = descriptionController.text);
    categoryController.addListener(() => category = categoryController.text);
    dateController.addListener(() => date = dateController.text);
    typeController.addListener(() => type = typeController.text);

    super.onInit();
  }

  void clear() {
    amountController.clear();
    descriptionController.clear();
    categoryController.clear();
    dateController.clear();
    typeController.clear();
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

  String? validateType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Foi uma despesa ou uma receita?';
    }

    if (value != SpendType.expense.name && value != SpendType.income.name) {
      return 'Tipo inválido';
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
      await _spendService.createSpend(
        amount: NumberFormat('###.00', 'pt_BR').parse(amount.replaceAll('R\$', '')).toDouble(),
        description: description,
        category: category,
        date: DateFormat('dd/MM/yyyy').parse(date),
        type: type,
      );

      ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
      _showSuccessSnackBar(scaffold);
    } catch (e) {
      print(e.toString());
    } finally {
      clear();
      Get.back();
    }
  }

  _showSuccessSnackBar(ScaffoldMessengerState scaffold) {
    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Sua despesa foi criada com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );
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
