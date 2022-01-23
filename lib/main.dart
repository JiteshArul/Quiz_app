import 'package:first_project/Question.dart';
import 'package:flutter/material.dart';
import 'button.dart';

void main(List<String> args) => runApp(first_app());

class first_app extends StatefulWidget {
  const first_app({Key? key}) : super(key: key);

  @override
  _first_appState createState() => _first_appState();
}

class _first_appState extends State<first_app> {
  var index = 0;
  int totScore = 0;
  void _updater(int score) {
    totScore = score + totScore;
    setState(() {
      index = index + 1;
    });
    print(index);
  }

  void resetState() {
    setState(() {
      totScore = 0;
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var quest = [
      {
        'questionText': 'Where is the Pyramid of Gaza located?',
        'questionImage': 'Pyramid.jpg',
        'answer1': 'Egypt',
        'answer2': 'Italy',
        'answer3': 'Morocco',
        'answer4': 'France',
        'score1': 1,
        'score2': 0,
        'score3': 0,
        'score4': 0,
      },
      {
        'questionText':
            'How many types of precious stones were used in Taj Mahal?',
        'questionImage': 'Taj_Mahal.jpg',
        'answer1': '12',
        'answer2': '85',
        'answer3': '22',
        'answer4': '53',
        'score1': 0,
        'score2': 0,
        'score3': 1,
        'score4': 0,
      },
      {
        'questionText': 'Where is the Machu Picchu?',
        'questionImage': 'Machu_Picchu.jpg',
        'answer1': 'Paupa New Guinea',
        'answer2': 'Brazil',
        'answer3': 'Peru',
        'answer4': 'Eucador',
        'score1': 0,
        'score2': 0,
        'score3': 1,
        'score4': 0,
      },
    ];
    return MaterialApp(
      home: Scaffold(
          body: index < quest.length
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Image.asset(
                      quest[index]['questionImage'].toString(),
                      fit: BoxFit.fill,
                    )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Question(quest[index]['questionText'].toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(_updater, quest[index]['answer1'].toString(),
                                quest[index]['score1'] as int),
                            Button(_updater, quest[index]['answer2'].toString(),
                                quest[index]['score2'] as int)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(_updater, quest[index]['answer3'].toString(),
                                quest[index]['score3'] as int),
                            Button(_updater, quest[index]['answer4'].toString(),
                                quest[index]['score4'] as int)
                          ],
                        )
                      ],
                    )
                  ],
                )
              : Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Question("Successfully Completed"),
                    Question("Correct"),
                    Question(totScore.toString()),
                    Question("Out of"),
                    Question(quest.length.toString()),
                    Question("Answers"),
                    TextButton(
                      onPressed: resetState,
                      child: Text(
                        "Retry",
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ],
                ))),
    );
  }
}
