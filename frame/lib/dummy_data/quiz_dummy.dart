abstract class Quiz {
  String? question;
  int? answer;

  /// false 면 0 true 면 1
  /// 객관식은 0번부터

  Quiz({required this.question, required this.answer});
}

class ChoiceQuiz extends Quiz {
  List<String> selections = List.filled(4, 'emtpy message');

  ChoiceQuiz({required super.question,
    required this.selections,
    required super.answer});
}

class TFQuiz extends Quiz {
  TFQuiz({required super.question, required super.answer});
}

class QuizDummy {
  static List<Quiz> quizes = [

  ChoiceQuiz

  (

  question: 'UI를 완성하고 나면 쉴 수 있나요?',
  selections: [
  '절대 무리',
  '불가능',
  '일해라',
  '가능',
  ],
  answer: 0),
  TFQuiz(question: '오늘 안에 완성할 수 있을까요?', answer: 1),
  ChoiceQuiz(question: '확통 가능?', selections: [
  'ㅁ?ㄹ',
  '42',
  '가능',
  '불가능'
  ], answer: 2),
  TFQuiz(question: '이 프로젝트 잘 될까?', answer: 1),
  ];
}
