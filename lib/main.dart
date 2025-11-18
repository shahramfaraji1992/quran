import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/quran/model/quran_edition_model.dart';

import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuranEditionModelAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(SurahAdapter());
  Hive.registerAdapter(EditionAdapter());
  Hive.registerAdapter(AyahAdapter());
  await Hive.openBox<QuranEditionModel>('quranBox');
  runApp(
    GetMaterialApp(initialRoute: AppRoutes.quran, getPages: AppRoutes.pages),
  );
}
