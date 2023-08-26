import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/controllers/home.controller.dart';
import 'package:sofia_app/components/create_spend_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.put(HomeController());
  @override
  void initState() {
    _homeController.fetchUser(context);
    _homeController.fetchSpends();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 1,
          shadowColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            "Bem vindo, ${_homeController.user.name}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: _homeController.spends.isEmpty
            ? const Center(
                child: Text('Você ainda não possui gastos registrados'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _homeController.spends.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    isThreeLine: true,
                    title: Text(
                      _homeController.spends[index].category,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      _homeController.spends[index].description.isEmpty
                          ? "Sem descrição"
                          : _homeController.spends[index].description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: Text(
                      "R\$ ${_homeController.spends[index].amount.toString()}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () async {
            await showDialog(context: context, builder: (context) => const CreateSpendDialog());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}