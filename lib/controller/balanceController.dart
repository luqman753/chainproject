import 'package:get/state_manager.dart';

import '../domain/Service.dart';
import '../models/balance.dart';

class BalanceController extends GetxController {
  var isLoading = true.obs;
  var balanceList = Balance().obs;
  var pointValue = 0.obs;

  @override
  void onInit() {
    fetchBalance();
    super.onInit();
  }
fetchBalance() async {
    try {
      isLoading(true);
      var balance = await RemoteServices.fetchBalance();
      if (balance != null) {
        balanceList.value = balance ;
      }
    } finally {
      isLoading(false);
    }
   
  }

}
