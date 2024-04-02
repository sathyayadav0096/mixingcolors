import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DataController extends GetxController {
  var count = 0.obs;
  RxString name = 'Sahya'.obs;
  var int = RxInt(10);

  incremental() => count++;
}
