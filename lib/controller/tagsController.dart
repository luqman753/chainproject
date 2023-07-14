import 'package:get/state_manager.dart';

import '../domain/Service.dart';
import '../models/Tags.dart';

class TagsController extends GetxController {
  var isLoading = true.obs;
  var tagsList = <Tags>[].obs;
  var tagColor=0;
  
  @override
  void onInit() {
    fetchTags();
    super.onInit();
  }
fetchTags() async {
    try {
      isLoading(true);
      var tags = await RemoteServices.fetchTags();
      if (tags != null) {

        // ignore: invalid_use_of_protected_member
        tagsList.value = tags ;
        tagsList.add(Tags(id:"1234",name:"ALL", isActive: true,v:0));
      }
    } finally {
      isLoading(false);
    }
   
  }

  
  

}
