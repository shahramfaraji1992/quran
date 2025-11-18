import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:quran_app/quran/model/quran_edition_model.dart';
import 'package:quran_app/quran/view_model/quran_controller.dart';

class QuranView extends GetView<QuranController> {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.quranList.isEmpty) {
            return const Center(child: Text('در حال بارگذاری...'));
          }

          return PageView.builder(
            itemCount: controller.ayahCounts.length,
            itemBuilder: (context, pageIndex) {
              final pageNumber = pageIndex + 1;
              final ayahsOnPage = controller.getAyahsForPage(pageNumber);
              final firstAyahOfSurah = ayahsOnPage.firstWhereOrNull(
                (ayah) => ayah.numberInSurah == 1,
              );
              final surahName = firstAyahOfSurah != null
                  ? controller.getSurahNameByAyah(firstAyahOfSurah)
                  : null;

              if (ayahsOnPage.isEmpty) {
                return Center(child: Text('صفحه $pageNumber بدون آیه است.'));
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (surahName != null)
                      Text(
                        surahName,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Obx(() {
                          final spans = <InlineSpan>[];

                          for (final ayah in ayahsOnPage) {
                            final isSelected =
                                controller.selectedAyah.value == ayah;

                            spans.add(
                              TextSpan(
                                text:
                                    '${ayah.text ?? ''} ﴿${ayah.numberInSurah}﴾ ',
                                style: TextStyle(
                                  backgroundColor: isSelected
                                      ? Colors.teal
                                      : null,
                                ),
                                recognizer: LongPressGestureRecognizer()
                                  ..onLongPress = () {
                                    controller.selectedAyah.value = ayah;
                                    _showAyahOptions(context, ayah);
                                  },
                              ),
                            );
                          }

                          return Text.rich(
                            TextSpan(
                              children: spans,
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Scheherazade',
                                height: 2,
                                color: Colors.black,
                              ),
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(thickness: 1.5),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }

  void _showAyahOptions(BuildContext context, Ayah ayah) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'آیه ${ayah.numberInSurah}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                  // اینجا می‌تونی پخش صوت یا ترجمه اضافه کنی
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('پخش صوت'),
              ),
            ],
          ),
        );
      },
    );
  }
}
