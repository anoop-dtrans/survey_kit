import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey_kit/src/answer_format/duration_answer_format.dart';
import 'package:survey_kit/src/result/question/duration_result.dart';
import 'package:survey_kit/survey_kit.dart';

class DurationAnswerView extends StatefulWidget {
  final QuestionStep questionStep;
  final DurationQuestionResult? result;

  const DurationAnswerView({
    Key? key,
    required this.questionStep,
    required this.result,
  }) : super(key: key);

  @override
  _DurationAnswerViewState createState() => _DurationAnswerViewState();
}

class _DurationAnswerViewState extends State<DurationAnswerView> {
  final DateTime _startDate = DateTime.now();
  late Duration? _result;

  @override
  void initState() {
    super.initState();
    _result =
        (widget.questionStep.answerFormat as DurationAnswerFormat).defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: widget.questionStep,
      resultFunction: () => DurationQuestionResult(
        id: widget.questionStep.stepIdentifier,
        startDate: _startDate,
        endDate: DateTime.now(),
        valueIdentifier: _result.inMinutes.toString(),
        result: _result,
      ),
      isValid: widget.questionStep.isOptional || _result != null,
      title: Text(
        widget.questionStep.title,
        style: Theme.of(context).textTheme.displayMedium,
        textAlign: TextAlign.center,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Text(
              widget.questionStep.text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            height: 320.0,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              initialTimerDuration: _result ?? Duration.zero,
              onTimerDurationChanged: (value) {
                setState(() => _result = value);
              },
            ),
          )
        ],
      ),
    );
  }
}
