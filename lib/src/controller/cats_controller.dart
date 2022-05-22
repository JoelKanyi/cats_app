import 'package:cats_app/src/services/dio_client.dart';
import 'package:get/get.dart';

class CatsController extends GetxController {
  var isLoading = true.obs;
  var catsList = [].obs;

  @override
  void onInit() {
    fetchCats();
    super.onInit();
  }

  void fetchCats() async {
    try {
      isLoading(true);
      var cats = await DioClient.getCats();
      if (cats != null) {
        catsList.value = cats;
      }
    } finally {
      isLoading(false);
    }
  }
}
