import 'package:flutter/material.dart';
import 'package:on_it/quiz_brain.dart';
import 'questions.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(
      Quizy(),
    );

class Quizy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      home: Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
          child: Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: QuizPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;

  List<bool> answer = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.questionBank[questionNumber].questionText,
                  style: TextStyle(
                    backgroundColor: Colors.brown,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Card(
              child: Expanded(
                  flex: 5,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        color: Colors.lightBlueAccent,
                        child: Center(
                          child: Text(
                            'True',
                            style: TextStyle(
                              backgroundColor: Colors.pink,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          quizBrain.questionBank[questionNumber].questionAnswer;

                          setState(() {
                            questionNumber++;
                          });
                        },
                      )))),
          SizedBox(height: 20.0),
          Card(
              child: Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'False',
                            style: TextStyle(
                              backgroundColor: Colors.green,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          quizBrain.questionBank[questionNumber].questionAnswer;

                          setState(() {
                            questionNumber++;
                          });
                        },
                      )))),
          SizedBox(height: 20.0),
        ]);
  }
}

/* question1: 'you can lead a cow down stairs and not upstairs', false,
    question2: 'approximately one quarter of human bones aere in the feet', true
    question3: 'A slug\'s blood is green', false,
      */
