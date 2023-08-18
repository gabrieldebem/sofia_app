import 'package:flutter/material.dart';
import 'package:sofia_app/bindings/route.binding.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sofia App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child: TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(10.0),
                      shadowColor: MaterialStateProperty.all<Color>(
                        Colors.black,
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteBinding.signup);
                    },
                    child: Text(
                      'Quero criar uma conta',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
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
                        Theme.of(context).colorScheme.primary),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteBinding.login);
                  },
                  child: Text(
                    'Já tenho uma conta',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
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
