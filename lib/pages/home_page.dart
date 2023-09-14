import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/bindings/routes.dart';
import 'package:sofia_app/controllers/home.controller.dart';
import 'package:sofia_app/components/create_spend_dialog.dart';
import 'package:sofia_app/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.profile,
                    arguments:
                        ProfilePageArguments(user: _homeController.user));
              },
              icon: const Icon(Icons.person),
            ),
          ],
          shadowColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            "Bem vindo, ${_homeController.user.name}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              await _homeController.fetchSpends();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Seus Gastos",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 600,
                    child: _homeController.spends.isEmpty
                        ? Center(
                            child: Text(
                              'Nenhum gasto cadastrado',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: _homeController.spends.length,
                            itemBuilder: (ctx, index) {
                              return ListTile(
                                isThreeLine: true,
                                visualDensity: const VisualDensity(vertical: 2),
                                title: Text(
                                  _homeController.spends[index].category
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  _homeController
                                          .spends[index].description.isEmpty
                                      ? "Sem descrição"
                                      : _homeController
                                          .spends[index].description,
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
                  ),
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) => const CreateSpendDialog());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
