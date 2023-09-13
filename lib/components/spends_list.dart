import 'package:flutter/material.dart';
import 'package:sofia_app/models/spend.dart';

class SpendList extends StatelessWidget {
  final List<Spend> spends;

  const SpendList(this.spends, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: spends.isEmpty
          ? Center(
              child: Text(
                  'Nenhum gasto cadastrado',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: spends.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  isThreeLine: true,
                  visualDensity: const VisualDensity(vertical: 2),
                  title: Text(
                    spends[index].category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    spends[index].description.isEmpty
                        ? "Sem descrição"
                        : spends[index].description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: Text(
                    "R\$ ${spends[index].amount.toString()}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
