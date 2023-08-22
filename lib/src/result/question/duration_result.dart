import 'package:survey_kit/survey_kit.dart';

class DurationQuestionResult extends QuestionResult<Duration?> {
  DurationQuestionResult({
    required Identifier id,
    required DateTime startDate,
    required DateTime endDate,
    required String valueIdentifier,
    required Duration? result,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory DurationQuestionResult.fromJson(Map<String, dynamic> json) =>
      DurationQuestionResult(
        id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
        valueIdentifier: json['valueIdentifier'] as String,
        result: json['result'] != null
            ? Duration(minutes: json['result'] ?? 0)
            : null,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id?.toJson(),
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'result': result?.inMinutes,
        'valueIdentifier': valueIdentifier,
      };

  @override
  List<Object?> get props => [id, startDate, endDate, valueIdentifier, result];
}
