import 'package:sabak6_tirkeme5/quiz_model.dart';

class QuizBrain {
  int _index = 0;

  List<QuizModel> questionsAndAnswers = <QuizModel>[
    QuizModel(
        question: 'Программист болуу үчүн абдан акылдуу болуу керек',
        answer: false),
    QuizModel(question: 'Программалоо бул мырзалар үчүн', answer: false),
    QuizModel(
        question: 'Программалоодо эсеп ар дайым "0" дон башталат',
        answer: true),
    QuizModel(
        question:
            'Бардык эле программисттер техниканы дагы мыкты өздөштүрүүсү кажет',
        answer: false),
    QuizModel(
        question: 'Дүйнөдогү биринчи программист бул аял киши болгон',
        answer: true),
    QuizModel(
        question:
            'Дүйнөдө 8500гө жакын программалоо тилдери бар, бирок көбүнчө колдонулган тилдердин саны ондон ашык',
        answer: true),
    QuizModel(
        question: 'Программалоону оор тилден баштап үйрөнгөн жакшы',
        answer: false),
    QuizModel(
        question:
            '"Программист" кесиби дүйнөдөгү эң көп талап кылынган он кесиптин бири',
        answer: true),
    QuizModel(
        question: 'Гений математик адамдар гана бул кесипти аркалай алат',
        answer: false),
    QuizModel(
        question: 'Кээде көйгөйдү эртең мененкиге калтыруу жакшы',
        answer: true),
  ];

  String getQuestion() {
    if (_index < questionsAndAnswers.length) {
      // log('getQuestion._index: $_index');
      // log('question: ${questionsAndAnswers[_index].question}');
      return questionsAndAnswers[_index].question;
    } else {
      return 'Жообунуз учун чон рахмат!';
    }
  }

  void getNext() {
    _index++;
  }

  bool getAnswer() {
    if (_index < questionsAndAnswers.length) {
      return questionsAndAnswers[_index].answer;
    }
  }

  void reset() {
    _index = 0;
  }
}

final QuizBrain quizBrain = QuizBrain();
