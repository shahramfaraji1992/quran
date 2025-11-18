import 'package:dartz/dartz.dart';

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_app/quran/model/failur_model.dart';
import 'package:quran_app/quran/model/quran_edition_model.dart';
import 'package:quran_app/quran/services/dio_client.dart';

class QuranRepository {
  final DioClient _dioClient = DioClient();
  Future<Either<FailureModel, QuranEditionModel>> fetchQuran() async {
    var result = await _dioClient.get('quran/quran-uthmani');

    if (result.statusCode == 200) {
      print('data is ${result.data}');
      return Right(QuranEditionModel.fromJson(result.data));
    }
    return Left(
      FailureModel(
        message: 'Failed to fetch Quran data',
        statusCode: result.statusCode ?? 500,
      ),
    );
  }

  Future<Map<int, int>> getAyahCountsForAllPages() async {
    final result = <int, int>{};

    for (int page = 1; page <= 604; page++) {
      final path = 'assets/coords/glyph_coords/$page.json';
      try {
        final jsonString = await rootBundle.loadString(path);
        final data = jsonDecode(jsonString) as List;
        final ayahSet = <String>{};

        for (final item in data) {
          final surah = item['surah_number'];
          final ayah = item['ayah_number'];
          ayahSet.add('$surah:$ayah');
        }

        result[page] = ayahSet.length;
      } catch (e) {
        print('خطا در صفحه $page: $e');
      }
    }

    return result;
  }

  Future<Either<FailureModel, QuranEditionModel>> fetchCiters() async {
    var result = await _dioClient.get('quran/quran-uthmani');

    if (result.statusCode == 200) {
      print('data is ${result.data}');
      return Right(QuranEditionModel.fromJson(result.data));
    }
    return Left(
      FailureModel(
        message: 'Failed to fetch Quran data',
        statusCode: result.statusCode ?? 500,
      ),
    );
  }
}
