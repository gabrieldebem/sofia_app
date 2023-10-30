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
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {
    Future.wait([
      _homeController.fetchSpends(),
      _homeController.fetchUser(),
    ]);
    super.initState();
  }

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
            if (_homeController.user.id == null) {
              await _homeController.fetchUser();
            }
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
                  child: _homeController.transactions.isEmpty
                      ? Center(
                          child: Text(
                            'Nenhum gasto cadastrado',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: _homeController.transactions.length,
                          itemBuilder: (ctx, index) {
                            return ListTile(
                              isThreeLine: true,
                              visualDensity: const VisualDensity(vertical: 2),
                              title: Text(
                                _homeController.transactions[index].category
                                    .toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "R\$ ${_homeController.transactions[index].amount} - ${_homeController.transactions[index].description}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              trailing: IconButton(
                                  onPressed: () =>
                                      _homeController.deleteTransaction(
                                          _homeController.transactions[index]),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            );
                          },
                        ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () => Get.toNamed(Routes.summary),
                  child: const Text(
                    "Pra onde foi meu dinheiro?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () async {
            await Get.dialog(const CreateSpendDialog());
            await _homeController.fetchSpends();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
