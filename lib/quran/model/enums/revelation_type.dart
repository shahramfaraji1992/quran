import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum RevelationType {
  @JsonValue('Meccan')
  Meccan,

  @JsonValue('Medinan')
  Medinan,
}
