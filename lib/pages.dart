import 'package:flutter/material.dart';
import 'package:quiz/quizGame.dart';

// Individual Pages
/*
* PURPOSE: to be the homepage
* DATE: 11/05/2019
* NOTES: nil
*/
class HomePage extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
      return Scaffold(
        appBar: createAppBar("Home Page"),
        body: Column(
          children: <Widget>[
            menuItem("Quiz", context, Quiz()),
            menuItem("Hangman", context, Hangman()),
          ],
        ),
      );
    }
}
class Quiz extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: createAppBar("Quiz"),
      body: Column(
        children: <Widget>[
          menuItem("How it works", context, Quiz()),
          menuItem("Example", context, QuizIntroduction()),
        ],
      ),
    );
  }
}
class Hangman extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: createAppBar("Hangman"),
      body: Column(
        children: <Widget>[
          menuItem("How it works", context, Hangman()),
          menuItem("Example", context, Hangman()),
        ]
      )
    );
  }
}



// METHODS
/*
* PURPOSE: To return a appbar with text
* DATE: 11/05/2019
* IMPORT: String title
* EXPORT: appbar page
*/
AppBar createAppBar(String title)
{
  return AppBar(
    title: Text(title),
  );
}
/*
* PURPOSE: To create a menuItem
* DATE: 11/05/2019
* IMPORT: String title
* EXPORT: SizedBox menuItem
*/
SizedBox menuItem(String title, BuildContext context, Widget destination)
{
  double h = 80.0;
  return new SizedBox(
    height: h,
    width: MediaQuery.of(context).size.width,
    child: RaisedButton(
      color: Colors.red, splashColor: Colors.red, textColor: Colors.black,
      child: Text(
        title
      ),
      onPressed: () {
        Navigator.push(context, new MaterialPageRoute(
          builder: (context) => destination)
        );
      },
      // ^^ BUTTON PUSHED
    ),
  );
}
/***************************************************************
 * Purpose: To create a quiz question
 * Date: 12/05/2019
 * IMPORT: String content, Buildcontext context, double fontSize
 * EXPORT Widget quizQuestion
 */
Widget createQuestion(String questionNumber, String content, BuildContext context, double fontSize)
{
  return new Align(
    alignment: Alignment.topCenter,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.80, // 80% screen
      height: MediaQuery.of(context).size.height * 0.30, // 30% screen
      child: Card(
        color: Color(0XFFE36464),
          child: Column(
            children: <Widget>[
              Text(questionNumber, textAlign: TextAlign.center, style: TextStyle(
                color: Color(0xFF64E3DA), fontSize: 40.0, fontWeight: FontWeight.bold,
              )),
              spacing(6.0),
              Text(content, textAlign: TextAlign.center,style: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold
              ))
            ],
          )
      )
    )
  );
}
/***********************************************************
 * Purpose: To create spacing
 * Date: 12/05/2019
 * IMPORT: Double spacing
 * EXPORT Widget Spacing
 */
Container spacing(double spacing)
{
  return new Container(
    height: spacing,
  );
}