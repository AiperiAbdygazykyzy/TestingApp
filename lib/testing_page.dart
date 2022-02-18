import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabak6_tirkeme5/custom_button.dart';
import 'package:sabak6_tirkeme5/quiz_brain.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({Key key}) : super(key: key);

  @override
  _TestingPageState createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  List<Widget> icons = <Widget>[];

  Widget correctIcon = const Padding(
    padding: EdgeInsets.only(right: 10.0),
    child: FaIcon(
      FontAwesomeIcons.check,
      color: Color(0xff73c69d),
    ),
  );
  Widget wongIcon = const Padding(
    padding: EdgeInsets.only(right: 10.0),
    child: FaIcon(
      FontAwesomeIcons.times,
      color: Color(0xfff2a67b),
    ),
  );

  String question = 'Question';
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    bringTheFirstPage();
  }

  void bringTheFirstPage() {
    question = quizBrain.getQuestion();
  }

  userAnswered(bool answer) {
    // log('answer == correctAnswer: ===> $answer');
    bool correctAnswer = quizBrain.getAnswer();
    // log('answer == correctAnswer: ${answer == correctAnswer}');
    if (answer == correctAnswer) {
      icons.add(correctIcon);
    } else {
      icons.add(wongIcon);
    }

    quizBrain.getNext();
    question = quizBrain.getQuestion();

    if (question == 'Жообунуз учун чон рахмат!') {
      isFinished = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff3d5875),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Stack(
            children: [
              const SizedBox(),
              Positioned(
                top: _height / 3,
                left: 2,
                right: 2,
                child: Text(
                  question,
                  style: const TextStyle(color: Colors.white, fontSize: 29.0),
                  textAlign: TextAlign.center,
                ),
              ),
              // Кыска жолу (isFinished) == true, (!isFinished) == false.
              if (isFinished)
                Positioned(
                  bottom: _height * 0.2,
                  child: CustomButton(
                      buttonText: 'Кайрадан баштаныз',
                      onPressed: () {
                        quizBrain.reset();
                        question = quizBrain.getQuestion();
                        isFinished = false;
                        icons = <Widget>[];
                        setState(() {});
                      }),
                )
              else
                Positioned(
                  bottom: _height * 0.05,
                  child: Column(
                    children: [
                      CustomButton(
                        onPressed: () => userAnswered(true),
                        // setState(() {
                        //   icons.add(correctIcon);
                        //   quizBrain.getNext();
                        //   question = quizBrain.getQuestion();
                        // });

                        buttonText: 'Туура',
                        bgColor: const Color(0xff73c69d),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomButton(
                        onPressed: () => userAnswered(false),
                        buttonText: 'Туура эмес',
                        bgColor: const Color(0xfff2a67b),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),

              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 15,
                  ),
                  child: Row(
                    children: icons,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
