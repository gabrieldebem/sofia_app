import 'package:get/get.dart';
import 'package:sofia_app/models/transaction.dart';
import 'package:sofia_app/models/user.dart';
import 'package:sofia_app/use_cases/delete_transaction.uc.dart';
import 'package:sofia_app/use_cases/get_user_uc.dart';
import 'package:sofia_app/use_cases/list_spends_uc.dart';

class HomeController extends GetxController {
  final GetUserUC _getUserUC = Get.put(GetUserUC());
  final ListSpendsUC _listSpendsUC = Get.put(ListSpendsUC());
  final DeleteTransactionUC _deleteTransactionUC =
      Get.put(DeleteTransactionUC());

  final Rx<User> _user = User().obs;
  final RxList<Transaction> _transactions = <Transaction>[].obs;

  User get user => _user.value;
  List<Transaction> get transactions => _transactions;

  set user(User? value) => _user.value = value!;
  set transactions(List<Transaction> value) => _transactions.value = value;

  Future<void> fetchUser() async {
    user = await _getUserUC.execute();
  }

  Future<void> fetchSpends() async {
    transactions = await _listSpendsUC.execute();
  }

  Future<void> deleteTransaction(Transaction transaction) async {
    await _deleteTransactionUC(transaction);
    await fetchSpends();
  }
}
