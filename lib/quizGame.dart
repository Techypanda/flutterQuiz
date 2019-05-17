import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'pages.dart';

List<String> answers = new List(3);
final List<String> CORRECTANSWERS = ["GOOGLE", "A TEMPLATE FOR CREATING A OBJECT.", "NO"];

class QuizIntroduction extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: createAppBar("Introduction"),
      body: Column(
        children: <Widget>[
          spacing(20.0),
          createQuestion("Quiz Introduction","This quiz will be about Flutter, and a small bit of Dart.", context, 25.0),
          spacing(220.0),
          SizedBox(width: 300.0, height: 60.0, child: RaisedButton(color: Color(0xFF64e379), splashColor: Color(0xFF64e379), disabledColor: Color(0xFF64e379),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(
                builder: (context) => Q1())
              );
            },
            child: Text("Begin Quiz")
          )),

        ],
      ),
    );
  }
}
class Q1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: createAppBar("Question 1"),
      body: Column(
        children: <Widget>[
          spacing(20.0),
          createQuestion("Question 1", "What company created Flutter?", context, 40.0),
          spacing(100.0),
          answer("Google", 1, context, Q2()),
          answer("Curtin", 1, context, Q2()),
          answer("Samsung", 1, context, Q2()),
          answer("Nintendo", 1, context, Q2()),
        ],
      )
    );
  }
}
class Q2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: createAppBar("Question 2"),
      body: Column(
        children: <Widget>[
          spacing(20.0),
          createQuestion("Question 2", "Which of these best describes a class?", context, 40.0),
          answer("An object instantiation.", 2, context, Q3()),
          answer("A description for the end-user of how the object will work", 2, context, Q3()),
          answer("Taking the dot-product of two vectors gives you a class.", 2, context, Q3()),
          answer("A template for creating a object.", 2, context, Q3())
        ],
      ),
    );
  }
}

class Q3 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: createAppBar("Question 3"),
      body: Column(
        children: <Widget>[
          spacing(20.0),
          createQuestion("Question 3", "If your writing a class does it have to inherit (extend) another class in flutter?", context, 20.0),
          answer("No", 3, context, PRELOAD()),
          answer("Yes", 3, context, PRELOAD()),
        ],
      )
    );
  }
}

class PRELOAD extends StatelessWidget
{
  // AVOIDS Results being called when the page is created!
  // This is a temporary fix until my understanding of WHY
  // the null exception occurs improves
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: createAppBar("PRELOADER"),
      body: Align(
        alignment: Alignment.center,
        child: RaisedButton(
          color: Colors.red,
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(
              builder: (context) => Results())
            ); // goes to next question
          },
          child: Text("View My Results!"),
        )
      )
    );
  }
}

class Results extends StatelessWidget
{
  // perform math to get results
  String finalOutput = calcCorrect();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: createAppBar("Results"),
      body: Align(
        alignment: Alignment.center,
        child: Card(
          child: Text(
            finalOutput
          )
        )
      )
    );
  }
}

RaisedButton answer(String answer, int question, BuildContext context, Widget next)
{
  return new RaisedButton(
    color: Colors.red,
    onPressed: () {
      answers[question - 1] = answer.toUpperCase();
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) => next)
        ); // goes to next question
    },
    child:
      Text(answer),
  );
}

String calcCorrect()
{
    double score = 0;
    for (int i = 0; i < 3; i++)
    {
      debugPrint(answers[i] + " = " + CORRECTANSWERS[i]);
      if (answers[i] == CORRECTANSWERS[i]) {
        score += 1;
      }
    } // Score will be calced.
    score = (score / 3) * 100; // RETURNS %
    return score.toString() + "%";
}