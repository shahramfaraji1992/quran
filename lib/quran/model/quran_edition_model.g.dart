// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_edition_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranEditionModelAdapter extends TypeAdapter<QuranEditionModel> {
  @override
  final int typeId = 0;

  @override
  QuranEditionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranEditionModel(
      code: fields[0] as int?,
      status: fields[1] as String?,
      data: fields[2] as Data?,
    );
  }

  @override
  void write(BinaryWriter writer, QuranEditionModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranEditionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      surahs: (fields[0] as List?)?.cast<Surah>(),
      edition: fields[1] as Edition?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.surahs)
      ..writeByte(1)
      ..write(obj.edition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EditionAdapter extends TypeAdapter<Edition> {
  @override
  final int typeId = 2;

  @override
  Edition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Edition(
      identifier: fields[0] as String?,
      language: fields[1] as String?,
      name: fields[2] as String?,
      englishName: fields[3] as String?,
      format: fields[4] as String?,
      type: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Edition obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.identifier)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.englishName)
      ..writeByte(4)
      ..write(obj.format)
      ..writeByte(5)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SurahAdapter extends TypeAdapter<Surah> {
  @override
  final int typeId = 3;

  @override
  Surah read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Surah(
      number: fields[0] as int?,
      name: fields[1] as String?,
      englishName: fields[2] as String?,
      englishNameTranslation: fields[3] as String?,
      revelationType: fields[4] as String?,
      ayahs: (fields[5] as List?)?.cast<Ayah>(),
    );
  }

  @override
  void write(BinaryWriter writer, Surah obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.englishName)
      ..writeByte(3)
      ..write(obj.englishNameTranslation)
      ..writeByte(4)
      ..write(obj.revelationType)
      ..writeByte(5)
      ..write(obj.ayahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AyahAdapter extends TypeAdapter<Ayah> {
  @override
  final int typeId = 4;

  @override
  Ayah read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ayah(
      number: fields[0] as int?,
      text: fields[1] as String?,
      numberInSurah: fields[2] as int?,
      juz: fields[3] as int?,
      manzil: fields[4] as int?,
      page: fields[5] as int?,
      ruku: fields[6] as int?,
      hizbQuarter: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Ayah obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.numberInSurah)
      ..writeByte(3)
      ..write(obj.juz)
      ..writeByte(4)
      ..write(obj.manzil)
      ..writeByte(5)
      ..write(obj.page)
      ..writeByte(6)
      ..write(obj.ruku)
      ..writeByte(7)
      ..write(obj.hizbQuarter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyahAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranEditionModel _$QuranEditionModelFromJson(Map<String, dynamic> json) =>
    QuranEditionModel(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuranEditionModelToJson(QuranEditionModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  surahs: (json['surahs'] as List<dynamic>?)
      ?.map((e) => Surah.fromJson(e as Map<String, dynamic>))
      .toList(),
  edition: json['edition'] == null
      ? null
      : Edition.fromJson(json['edition'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'surahs': instance.surahs,
  'edition': instance.edition,
};

Edition _$EditionFromJson(Map<String, dynamic> json) => Edition(
  identifier: json['identifier'] as String?,
  language: json['language'] as String?,
  name: json['name'] as String?,
  englishName: json['englishName'] as String?,
  format: json['format'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$EditionToJson(Edition instance) => <String, dynamic>{
  'identifier': instance.identifier,
  'language': instance.language,
  'name': instance.name,
  'englishName': instance.englishName,
  'format': instance.format,
  'type': instance.type,
};

Surah _$SurahFromJson(Map<String, dynamic> json) => Surah(
  number: (json['number'] as num?)?.toInt(),
  name: json['name'] as String?,
  englishName: json['englishName'] as String?,
  englishNameTranslation: json['englishNameTranslation'] as String?,
  revelationType: json['revelationType'] as String?,
  ayahs: (json['ayahs'] as List<dynamic>?)
      ?.map((e) => Ayah.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SurahToJson(Surah instance) => <String, dynamic>{
  'number': instance.number,
  'name': instance.name,
  'englishName': instance.englishName,
  'englishNameTranslation': instance.englishNameTranslation,
  'revelationType': instance.revelationType,
  'ayahs': instance.ayahs,
};

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
  number: (json['number'] as num?)?.toInt(),
  text: json['text'] as String?,
  numberInSurah: (json['numberInSurah'] as num?)?.toInt(),
  juz: (json['juz'] as num?)?.toInt(),
  manzil: (json['manzil'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  ruku: (json['ruku'] as num?)?.toInt(),
  hizbQuarter: (json['hizbQuarter'] as num?)?.toInt(),
);

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
  'number': instance.number,
  'text': instance.text,
  'numberInSurah': instance.numberInSurah,
  'juz': instance.juz,
  'manzil': instance.manzil,
  'page': instance.page,
  'ruku': instance.ruku,
  'hizbQuarter': instance.hizbQuarter,
};
