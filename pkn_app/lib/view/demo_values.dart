//questions taken from https://opentdb.com
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'category.dart';
import 'question.dart';

const Map<int,dynamic> demoAnswers = {
  0:"Multi Pass",
  1:1,
  2:"Motherboard",
  3:"Cascading Style Sheet",
  4:"Marshmallow",
  5:"140",
  6:"Python",
  7:"True",
  8:"Jakarta"
};

final List<Modul> moduls = [
  Modul(1,"Bab 1", icon: FontAwesomeIcons.bookOpen),
  Modul(2,"Bab 2", icon: FontAwesomeIcons.bookOpen),
  Modul(3,"Bab 3", icon: FontAwesomeIcons.bookOpen),
  Modul(4,"Bab 4", icon: FontAwesomeIcons.bookOpen),
  Modul(5,"Bab 5", icon: FontAwesomeIcons.bookOpen),
  Modul(6,"Bab 6", icon: FontAwesomeIcons.bookOpen),
  Modul(7,"Bab 7", icon: FontAwesomeIcons.bookOpen),
];

final List<Category> categories = [
  Category(1,"Update Theory", icon: FontAwesomeIcons.bookOpen),
  Category(2,"Question", icon: FontAwesomeIcons.question),
  Category(3,"Update Guide", icon: FontAwesomeIcons.bookReader),
  Category(4,"Update About", icon: FontAwesomeIcons.idCard),
];

final List<Category> categoriesUser = [
  Category(1,"Theory", icon: FontAwesomeIcons.bookOpen),
  Category(2,"Quiz", icon: FontAwesomeIcons.gamepad),
  // Category(3,"Guide", icon: FontAwesomeIcons.bookReader),
  Category(4,"About", icon: FontAwesomeIcons.idCard),
];

final List<Question> demoQuestions = Question.fromData([
    {
      "type": "multiple",
      "question": "What does the \"MP\" stand for in MP3?",
      "correct_answer": "Moving Picture",
      "incorrect_answers": [
        "Music Player",
        "Multi Pass",
        "Micro Point"
      ]
    },
    {
      "type": "multiple",
      "question": "What amount of bits commonly equals one byte?",
      "correct_answer": "8",
      "incorrect_answers": [
        "1",
        "2",
        "64"
      ]
    },
    {
      "type": "multiple",
      "question": "Which computer hardware device provides an interface for all other connected devices to communicate?",
      "correct_answer": "Motherboard",
      "incorrect_answers": [
        "Central Processing Unit",
        "Hard Disk Drive",
        "Random Access Memory"
      ]
    },
    {
      "type": "multiple",
      "question": "In web design, what does CSS stand for?",
      "correct_answer": "Cascading Style Sheet",
      "incorrect_answers": [
        "Counter Strike: Source",
        "Corrective Style Sheet",
        "Computer Style Sheet"
      ]
    },
    {
      "type": "multiple",
      "question": "What is the code name for the mobile operating system Android 7.0?",
      "correct_answer": "Nougat",
      "incorrect_answers": [
        "Ice Cream Sandwich",
        "Jelly Bean",
        "Marshmallow"
      ]
    },
    {
      "type": "multiple",
      "question": "On Twitter, what is the character limit for a Tweet?",
      "correct_answer": "140",
      "incorrect_answers": [
        "120",
        "160",
        "100"
      ]
    },
    {
      "type": "multiple",
      "question": "Which computer language would you associate Django framework with?",
      "correct_answer": "Python",
      "incorrect_answers": [
        "C#",
        "C++",
        "Java"
      ]
    },
    {
      "type": "boolean",
      "question": "The Windows 7 operating system has six main editions.",
      "correct_answer": "True",
      "incorrect_answers": [
        "False"
      ]
    },
    {
      "type": "multiple",
      "question": "Which programming language shares its name with an island in Indonesia?",
      "correct_answer": "Java",
      "incorrect_answers": [
        "Python",
        "C",
        "Jakarta"
      ]
    }
  ]);