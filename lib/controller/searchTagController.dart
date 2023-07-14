import 'package:get/state_manager.dart';

import '../domain/Service.dart';
import '../models/searchTag.dart';

class SearchtagController extends GetxController {
  var isLoading = true.obs;
var tagsList = SearchTag().obs;
  var pointValue = 0.obs;

  @override
  void onInit() {
    fetchTags("bread");
    super.onInit();
  }
fetchTags(name) async {
    try {
      isLoading(true);
      var tags = await RemoteServices.fetchSearchTags(name);
      if (tags != null) {
        tagsList.value = tags;
      }
    } finally {
      isLoading(false);
    }
   
  }

  
  

}
