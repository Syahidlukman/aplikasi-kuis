import '../models/question.dart';

final List<Question> sampleQuestions = [
  Question(
    id: 'q1',
    questionText: 'Apa bahasa pemrograman utama yang digunakan dalam pengembangan Flutter?',
    options: ['Java', 'Kotlin', 'Dart', 'Swift'],
    correctAnswerIndex: 2,
  ),
  Question(
    id: 'q2',
    questionText: 'Widget apa yang digunakan untuk membuat tampilan layout secara vertikal?',
    options: ['Row', 'Column', 'Stack', 'Container'],
    correctAnswerIndex: 1,
  ),
  Question(
    id: 'q3',
    questionText: 'Widget mana yang bersifat IMMUTABLE dan tidak memiliki state internal yang berubah?',
    options: ['StatefulWidget', 'StatelessWidget', 'InheritedWidget', 'Provider'],
    correctAnswerIndex: 1,
  ),
  Question(
    id: 'q4',
    questionText: 'File mana yang digunakan untuk mengelola dependensi dan aset di Flutter?',
    options: ['main.dart', 'pubspec.yaml', 'AndroidManifest.xml', 'build.gradle'],
    correctAnswerIndex: 1,
  ),
];