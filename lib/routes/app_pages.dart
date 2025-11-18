import 'package:get/get.dart';
import 'package:quran_app/quran/binding/quran_binding.dart';
import 'package:quran_app/quran/view/quran_view.dart';

class AppRoutes {
  static const quran = '/quran';

  static final pages = [
    GetPage(
      name: quran,
      page: () => const QuranView(),
      binding: QuranBinding(),
    ),
  ];
}
