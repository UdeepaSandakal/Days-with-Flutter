import 'package:flashcard/flashCard_View.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flashcard/flashCrad.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcards = [
    Flashcard(question: "Who is the founder of Facebook", answer: "Mark"),
    Flashcard(question: "Who owns the Chat GPT", answer: 'Open AI'),
    Flashcard(
        question: "What is the best Mobile development Framework",
        answer: "Flutter")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashCardView(
                    text: _flashcards[_currentIndex].question,
                  ),
                  back: FlashCardView(
                    text: _flashcards[_currentIndex].answer,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                      onPressed: showPrevCard,
                      icon: Icon(Icons.chevron_left),
                      label: Text('Prev')),
                  OutlinedButton.icon(
                      onPressed: showNextCard,
                      icon: Icon(Icons.chevron_right),
                      label: Text('Next')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex + 1 < _flashcards.length ? _currentIndex + 1 : 0;
    });
  }

  void showPrevCard() {
    setState(() {
      _currentIndex =
          _currentIndex - 1 >= 0 ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
