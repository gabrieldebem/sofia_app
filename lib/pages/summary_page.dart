import 'package:flutter/material.dart';
import 'package:sofia_app/controllers/summary.controller.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final SummaryController _summaryController = SummaryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pra onde foi seu dinheiro?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Filtros",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: const Text('Data inicial'),
            subtitle: Text(
              '${_summaryController.initialDate.day}/${_summaryController.initialDate.month}/${_summaryController.initialDate.year}',
            ),
            trailing: IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _summaryController.initialDate,
                  firstDate: DateTime(2021),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      _summaryController.initialDate = value;
                    });
                  }
                });
              },
              icon: Icon(
                Icons.calendar_today,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: const Text('Data final'),
            subtitle: Text(
              '${_summaryController.finalDate.day}/${_summaryController.finalDate.month}/${_summaryController.finalDate.year}',
            ),
            trailing: IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _summaryController.finalDate,
                  firstDate: DateTime(2021),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      _summaryController.finalDate = value;
                    });
                  }
                });
              },
              icon: Icon(
                Icons.calendar_today,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onPressed: () async {
                await _summaryController.fetchSpendsPercentage();
                setState(() {});
              },
              child: const Text("Buscar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ..._summaryController.spendsPercentage.map((percentage) {
                    return ListTile(
                      title: Text("Categoria: ${percentage.category}"),
                      subtitle: Text("Porcentagem: ${percentage.percentage}"),
                    );
                  }).toList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
