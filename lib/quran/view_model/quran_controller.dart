import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/quran/model/quran_edition_model.dart';
import 'package:quran_app/quran/repositories/quran_repository.dart';

class QuranController extends GetxController {
  @override
  onInit() {
    super.onInit();
    final box = Hive.box<QuranEditionModel>('quranBox');
    final cachedQuran = box.get('edition');
    if (cachedQuran != null) {
      quranList.clear();
      quranList.addAll(cachedQuran.data!.surahs!.map((s) => s));
    } else {
      fetchQuran();
    }
    loadAyahCounts();
  }

  Rxn<QuranEditionModel> quranEditionModel = Rxn<QuranEditionModel>();
  var quranList = <Surah>[].obs;
  final ayahCounts = <int, int>{}.obs;
  final isLoading = false.obs;
  QuranRepository quranRepository = QuranRepository();
  final selectedAyah = Rxn<Ayah>();
  Future<void> loadAyahCounts() async {
    isLoading.value = true;
    ayahCounts.value = await quranRepository.getAyahCountsForAllPages();
    isLoading.value = false;
  }

  Future<void> fetchQuran() async {
    var result = await quranRepository.fetchQuran();
    result.fold(
      (failure) {
        print(failure.message);
        print('Faliled to fetch Quran data');
      },
      (quranData) {
        print('Quran data fetched successfuly $quranData');
        final box = Hive.box<QuranEditionModel>('quranBox');
        box.put('edition', quranData);
        quranList.clear();
        quranList.addAll(quranData.data!.surahs!.map((s) => s));
        print('Quran List Updated:${quranList.length}');
      },
    );
  }

  List<Ayah> getAyahsForPage(int pageNumber) {
    final result = <Ayah>[];

    for (final surah in quranList) {
      for (final ayah in surah.ayahs ?? []) {
        if (ayah.page == pageNumber) {
          result.add(ayah);
        }
      }
    }

    return result;
  }

  String? getSurahNameByAyah(Ayah ayah) {
    return quranList
        .firstWhereOrNull(
          (surah) =>
              surah.ayahs?.any(
                (a) =>
                    a.page == ayah.page &&
                    a.numberInSurah == ayah.numberInSurah,
              ) ??
              false,
        )
        ?.name;
  }
  // Rx<QuranModel> recognizedVerse = QuranModel(text: '', isFinal: false).obs;
  // RxList<String> words = <String>[].obs;
  // RxBool sessionEnded = false.obs;
  // final String targetVerse = 'إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ';
  // void updateVerse(String text, {bool isFinal = false}) {
  //   recognizedVerse.value = QuranModel(text: text, isFinal: isFinal);
  //   words.value = text.trim().split(' ');
  // }

  // void endSession() {
  //   sessionEnded.value = true;
  // }

  // void resetSession() {
  //   recognizedVerse.value = QuranModel(text: '', isFinal: false);
  //   words.clear();
  //   sessionEnded.value = false;
  // }

  // List<TextSpan> getHighlightedWords() {
  //   final targetWords = targetVerse.trim().split(' ');
  //   final spokenWords = recognizedVerse.value.text.trim().split(' ');

  //   return targetWords.map((word) {
  //     final isMatched = spokenWords.contains(word);
  //     return TextSpan(
  //       text: '$word ',
  //       style: TextStyle(
  //         color: isMatched ? Colors.green : Colors.grey,
  //         fontWeight: isMatched ? FontWeight.bold : FontWeight.normal,
  //         fontSize: 20,
  //       ),
  //     );
  //   }).toList();
  // }
}
