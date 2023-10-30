import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofia_app/models/user.dart';
import 'package:sofia_app/use_cases/revoke_token_uc.dart';

class ProfilePageArguments {
  final User user;

  ProfilePageArguments({required this.user});
}

class ProfilePage extends StatelessWidget {
  final RevokeTokenUC _revokeTokenUC = RevokeTokenUC();
  late final ProfilePageArguments arguments;

  ProfilePage({Key? key}) : super(key: key) {
    arguments = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                title: const Text('Nome:'),
                subtitle: Text(arguments.user.name!),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                )
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                style: ListTileStyle.list,
                title: const Text('Email:'),
                subtitle: Text(arguments.user.email!),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                )
              ),
              Expanded(child: Container()),
              TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(MediaQuery.of(context).size.width / 1.3, 50),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.red,
                  ),
                ),
                onPressed: _logout,
                child: Text('Sair',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logout() async {
    await _revokeTokenUC.execute();
  }
}
