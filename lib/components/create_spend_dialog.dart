import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sofia_app/controllers/create_spend.controller.dart';
import 'package:sofia_app/enums/spend_type.dart';
import 'package:sofia_app/enums/transaction_category.dart';

class CreateSpendDialog extends StatefulWidget {
  const CreateSpendDialog({super.key});

  @override
  State<CreateSpendDialog> createState() => _CreateSpendDialogState();
}

class _CreateSpendDialogState extends State<CreateSpendDialog> {
  final CreateSpendController _controller = Get.put(CreateSpendController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Container(
          height: 430,
          width: 500,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Criar Transação',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      onChanged: (value) =>
                          _controller.onCategoryChanged(value.toString()),
                      validator: (value) => _controller.validateCategory(value),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Categoria',
                      ),
                      items: _getCategories(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _controller.descriptionController,
                      onChanged: (value) =>
                          _controller.onDescriptionChanged(value.toString()),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descrição',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controller.amountController,
                      onChanged: (value) =>
                          _controller.onAmountChanged(value.toString()),
                      validator: (value) => _controller.validateAmount(value),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          symbol: 'R\$',
                          decimalDigits: 2,
                        ),
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Valor',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controller.dateController,
                      onChanged: (value) =>
                          _controller.onDateChanged(DateFormat('dd/MM/yyyy')
                              .parse(value.toString())),
                      validator: (value) => _controller.validateDate(value),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8),
                      ],
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () => _controller.pickDate(context),
                          child: const Icon(Icons.calendar_today),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'Data',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          onPressed: () {
                            _controller.submit(context);
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
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
        ),
      ),
    );
  }

  List<DropdownMenuItem<dynamic>> _getCategories() {
    return TransactionCategory.values
        .map(
          (e) => DropdownMenuItem(
            value: e.getValue(),
            child: Text(
              e.getValue(),
            ),
          ),
        )
        .toList();
  }
}
