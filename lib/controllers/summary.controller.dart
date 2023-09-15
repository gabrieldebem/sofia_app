import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sofia_app/models/percentage.dart';
import 'package:sofia_app/use_cases/get_spends_percentage_uc.dart';

class SummaryController extends GetxController {
  final GetSpendsPercentageUC _getSpendsPercentageUC = GetSpendsPercentageUC();

  final Rx<DateTime> _initialDate =
      DateTime.now().subtract(const Duration(days: 30)).obs;
  final Rx<DateTime> _finalDate = DateTime.now().obs;
  final RxList<Percentage> _spendsPercentage = <Percentage>[].obs;

  DateTime get initialDate => _initialDate.value;
  DateTime get finalDate => _finalDate.value;
  List<Percentage> get spendsPercentage => _spendsPercentage;

  set initialDate(DateTime value) => _initialDate.value = value;
  set finalDate(DateTime value) => _finalDate.value = value;
  set spendsPercentage(List<Percentage> value) => _spendsPercentage.value = value;

  TextEditingController initialDateController = TextEditingController();
  TextEditingController finalDateController = TextEditingController();

  @override
  void onInit() async {
      initialDateController.addListener(() {
        initialDate = DateTime.parse(initialDateController.text);
      });

      finalDateController.addListener(() {
        finalDate = DateTime.parse(finalDateController.text);
      });
      
      super.onInit();
    }

    fetchSpendsPercentage() async {
      spendsPercentage = await _getSpendsPercentageUC.execute(initialDate, finalDate);
    }
}
