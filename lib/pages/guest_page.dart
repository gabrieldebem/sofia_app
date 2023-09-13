import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/bindings/routes.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Sofia App',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: Center(
                  child: TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(10.0),
                      shadowColor: MaterialStateProperty.all<Color>(
                        Colors.black,
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.signup);
                    },
                    child: Text(
                      'Quero criar uma conta',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TextButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(10.0),
                    shadowColor: MaterialStateProperty.all<Color>(
                      Colors.black,
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.login);
                  },
                  child: Text(
                    'Já tenho uma conta',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
