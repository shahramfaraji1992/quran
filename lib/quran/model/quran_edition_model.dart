import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_edition_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class QuranEditionModel {
  @HiveField(0)
  int? code;

  @HiveField(1)
  String? status;

  @HiveField(2)
  Data? data;

  QuranEditionModel({this.code, this.status, this.data});

  factory QuranEditionModel.fromJson(Map<String, dynamic> json) =>
      _$QuranEditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuranEditionModelToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Data {
  @HiveField(0)
  List<Surah>? surahs;

  @HiveField(1)
  Edition? edition;

  Data({this.surahs, this.edition});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Edition {
  @HiveField(0)
  String? identifier;

  @HiveField(1)
  String? language;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? englishName;

  @HiveField(4)
  String? format;

  @HiveField(5)
  String? type;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  factory Edition.fromJson(Map<String, dynamic> json) =>
      _$EditionFromJson(json);

  Map<String, dynamic> toJson() => _$EditionToJson(this);
}

@HiveType(typeId: 3)
@JsonSerializable()
class Surah {
  @HiveField(0)
  int? number;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? englishName;

  @HiveField(3)
  String? englishNameTranslation;

  @HiveField(4)
  String? revelationType;

  @HiveField(5)
  List<Ayah>? ayahs;

  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => _$SurahFromJson(json);

  Map<String, dynamic> toJson() => _$SurahToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable()
class Ayah {
  @HiveField(0)
  int? number;

  @HiveField(1)
  String? text;

  @HiveField(2)
  int? numberInSurah;

  @HiveField(3)
  int? juz;

  @HiveField(4)
  int? manzil;

  @HiveField(5)
  int? page;

  @HiveField(6)
  int? ruku;

  @HiveField(7)
  int? hizbQuarter;

  Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
}


// import 'package:json_annotation/json_annotation.dart';
// import 'package:stream_audio/quran/model/enums/revelation_type.dart';

// part 'quran_edition_model.g.dart';

// @JsonSerializable()
// class QuranEditionModel {
//   int? code;
//   String? status;
//   Data? data;

//   QuranEditionModel({
//     this.code,
//     this.status,
//     this.data,
//   });
//   factory QuranEditionModel.fromJson(Map<String, dynamic> json) =>
//       _$QuranEditionModelFromJson(json);
//   Map<String, dynamic> toJson() => _$QuranEditionModelToJson(this);
// }

// @JsonSerializable()
// class Data {
//   List<Surah>? surahs;
//   Edition? edition;

//   Data({
//     this.surahs,
//     this.edition,
//   });
//   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
//   Map<String, dynamic> toJson() => _$DataToJson(this);

//   map(QuranEditionModel Function(dynamic surah) param0) {}
// }

// @JsonSerializable()
// class Edition {
//   String? identifier;
//   String? language;
//   String? name;
//   String? englishName;
//   String? format;
//   String? type;

//   Edition({
//     this.identifier,
//     this.language,
//     this.name,
//     this.englishName,
//     this.format,
//     this.type,
//   });
//   factory Edition.fromJson(Map<String, dynamic> json) =>
//       _$EditionFromJson(json);
//   Map<String, dynamic> toJson() => _$EditionToJson(this);
// }

// @JsonSerializable()
// class Surah {
//   int? number;
//   String? name;
//   String? englishName;
//   String? englishNameTranslation;
//   RevelationType? revelationType;
//   List<Ayah>? ayahs;

//   Surah({
//     this.number,
//     this.name,
//     this.englishName,
//     this.englishNameTranslation,
//     this.revelationType,
//     this.ayahs,
//   });
//   factory Surah.fromJson(Map<String, dynamic> json) => _$SurahFromJson(json);
//   Map<String, dynamic> toJson() => _$SurahToJson(this);
// }

// @JsonSerializable()
// class Ayah {
//   int? number;
//   String? text;
//   int? numberInSurah;
//   int? juz;
//   int? manzil;
//   int? page;
//   int? ruku;
//   int? hizbQuarter;
//   // @SajdaConverter()
//   // final SajdaUnion? sajda;

//   Ayah({
//     this.number,
//     this.text,
//     this.numberInSurah,
//     this.juz,
//     this.manzil,
//     this.page,
//     this.ruku,
//     this.hizbQuarter,
//     // this.sajda,
//   });
//   factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);
//   Map<String, dynamic> toJson() => _$AyahToJson(this);
// }
















// @JsonSerializable()
// class SajdaClass {
//   final int id;
//   final bool recommended;
//   final bool obligatory;

//   SajdaClass({
//     required this.id,
//     required this.recommended,
//     required this.obligatory,
//   });

//   factory SajdaClass.fromJson(Map<String, dynamic> json) =>
//       _$SajdaClassFromJson(json);
//   Map<String, dynamic> toJson() => _$SajdaClassToJson(this);
// }
