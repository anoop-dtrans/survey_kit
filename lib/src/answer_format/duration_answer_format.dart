import 'package:survey_kit/survey_kit.dart';

class DurationAnswerFormat implements AnswerFormat {
  final Duration? defaultValue;
  final String hint;

  const DurationAnswerFormat({
    this.defaultValue,
    this.hint = '',
  }) : super();

  factory DurationAnswerFormat.fromJson(Map<String, dynamic> json) =>
      DurationAnswerFormat(
        defaultValue: json["defaultValue"] != null
            ? Duration(minutes: json["defaultValue"])
            : null,
        hint: json["hint"] ?? '',
      );

  Map<String, dynamic> toJson() => {"defaultValue": defaultValue, "hint": hint};
}
