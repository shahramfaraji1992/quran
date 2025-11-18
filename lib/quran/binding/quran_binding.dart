import 'package:get/get.dart';
import 'package:quran_app/quran/view_model/quran_controller.dart';

class QuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuranController());
  }
}
